// 添加调试信息，确保 Service Worker 已启动
console.log('Service Worker started');

// 确保 chrome.runtime 已定义
if (chrome.runtime) {
  chrome.runtime.onInstalled.addListener(() => {
    console.log('Extension installed, initializing rules');
    chrome.storage.sync.set({ rules: [] });
  });

  chrome.declarativeNetRequest.onRuleMatchedDebug.addListener((info) => {
    console.log('Rule matched:', info);
  });

  // 添加规则更新监听器
  chrome.storage.onChanged.addListener((changes, namespace) => {
    if (namespace === 'sync' && changes.rules) {
      console.log('Rules changed, updating declarativeNetRequest rules');
      const newRules = changes.rules.newValue;
      updateDeclarativeNetRequestRules(newRules);
    }
  });

  // 更新 declarativeNetRequest 规则
  function updateDeclarativeNetRequestRules(rules) {
    console.log('Updating rules:', rules);
    const ruleIds = rules.map((_, index) => index + 1);
    chrome.declarativeNetRequest.updateDynamicRules({
      removeRuleIds: ruleIds,
      addRules: rules.map((rule, index) => ({
        id: index + 1,
        priority: 1,
        action: {
          type: 'redirect',
          redirect: {
            url: rule.type === 'ip' ? 
                 `http://${rule.target}` : 
                 `http://${rule.target}${rule.keepPath ? rule.source.split('/').slice(1).join('/') : ''}`
          }
        },
        condition: {
          urlFilter: rule.type === 'ip' ? 
                    `http://${rule.source}` : 
                    `http://${rule.source}`,
          resourceTypes: ['main_frame', 'sub_frame', 'xmlhttprequest', 'script', 'stylesheet', 'image', 'font', 'other']
        }
      }))
    }, () => {
      if (chrome.runtime.lastError) {
        console.error('Error updating rules:', chrome.runtime.lastError);
      } else {
        console.log('Rules updated successfully');
        chrome.declarativeNetRequest.getDynamicRules((rules) => {
          console.log('Current dynamic rules:', rules);
        });
      }
    });
  }

  // 新增：确保 Service Worker 保持活跃
  chrome.runtime.onStartup.addListener(() => {
    console.log('Extension started, ensuring Service Worker is active');
  });

  chrome.runtime.onSuspend.addListener(() => {
    console.log('Service Worker is about to be suspended');
  });

  chrome.runtime.onSuspendCanceled.addListener(() => {
    console.log('Service Worker suspension canceled');
  });

  // 新增：确保 chrome.runtime.onMessage 已定义
  if (chrome.runtime && chrome.runtime.onMessage) {
    chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
      if (message.action === 'updateRules') {
        updateDeclarativeNetRequestRules(message.rules);
      }
    });
  } else {
    console.error('chrome.runtime.onMessage is not defined');
  }
} else {
  console.error('chrome.runtime is not defined');
}