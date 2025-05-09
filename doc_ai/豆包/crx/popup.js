document.addEventListener('DOMContentLoaded', function () {
    console.log('DOMContentLoaded 事件触发，开始初始化 popup');
    // 获取输入框和按钮元素
    const originalBaseUrlInput = document.getElementById('originalBaseUrl');
    const replacementBaseUrlInput = document.getElementById('replacementBaseUrl');
    const saveButton = document.getElementById('saveButton');
    const clearButton = document.getElementById('clearButton');

    // 从本地存储中获取配置并填充到输入框
    chrome.storage.local.get(['originalBaseUrl', 'replacementBaseUrl'], function (result) {
        console.log('从本地存储获取配置：', result);
        originalBaseUrlInput.value = result.originalBaseUrl || '';
        replacementBaseUrlInput.value = result.replacementBaseUrl || '';
        console.log('从本地存储获取配置填充输入框：', result);
    });

    // 保存按钮点击事件
    saveButton.addEventListener('click', function () {
        console.log('保存按钮被点击');
        alert('保存按钮被点击');
        const originalBaseUrl = originalBaseUrlInput.value;
        const replacementBaseUrl = replacementBaseUrlInput.value;
        debugger;
        if (!originalBaseUrl || !replacementBaseUrl) {
            console.log('原地址和替换后的地址不能为空');
            alert('原地址和替换后的地址不能为空');
            return;
        }

        console.log('准备发送更新配置消息：', { originalBaseUrl, replacementBaseUrl });
        // 发送消息更新配置
        chrome.runtime.sendMessage({
            action: 'updateConfig',
            originalBaseUrl: originalBaseUrl,
            replacementBaseUrl: replacementBaseUrl
        }, function (response) {
            if (chrome.runtime.lastError) {
                console.error('发送消息时出错：', chrome.runtime.lastError);
                alert('配置更新失败，请检查控制台日志');
            } else if (response && response.success) {
                console.log('配置更新成功');
                alert('配置更新成功，请清除浏览器缓存后重试');
            } else {
                console.error('配置更新失败');
                alert('配置更新失败，请检查控制台日志');
            }
        });
    });

    // 清空按钮点击事件
    clearButton.addEventListener('click', function () {
        console.log('清空按钮被点击');
        originalBaseUrlInput.value = '';
        replacementBaseUrlInput.value = '';
        chrome.storage.local.remove(['originalBaseUrl', 'replacementBaseUrl'], function () {
            console.log('本地存储配置已清空');
            alert('本地存储配置已清空');
        });
    });
});