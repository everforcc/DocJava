document.addEventListener('DOMContentLoaded', function() {
  const rulesContainer = document.getElementById('rules-container');
  const addIpRuleBtn = document.getElementById('add-ip-rule-btn');
  const addPathRuleBtn = document.getElementById('add-path-rule-btn');
  const saveRulesBtn = document.getElementById('save-rules-btn');
  const statusDiv = document.getElementById('status');
  
  let ruleCount = 0;
  
  // 添加示例按钮
  const addExampleBtn = document.createElement('button');
  addExampleBtn.textContent = '添加接口转发示例';
  addExampleBtn.style.backgroundColor = '#4CAF50';
  addExampleBtn.style.marginLeft = '10px';
  document.querySelector('.add-rule').appendChild(addExampleBtn);
  
  // 添加不保留路径的示例按钮
  const addNoPathBtn = document.createElement('button');
  addNoPathBtn.textContent = '添加不保留路径示例';
  addNoPathBtn.style.backgroundColor = '#FF9800';
  addNoPathBtn.style.marginLeft = '10px';
  document.querySelector('.add-rule').appendChild(addNoPathBtn);
  
  // 添加示例事件
  addExampleBtn.addEventListener('click', function() {
    addPathRuleFields('192.168.0.6/prod-api', '127.0.0.1:8080', true, true);
  });
  
  // 添加不保留路径的示例事件
  addNoPathBtn.addEventListener('click', function() {
    addPathRuleFields('192.168.0.6/prod-api', '127.0.0.1:8080', false, true);
  });
  
  // 加载保存的规则
  chrome.storage.sync.get(['ipRules'], function(result) {
    if (result.ipRules && result.ipRules.length > 0) {
      result.ipRules.forEach(rule => {
        if (rule.type === 'path') {
          addPathRuleFields(rule.sourcePath, rule.targetUrl, rule.keepPath, rule.enabled);
        } else {
          addIpRuleFields(rule.sourceIp, rule.targetIp, rule.enabled);
        }
      });
    } else {
      // 没有保存的规则，添加一个默认的空规则
      addPathRuleFields('192.168.0.6/prod-api', '127.0.0.1:8080', false, true);
    }
  });
  
  // 添加IP规则输入字段
  function addIpRuleFields(sourceIp = '', targetIp = '', enabled = true) {
    const ruleId = ruleCount++;
    const ruleDiv = document.createElement('div');
    ruleDiv.className = 'rule-item';
    ruleDiv.dataset.id = ruleId;
    ruleDiv.dataset.type = 'ip';
    
    ruleDiv.innerHTML = `
      <div class="rule-type-selector">
        <label>规则类型:</label>
        <select class="rule-type">
          <option value="ip" selected>IP规则</option>
          <option value="path">路径规则</option>
        </select>
      </div>
      <div class="rule-inputs">
        <label class="switch">
          <input type="checkbox" class="rule-enabled" ${enabled ? 'checked' : ''}>
          <span class="slider"></span>
        </label>
        <input type="text" class="source-ip" placeholder="源IP (如: 127.0.0.1)" value="${sourceIp}" />
        <input type="text" class="target-ip" placeholder="目标IP (如: 192.168.1.100)" value="${targetIp}" />
        <button class="delete-btn">删除</button>
      </div>
    `;
    
    rulesContainer.appendChild(ruleDiv);
    
    // 为删除按钮添加事件监听
    ruleDiv.querySelector('.delete-btn').addEventListener('click', function() {
      rulesContainer.removeChild(ruleDiv);
    });
    
    // 为规则类型选择器添加事件监听
    ruleDiv.querySelector('.rule-type').addEventListener('change', function(e) {
      const type = e.target.value;
      const item = ruleDiv;
      
      if (type === 'path') {
        convertToPathRule(item);
      }
    });
  }
  
  // 添加路径规则输入字段
  function addPathRuleFields(sourcePath = '', targetUrl = '', keepPath = false, enabled = true) {
    const ruleId = ruleCount++;
    const ruleDiv = document.createElement('div');
    ruleDiv.className = 'rule-item';
    ruleDiv.dataset.id = ruleId;
    ruleDiv.dataset.type = 'path';
    
    ruleDiv.innerHTML = `
      <div class="rule-type-selector">
        <label>规则类型:</label>
        <select class="rule-type">
          <option value="ip">IP规则</option>
          <option value="path" selected>路径规则</option>
        </select>
      </div>
      <div class="rule-path-inputs">
        <label class="switch">
          <input type="checkbox" class="rule-enabled" ${enabled ? 'checked' : ''}>
          <span class="slider"></span>
        </label>
        <input type="text" class="source-path" placeholder="源路径 (如: 192.168.0.6/prod-api，不要包含http://)" value="${sourcePath}" />
        <input type="text" class="target-url" placeholder="目标URL (如: 127.0.0.1:8080，会自动添加http://)" value="${targetUrl}" />
        <div class="keep-path">
          <input type="checkbox" class="keep-path-checkbox" id="keep-path-${ruleId}" ${keepPath ? 'checked' : ''}>
          <label for="keep-path-${ruleId}">保留路径</label>
        </div>
        <button class="delete-btn">删除</button>
      </div>
      <div class="rule-hint" style="margin: 5px 0; font-size: 12px; color: #666; padding-left: 50px;">
        ${getExampleText(sourcePath, targetUrl, keepPath)}
      </div>
    `;
    
    rulesContainer.appendChild(ruleDiv);
    
    // 为删除按钮添加事件监听
    ruleDiv.querySelector('.delete-btn').addEventListener('click', function() {
      rulesContainer.removeChild(ruleDiv);
    });
    
    // 为规则类型选择器添加事件监听
    ruleDiv.querySelector('.rule-type').addEventListener('change', function(e) {
      const type = e.target.value;
      const item = ruleDiv;
      
      if (type === 'ip') {
        convertToIpRule(item);
      }
    });
    
    // 源路径和目标URL的实时预览
    const sourcePath_input = ruleDiv.querySelector('.source-path');
    const targetUrl_input = ruleDiv.querySelector('.target-url');
    const keepPath_input = ruleDiv.querySelector('.keep-path-checkbox');
    
    // 更新预览
    function updatePreview() {
      const source = sourcePath_input.value.trim();
      const target = targetUrl_input.value.trim();
      const keep = keepPath_input.checked;
      
      ruleDiv.querySelector('.rule-hint').innerHTML = getExampleText(source, target, keep);
    }
    
    sourcePath_input.addEventListener('input', updatePreview);
    targetUrl_input.addEventListener('input', updatePreview);
    keepPath_input.addEventListener('change', updatePreview);
  }
  
  // 生成示例文本
  function getExampleText(sourcePath, targetUrl, keepPath) {
    if (!sourcePath || !targetUrl) {
      return '填写源路径和目标URL后将显示示例';
    }
    
    const slashIndex = sourcePath.indexOf('/');
    let domain = sourcePath;
    let pathPart = '';
    
    if (slashIndex !== -1) {
      domain = sourcePath.substring(0, slashIndex);
      pathPart = sourcePath.substring(slashIndex);
    }
    
    const sourceExample = `http://${sourcePath}/system/user/getInfo`;
    let targetExample;
    
    if (keepPath) {
      targetExample = `http://${targetUrl}${pathPart}/system/user/getInfo`;
    } else {
      targetExample = `http://${targetUrl}/system/user/getInfo`;
    }
    
    return `例: <code>${sourceExample}</code> → <code>${targetExample}</code>`;
  }
  
  // 将IP规则转换为路径规则
  function convertToPathRule(ruleItem) {
    const enabled = ruleItem.querySelector('.rule-enabled').checked;
    ruleItem.dataset.type = 'path';
    
    // 保存原规则的输入框的内容
    const sourceIp = ruleItem.querySelector('.source-ip').value;
    
    // 替换规则输入区域
    const inputsDiv = ruleItem.querySelector('.rule-inputs');
    const newInputsDiv = document.createElement('div');
    newInputsDiv.className = 'rule-path-inputs';
    const ruleId = ruleItem.dataset.id;
    
    newInputsDiv.innerHTML = `
      <label class="switch">
        <input type="checkbox" class="rule-enabled" ${enabled ? 'checked' : ''}>
        <span class="slider"></span>
      </label>
      <input type="text" class="source-path" placeholder="源路径 (如: 192.168.0.6/prod-api，不要包含http://)" value="${sourceIp ? sourceIp : ''}" />
      <input type="text" class="target-url" placeholder="目标URL (如: 127.0.0.1:8080，会自动添加http://)" />
      <div class="keep-path">
        <input type="checkbox" class="keep-path-checkbox" id="keep-path-${ruleId}">
        <label for="keep-path-${ruleId}">保留路径</label>
      </div>
      <button class="delete-btn">删除</button>
    `;
    
    ruleItem.replaceChild(newInputsDiv, inputsDiv);
    
    // 添加预览提示
    const hintDiv = document.createElement('div');
    hintDiv.className = 'rule-hint';
    hintDiv.style = 'margin: 5px 0; font-size: 12px; color: #666; padding-left: 50px;';
    hintDiv.innerHTML = '填写源路径和目标URL后将显示示例';
    ruleItem.appendChild(hintDiv);
    
    // 为新的删除按钮添加事件监听
    ruleItem.querySelector('.delete-btn').addEventListener('click', function() {
      rulesContainer.removeChild(ruleItem);
    });
    
    // 源路径和目标URL的实时预览
    const sourcePath_input = ruleItem.querySelector('.source-path');
    const targetUrl_input = ruleItem.querySelector('.target-url');
    const keepPath_input = ruleItem.querySelector('.keep-path-checkbox');
    
    // 更新预览
    function updatePreview() {
      const source = sourcePath_input.value.trim();
      const target = targetUrl_input.value.trim();
      const keep = keepPath_input.checked;
      
      hintDiv.innerHTML = getExampleText(source, target, keep);
    }
    
    sourcePath_input.addEventListener('input', updatePreview);
    targetUrl_input.addEventListener('input', updatePreview);
    keepPath_input.addEventListener('change', updatePreview);
  }
  
  // 将路径规则转换为IP规则
  function convertToIpRule(ruleItem) {
    const enabled = ruleItem.querySelector('.rule-enabled').checked;
    ruleItem.dataset.type = 'ip';
    
    // 保存原规则的输入框的内容
    const sourcePath = ruleItem.querySelector('.source-path').value;
    
    // 替换规则输入区域
    const inputsDiv = ruleItem.querySelector('.rule-path-inputs');
    const newInputsDiv = document.createElement('div');
    newInputsDiv.className = 'rule-inputs';
    
    newInputsDiv.innerHTML = `
      <label class="switch">
        <input type="checkbox" class="rule-enabled" ${enabled ? 'checked' : ''}>
        <span class="slider"></span>
      </label>
      <input type="text" class="source-ip" placeholder="源IP (如: 127.0.0.1)" value="${sourcePath ? sourcePath.split('/')[0] : ''}" />
      <input type="text" class="target-ip" placeholder="目标IP (如: 192.168.1.100)" />
      <button class="delete-btn">删除</button>
    `;
    
    ruleItem.replaceChild(newInputsDiv, inputsDiv);
    
    // 移除预览提示（如果存在）
    const hintDiv = ruleItem.querySelector('.rule-hint');
    if (hintDiv) {
      ruleItem.removeChild(hintDiv);
    }
    
    // 为新的删除按钮添加事件监听
    ruleItem.querySelector('.delete-btn').addEventListener('click', function() {
      rulesContainer.removeChild(ruleItem);
    });
  }
  
  // 添加IP规则按钮事件
  addIpRuleBtn.addEventListener('click', function() {
    addIpRuleFields();
  });
  
  // 添加路径规则按钮事件
  addPathRuleBtn.addEventListener('click', function() {
    addPathRuleFields();
  });
  
  // 保存规则按钮事件
  saveRulesBtn.addEventListener('click', function() {
    const ruleItems = document.querySelectorAll('.rule-item');
    const rules = [];
    
    ruleItems.forEach((item, index) => {
      const type = item.dataset.type;
      const enabled = item.querySelector('.rule-enabled').checked;
      
      if (type === 'ip') {
        const sourceIp = item.querySelector('.source-ip').value.trim();
        const targetIp = item.querySelector('.target-ip').value.trim();
        
        if (sourceIp && targetIp) {
          rules.push({
            id: index + 1,
            type: 'ip',
            sourceIp: sourceIp,
            targetIp: targetIp,
            enabled: enabled
          });
        }
      } else if (type === 'path') {
        let sourcePath = item.querySelector('.source-path').value.trim();
        let targetUrl = item.querySelector('.target-url').value.trim();
        const keepPath = item.querySelector('.keep-path-checkbox').checked;
        
        // 移除源路径中可能的http前缀
        sourcePath = sourcePath.replace(/^https?:\/\//, '');
        
        // 确保路径格式正确
        if (sourcePath.indexOf('/') === -1) {
          // 如果用户只输入了域名/IP，添加尾部斜杠
          sourcePath = sourcePath + '/';
        }
        
        // 处理targetUrl，确保格式正确
        targetUrl = targetUrl.replace(/^https?:\/\//, '').replace(/\/$/, '');
        
        if (sourcePath && targetUrl) {
          rules.push({
            id: index + 1,
            type: 'path',
            sourcePath: sourcePath,
            targetUrl: targetUrl,
            keepPath: keepPath,
            enabled: enabled
          });
        }
      }
    });
    
    if (rules.length > 0) {
      saveRulesBtn.disabled = true;
      saveRulesBtn.textContent = '保存中...';
      
      // 保存到storage
      chrome.storage.sync.set({ipRules: rules}, function() {
        // 通知background更新规则
        chrome.runtime.sendMessage({action: 'updateRules', rules: rules}, function(response) {
          saveRulesBtn.disabled = false;
          saveRulesBtn.textContent = '保存所有规则';
          
          statusDiv.innerHTML = `
            <div style="color: green;">规则已保存并应用！</div>
            <div style="color: #c62828; font-weight: bold; margin-top: 5px;">
              <span style="font-size: 16px;">⚠️</span> 
              <strong>重要提示：</strong> 请完全关闭并重新打开浏览器，以确保规则生效。
            </div>
          `;
          
          setTimeout(() => {
            statusDiv.innerHTML = '';
          }, 10000);
        });
      });
    } else {
      statusDiv.innerHTML = '<div style="color: red;">请至少添加一条有效的规则！</div>';
      setTimeout(() => {
        statusDiv.innerHTML = '';
      }, 3000);
    }
  });
  
  // 监听通知消息
  chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.action === 'showNotification') {
      statusDiv.innerHTML = `<div style="color: #2196F3;">${message.message}</div>`;
      setTimeout(() => {
        statusDiv.innerHTML = '';
      }, 5000);
    }
  });
}); 