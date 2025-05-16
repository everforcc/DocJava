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
                console.log(`请求 ${details.url} 符合规则，应重定向到：${newUrl}`);
                // 这里不能直接重定向，可考虑其他处理方式，如记录日志等
            }
        }
        console.log('请求不符合规则，不进行重定向');
        return {};
    },
    { urls: ['<all_urls>'] },
    [] // 不使用 blocking 权限
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
        return true; // 表明会异步发送响应
    }
});    