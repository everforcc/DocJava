// 初始化时加载保存的设置
chrome.storage.local.get(['sourceUrl', 'targetUrl', 'headerRules'], function(result) {
  if (result.sourceUrl && result.targetUrl) {
    updateRules(result.sourceUrl, result.targetUrl, result.headerRules || []);
  }
});

// 监听来自popup的消息
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.action === 'updateRules') {
    updateRules(message.sourceUrl, message.targetUrl, message.headerRules || []);
    sendResponse({ success: true });
  }
  return true; // 保持消息通道开放
});

function updateRules(sourceUrl, targetUrl, headerRules) {
  // 移除旧的规则
  const removeRuleIds = [1, 2];
  for (let i = 3; i <= 100; i++) { // 为请求头规则预留规则ID
    removeRuleIds.push(i);
  }
  
  chrome.declarativeNetRequest.updateDynamicRules({
    removeRuleIds: removeRuleIds
  }, () => {
    // 添加新的规则
    const sourceUrlObj = new URL(sourceUrl);
    const targetUrlObj = new URL(targetUrl);
    const rules = [];

    // 添加重定向规则
    rules.push({
      id: 1,
      priority: 1,
      action: {
        type: 'redirect',
        redirect: {
          regexSubstitution: targetUrlObj.origin + '/\\1'
        }
      },
      condition: {
        regexFilter: sourceUrlObj.origin + sourceUrlObj.pathname + '(.*)',
        resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'other']
      }
    });

    // 添加请求头规则
    headerRules.forEach((rule, index) => {
      // 为源地址添加请求头
      rules.push({
        id: index + 3,
        priority: 2,
        action: {
          type: 'modifyHeaders',
          requestHeaders: [
            {
              header: rule.key,
              operation: 'set',
              value: rule.value
            }
          ]
        },
        condition: {
          regexFilter: sourceUrlObj.origin + sourceUrlObj.pathname + '.*',
          resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'other']
        }
      });

      // 为目标地址添加相同的请求头
      rules.push({
        id: index + 50, // 使用不同的ID范围
        priority: 2,
        action: {
          type: 'modifyHeaders',
          requestHeaders: [
            {
              header: rule.key,
              operation: 'set',
              value: rule.value
            }
          ]
        },
        condition: {
          regexFilter: targetUrlObj.origin + '.*',
          resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'other']
        }
      });
    });

    // 添加一个规则来保留原始请求头
    rules.push({
      id: 100,
      priority: 3,
      action: {
        type: 'modifyHeaders',
        requestHeaders: [
          {
            header: 'X-Original-Host',
            operation: 'set',
            value: sourceUrlObj.hostname
          },
          {
            header: 'X-Original-Path',
            operation: 'set',
            value: sourceUrlObj.pathname
          }
        ]
      },
      condition: {
        regexFilter: sourceUrlObj.origin + sourceUrlObj.pathname + '.*',
        resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'other']
      }
    });

    chrome.declarativeNetRequest.updateDynamicRules({
      addRules: rules
    }, () => {
      if (chrome.runtime.lastError) {
        console.error('更新规则失败:', chrome.runtime.lastError);
      } else {
        console.log('规则更新成功');
      }
    });
  });
}

// 监听规则匹配事件来记录日志
chrome.declarativeNetRequest.onRuleMatchedDebug?.addListener((info) => {
  if (info.rule.ruleId === 1) {
    console.log('请求已转发:', info.request.url);
  } else if (info.rule.ruleId >= 3 && info.rule.ruleId < 50) {
    console.log('源地址请求头已修改:', info.request.url);
  } else if (info.rule.ruleId >= 50 && info.rule.ruleId < 100) {
    console.log('目标地址请求头已修改:', info.request.url);
  }
}); 