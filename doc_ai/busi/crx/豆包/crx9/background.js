console.log('Background script is running.');

let originalBaseUrl = '';
let replacementBaseUrl = '';

// 从本地存储中获取配置
chrome.storage.local.get(['originalBaseUrl', 'replacementBaseUrl'], function (result) {
    if (chrome.runtime.lastError) {
        console.error('读取本地存储配置时出错:', chrome.runtime.lastError);
        return;
    }
    originalBaseUrl = result.originalBaseUrl || '';
    replacementBaseUrl = result.replacementBaseUrl || '';
    console.log('从本地存储获取初始配置：', { originalBaseUrl, replacementBaseUrl });
});

// 非阻塞式监听请求
chrome.webRequest.onBeforeRequest.addListener(
    function (details) {
        console.log('拦截到请求：', details.url);
        if (originalBaseUrl && replacementBaseUrl) {
            const lowerCaseOriginalBaseUrl = originalBaseUrl.toLowerCase().replace(/\/+$/, '');
            const lowerCaseRequestUrl = details.url.toLowerCase().replace(/\/+$/, '');

            if (lowerCaseRequestUrl.startsWith(lowerCaseOriginalBaseUrl)) {
                const newUrl = details.url.replace(originalBaseUrl, replacementBaseUrl);
                console.log(`请求 ${details.url} 符合规则，应替换为：${newUrl}`);
                // 发送消息给内容脚本，让内容脚本处理请求替换
                chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
                    chrome.tabs.sendMessage(tabs[0].id, {
                        action: 'replaceRequest',
                        originalUrl: details.url,
                        newUrl: newUrl
                    });
                });
            }
        }
        return {};
    },
    { urls: ['<all_urls>'] },
    [] 
);

// 监听配置更新
chrome.runtime.onMessage.addListener(function (message, sender, sendResponse) {
    if (message.action === 'updateConfig') {
        originalBaseUrl = message.originalBaseUrl;
        replacementBaseUrl = message.replacementBaseUrl;
        chrome.storage.local.set({
            originalBaseUrl: originalBaseUrl,
            replacementBaseUrl: replacementBaseUrl
        }, function () {
            if (chrome.runtime.lastError) {
                console.error('保存配置到本地存储时出错:', chrome.runtime.lastError);
                sendResponse({ success: false, error: chrome.runtime.lastError });
            } else {
                console.log('配置更新到本地存储：', { originalBaseUrl, replacementBaseUrl });
                sendResponse({ success: true });
            }
        });
        return true; 
    }
});    