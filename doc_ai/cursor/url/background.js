// 初始化扩展
chrome.runtime.onInstalled.addListener(async () => {
  console.log('请求修改器已安装/更新');
  // 创建初始的空规则文件
  await createEmptyRulesFile();
  
  // 展示安装成功通知
  chrome.runtime.sendMessage({
    action: 'showNotification',
    message: '请求修改器已安装成功！在使用前请添加规则并重启浏览器。'
  });
});

// 监听来自弹出页面的消息
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.action === 'updateRules') {
    console.log('收到更新规则请求:', message.rules);
    updateRules(message.rules).then(() => {
      sendResponse({success: true});
    }).catch(error => {
      console.error('更新规则失败:', error);
      sendResponse({success: false, error: error.message});
    });
    return true; // 表示将异步发送响应
  }
});

// 创建空的规则文件
async function createEmptyRulesFile() {
  const rules = [];
  await updateRules(rules);
}

// 打印所有当前活动的规则（用于调试）
async function logActiveRules() {
  try {
    const currentRules = await chrome.declarativeNetRequest.getDynamicRules();
    console.log('当前活动规则:', currentRules);
  } catch (error) {
    console.error('获取活动规则失败:', error);
  }
}

// 提取URL中的域名部分和路径部分
function extractUrlParts(url) {
  // 移除协议前缀
  const withoutProtocol = url.replace(/^https?:\/\//, '');
  
  // 查找第一个斜杠的位置
  const firstSlashIndex = withoutProtocol.indexOf('/');
  
  if (firstSlashIndex === -1) {
    // 没有路径，只有域名
    return {
      domain: withoutProtocol,
      path: ''
    };
  } else {
    // 有域名和路径
    return {
      domain: withoutProtocol.substring(0, firstSlashIndex),
      path: withoutProtocol.substring(firstSlashIndex)
    };
  }
}

// 更新规则
async function updateRules(ipRules) {
  // 检索现有规则
  const currentRules = await chrome.declarativeNetRequest.getDynamicRules();
  const currentRuleIds = currentRules.map(rule => rule.id);
  
  console.log('现有规则:', currentRules);
  console.log('要应用的规则:', ipRules);
  
  // 构建新规则 - 只包含启用的规则
  const newRules = ipRules
    .filter(rule => rule.enabled)
    .map((rule, index) => {
      // 如果是路径规则类型
      if (rule.type === 'path') {
        // 确保sourcePath不包含协议前缀
        let sourcePath = rule.sourcePath;
        if (sourcePath.startsWith('http://') || sourcePath.startsWith('https://')) {
          sourcePath = sourcePath.replace(/^https?:\/\//, '');
        }
        
        // 确保targetUrl有协议前缀
        let targetUrl = rule.targetUrl;
        if (!targetUrl.startsWith('http://') && !targetUrl.startsWith('https://')) {
          targetUrl = 'http://' + targetUrl;
        }
        
        // 移除targetUrl末尾的斜杠
        targetUrl = targetUrl.replace(/\/$/, '');
        
        // 分析源路径
        const urlParts = extractUrlParts(sourcePath);
        const domain = urlParts.domain;
        const pathPart = urlParts.path;
        
        console.log(`详细路径分析 - 域名: ${domain}, 路径: ${pathPart}`);
        
        // 构建重定向规则
        let redirectUrl;
        
        if (rule.keepPath && pathPart) {
          // 保留路径模式: 将接口部分添加到目标URL后
          redirectUrl = `${targetUrl}${pathPart}\\1`;
          console.log(`创建保留路径规则: ${sourcePath} -> ${targetUrl}${pathPart}[接口路径]`);
        } else {
          // 不保留路径模式: 直接将接口部分附加到目标URL
          redirectUrl = `${targetUrl}\\1`;
          console.log(`创建不保留路径规则: ${sourcePath} -> ${targetUrl}[接口路径]`);
        }
        
        return {
          id: rule.id,
          priority: 100, // 提高优先级
          action: {
            type: 'redirect',
            redirect: {
              regexSubstitution: redirectUrl
            }
          },
          condition: {
            // 精确匹配源URL，将pathPart后面的部分作为接口路径捕获
            regexFilter: pathPart 
              ? `^https?://${escapeRegExp(domain)}${escapeRegExp(pathPart)}(.*)$`
              : `^https?://${escapeRegExp(domain)}(.*)$`,
            resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'webtransport', 'webbundle']
          }
        };
      } else {
        // 原来的IP规则类型
        console.log(`创建IP规则: ${rule.sourceIp} -> ${rule.targetIp}`);
        return {
          id: rule.id,
          priority: 1,
          action: {
            type: 'redirect',
            redirect: {
              regexSubstitution: `\\1${rule.targetIp}\\3`,
            }
          },
          condition: {
            regexFilter: `^(https?://)(${escapeRegExp(rule.sourceIp)})(.*?)$`,
            resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'webtransport', 'webbundle']
          }
        };
      }
    });

  // 添加修改响应头的规则，解决CORS问题
  const corsRuleId = 999999; // 使用一个大数字作为CORS规则ID
  
  // 检查是否已存在CORS规则
  if (!currentRuleIds.includes(corsRuleId) && ipRules.some(rule => rule.enabled)) {
    console.log('添加CORS处理规则');
    newRules.push({
      id: corsRuleId,
      priority: 100, // 高优先级，确保在重定向后应用
      action: {
        type: "modifyHeaders",
        responseHeaders: [
          { 
            header: "Access-Control-Allow-Origin", 
            operation: "set", 
            value: "*" 
          },
          { 
            header: "Access-Control-Allow-Methods", 
            operation: "set", 
            value: "GET, PUT, POST, DELETE, HEAD, OPTIONS, PATCH" 
          },
          { 
            header: "Access-Control-Allow-Headers", 
            operation: "set", 
            value: "Origin, X-Requested-With, Content-Type, Accept, Authorization, clientid, token" 
          },
          { 
            header: "Access-Control-Allow-Credentials", 
            operation: "set", 
            value: "true" 
          }
        ]
      },
      condition: {
        resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'webtransport', 'webbundle'],
        domains: ["127.0.0.1", "localhost"]
      }
    });
  }
  
  console.log('准备应用的规则:', newRules);
  
  // 移除所有现有规则并添加新规则
  await chrome.declarativeNetRequest.updateDynamicRules({
    removeRuleIds: currentRuleIds,
    addRules: newRules
  });
  
  // 将规则写入本地存储以便在重启后恢复
  chrome.storage.local.set({dynamicRules: newRules});
  
  console.log(`已应用${newRules.length}条规则，总共${ipRules.length}条规则`);
  
  // 记录已经应用的规则
  await logActiveRules();
  
  return true;
}

// 辅助函数：转义正则表达式特殊字符
function escapeRegExp(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

// 在启动时从存储中恢复规则
chrome.runtime.onStartup.addListener(async () => {
  console.log('插件启动，开始恢复规则');
  try {
    const result = await chrome.storage.sync.get(['ipRules']);
    if (result.ipRules && result.ipRules.length > 0) {
      await updateRules(result.ipRules);
      console.log('已恢复规则:', result.ipRules.length);
      
      // 记录当前活动的规则
      await logActiveRules();
    } else {
      console.log('没有找到保存的规则');
    }
  } catch (error) {
    console.error('恢复规则失败:', error);
  }
});

// 监听规则匹配事件，用于调试
chrome.declarativeNetRequest.onRuleMatchedDebug?.addListener(
  ({ request, rule }) => {
    console.log(
      `规则 ${rule.ruleId} 匹配请求 ${request.url}`,
      {rule, request}
    );
  }
); 