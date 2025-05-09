document.addEventListener('DOMContentLoaded', function() {
  const addIpRuleButton = document.getElementById('add-ip-rule');
  const addPathRuleButton = document.getElementById('add-path-rule');
  const saveRulesButton = document.getElementById('save-rules');
  const confirmRuleButton = document.getElementById('confirm-rule');
  const rulesContainer = document.getElementById('rules-container');

  // 新增：页面加载时从存储中读取并显示规则
  chrome.storage.sync.get(['rules'], function(result) {
    if (result.rules && result.rules.length > 0) {
      result.rules.forEach(rule => {
        if (rule.type === 'ip') {
          const ruleHtml = `
            <div class="rule">
              <h3>IP规则</h3>
              <label>源IP: <input type="text" class="source-ip" value="${rule.source}"></label>
              <label>目标IP: <input type="text" class="target-ip" value="${rule.target}"></label>
              <button class="remove-rule">删除规则</button>
            </div>
          `;
          rulesContainer.insertAdjacentHTML('beforeend', ruleHtml);
        } else if (rule.type === 'path') {
          const ruleHtml = `
            <div class="rule">
              <h3>路径规则</h3>
              <label>源路径: <input type="text" class="source-path" value="${rule.source}"></label>
              <label>目标URL: <input type="text" class="target-url" value="${rule.target}"></label>
              <label>保留路径: <input type="checkbox" class="keep-path" ${rule.keepPath ? 'checked' : ''}></label>
              <button class="remove-rule">删除规则</button>
            </div>
          `;
          rulesContainer.insertAdjacentHTML('beforeend', ruleHtml);
        }
      });
    }
  });

  // 新增：为删除按钮添加事件监听器
  rulesContainer.addEventListener('click', function(event) {
    if (event.target.classList.contains('remove-rule')) {
      const ruleElement = event.target.closest('.rule');
      ruleElement.remove();
      confirmRuleButton.style.display = 'inline-block';
    }
  });

  addIpRuleButton.addEventListener('click', () => {
    const ruleHtml = `
      <div class="rule">
        <h3>IP规则</h3>
        <label>源IP: <input type="text" class="source-ip"></label>
        <label>目标IP: <input type="text" class="target-ip"></label>
        <button class="remove-rule">删除规则</button>
      </div>
    `;
    rulesContainer.insertAdjacentHTML('beforeend', ruleHtml);
    confirmRuleButton.style.display = 'inline-block';
  });

  addPathRuleButton.addEventListener('click', () => {
    const ruleHtml = `
      <div class="rule">
        <h3>路径规则</h3>
        <label>源路径: <input type="text" class="source-path"></label>
        <label>目标URL: <input type="text" class="target-url"></label>
        <label>保留路径: <input type="checkbox" class="keep-path"></label>
        <button class="remove-rule">删除规则</button>
      </div>
    `;
    rulesContainer.insertAdjacentHTML('beforeend', ruleHtml);
    confirmRuleButton.style.display = 'inline-block';
  });

  confirmRuleButton.addEventListener('click', () => {
    const rules = [];
    const ruleElements = rulesContainer.querySelectorAll('.rule');
    ruleElements.forEach(ruleElement => {
      const rule = {};
      if (ruleElement.querySelector('.source-ip')) {
        rule.type = 'ip';
        rule.source = ruleElement.querySelector('.source-ip').value;
        rule.target = ruleElement.querySelector('.target-ip').value;
      } else if (ruleElement.querySelector('.source-path')) {
        rule.type = 'path';
        rule.source = ruleElement.querySelector('.source-path').value;
        rule.target = ruleElement.querySelector('.target-url').value;
        rule.keepPath = ruleElement.querySelector('.keep-path').checked;
      }
      rules.push(rule);
    });
    chrome.storage.sync.set({ rules: rules }, () => {
      console.log('Rules saved:', rules);
      alert('规则已保存！');
      confirmRuleButton.style.display = 'none';
      // 立即更新 declarativeNetRequest 规则
      chrome.runtime.sendMessage({ action: 'updateRules', rules: rules });
    });
  });

  // 新增：监听规则更新请求
  if (chrome.runtime && chrome.runtime.onMessage) {
    chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
      if (message.action === 'updateRules') {
        updateDeclarativeNetRequestRules(message.rules);
      }
    });
  } else {
    console.error('chrome.runtime.onMessage is not defined');
  }

  saveRulesButton.addEventListener('click', () => {
    const rules = [];
    // ... existing code to collect and save rules ...
  });
});