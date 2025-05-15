document.addEventListener('DOMContentLoaded', function() {
  const sourceUrlInput = document.getElementById('sourceUrl');
  const targetUrlInput = document.getElementById('targetUrl');
  const saveButton = document.getElementById('saveButton');
  const statusDiv = document.getElementById('status');
  const headerRulesContainer = document.getElementById('headerRulesContainer');
  const addHeaderBtn = document.getElementById('addHeaderBtn');

  // 加载保存的设置
  chrome.storage.local.get(['sourceUrl', 'targetUrl', 'headerRules'], function(result) {
    if (result.sourceUrl) sourceUrlInput.value = result.sourceUrl;
    if (result.targetUrl) targetUrlInput.value = result.targetUrl;
    if (result.headerRules) {
      result.headerRules.forEach(rule => addHeaderRuleInput(rule.key, rule.value));
    }
  });

  // 添加请求头规则按钮点击事件
  addHeaderBtn.addEventListener('click', function() {
    addHeaderRuleInput();
  });

  // 添加请求头规则输入框
  function addHeaderRuleInput(key = '', value = '') {
    const ruleDiv = document.createElement('div');
    ruleDiv.className = 'header-rule';
    
    const keyInput = document.createElement('input');
    keyInput.type = 'text';
    keyInput.placeholder = '请求头名称';
    keyInput.value = key;
    
    const valueInput = document.createElement('input');
    valueInput.type = 'text';
    valueInput.placeholder = '请求头值';
    valueInput.value = value;
    
    const deleteBtn = document.createElement('button');
    deleteBtn.textContent = '删除';
    deleteBtn.addEventListener('click', function() {
      ruleDiv.remove();
    });
    
    ruleDiv.appendChild(keyInput);
    ruleDiv.appendChild(valueInput);
    ruleDiv.appendChild(deleteBtn);
    headerRulesContainer.appendChild(ruleDiv);
  }

  // 保存设置
  saveButton.addEventListener('click', function() {
    const sourceUrl = sourceUrlInput.value.trim();
    const targetUrl = targetUrlInput.value.trim();

    if (!sourceUrl || !targetUrl) {
      showStatus('请填写完整的源地址和目标地址', 'error');
      return;
    }

    try {
      new URL(sourceUrl);
      new URL(targetUrl);
    } catch (e) {
      showStatus('请输入有效的URL地址', 'error');
      return;
    }

    // 收集所有请求头规则
    const headerRules = [];
    const ruleDivs = headerRulesContainer.getElementsByClassName('header-rule');
    for (let div of ruleDivs) {
      const inputs = div.getElementsByTagName('input');
      const key = inputs[0].value.trim();
      const value = inputs[1].value.trim();
      if (key && value) {
        headerRules.push({ key, value });
      }
    }

    chrome.storage.local.set({
      sourceUrl: sourceUrl,
      targetUrl: targetUrl,
      headerRules: headerRules
    }, function() {
      showStatus('设置已保存', 'success');
      
      // 通知background.js更新规则
      chrome.runtime.sendMessage({
        action: 'updateRules',
        sourceUrl: sourceUrl,
        targetUrl: targetUrl,
        headerRules: headerRules
      }, function(response) {
        if (chrome.runtime.lastError) {
          showStatus('保存失败：' + chrome.runtime.lastError.message, 'error');
        } else if (response && response.success) {
          showStatus('设置已保存并生效', 'success');
        } else {
          showStatus('保存失败，请重试', 'error');
        }
      });
    });
  });

  function showStatus(message, type) {
    statusDiv.textContent = message;
    statusDiv.className = 'status ' + type;
    statusDiv.style.display = 'block';
    setTimeout(() => {
      statusDiv.style.display = 'none';
    }, 3000);
  }
}); 