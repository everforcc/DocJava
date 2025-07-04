document.addEventListener('DOMContentLoaded', function() {
  const sourceUrlInput = document.getElementById('sourceUrl');
  const targetUrlInput = document.getElementById('targetUrl');
  const saveButton = document.getElementById('saveButton');
  const statusDiv = document.getElementById('status');

  // 加载保存的设置
  chrome.storage.local.get(['sourceUrl', 'targetUrl'], function(result) {
    if (result.sourceUrl) sourceUrlInput.value = result.sourceUrl;
    if (result.targetUrl) targetUrlInput.value = result.targetUrl;
  });

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

    chrome.storage.local.set({
      sourceUrl: sourceUrl,
      targetUrl: targetUrl
    }, function() {
      showStatus('设置已保存', 'success');
      
      // 通知background.js更新规则
      chrome.runtime.sendMessage({
        action: 'updateRules',
        sourceUrl: sourceUrl,
        targetUrl: targetUrl
      });
    });
  });

  function showStatus(message, type) {
    statusDiv.textContent = message;
    statusDiv.className = 'status ' + type;
    setTimeout(() => {
      statusDiv.style.display = 'none';
    }, 3000);
  }
}); 