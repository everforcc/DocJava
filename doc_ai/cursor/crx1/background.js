// 初始化时加载保存的设置
chrome.storage.local.get(['sourceUrl', 'targetUrl'], function(result) {
  if (result.sourceUrl && result.targetUrl) {
    updateRules(result.sourceUrl, result.targetUrl);
  }
});

// 监听来自popup的消息
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.action === 'updateRules') {
    updateRules(message.sourceUrl, message.targetUrl);
  }
});

function updateRules(sourceUrl, targetUrl) {
  // 移除旧的规则
  chrome.declarativeNetRequest.updateDynamicRules({
    removeRuleIds: [1, 2]  // 添加规则2用于日志记录
  }, () => {
    // 添加新的规则
    const sourceUrlObj = new URL(sourceUrl);
    const targetUrlObj = new URL(targetUrl);

    chrome.declarativeNetRequest.updateDynamicRules({
      addRules: [
        {
          id: 1,
          priority: 1,
          action: {
            type: 'redirect',
            redirect: {
              transform: {
                scheme: targetUrlObj.protocol.replace(':', ''),
                host: targetUrlObj.hostname,
                port: targetUrlObj.port
              }
            }
          },
          condition: {
            urlFilter: sourceUrlObj.hostname + (sourceUrlObj.port ? ':' + sourceUrlObj.port : ''),
            resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'other']
          }
        },
        {
          id: 2,
          priority: 2,
          action: {
            type: 'modifyHeaders',
            responseHeaders: [
              {
                header: 'X-Request-Forwarded',
                operation: 'set',
                value: 'true'
              }
            ]
          },
          condition: {
            urlFilter: sourceUrlObj.hostname + (sourceUrlObj.port ? ':' + sourceUrlObj.port : ''),
            resourceTypes: ['main_frame', 'sub_frame', 'stylesheet', 'script', 'image', 'font', 'object', 'xmlhttprequest', 'ping', 'csp_report', 'media', 'websocket', 'other']
          }
        }
      ]
    });
  });
}

// 监听规则匹配事件来记录日志
chrome.declarativeNetRequest.onRuleMatchedDebug?.addListener((info) => {
  if (info.rule.ruleId === 1) {
    console.log('请求已转发:', info.request.url);
  }
}); 