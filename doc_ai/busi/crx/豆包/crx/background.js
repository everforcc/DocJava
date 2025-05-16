let originalBaseUrl = '';
let replacementBaseUrl = '';

// 从本地存储中获取配置
chrome.storage.local.get(['originalBaseUrl', 'replacementBaseUrl'], function (result) {
    originalBaseUrl = result.originalBaseUrl || '';
    replacementBaseUrl = result.replacementBaseUrl || '';
    console.log('从本地存储获取初始配置：', { originalBaseUrl, replacementBaseUrl });
});

// 监听请求
chrome.webRequest.onBeforeRequest.addListener(

    function (details) {
        debugger;
        console.log('拦截到请求：', details.url);
        if (originalBaseUrl && replacementBaseUrl) {
            const lowerCaseOriginalBaseUrl = originalBaseUrl.toLowerCase().replace(/\/+$/, '');
            const lowerCaseRequestUrl = details.url.toLowerCase().replace(/\/+$/, '');

            if (lowerCaseRequestUrl.startsWith(lowerCaseOriginalBaseUrl)) {
                const newUrl = details.url.replace(originalBaseUrl, replacementBaseUrl);
                console.log(`请求 ${details.url} 符合规则，重定向到：${newUrl}`);
                return { redirectUrl: newUrl };
            }
        }
        console.log('请求不符合规则，不进行重定向');
        return {};
    },
    { urls: ['<all_urls>'] },
    ['blocking']
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
            console.log('配置更新到本地存储：' + originalBaseUrl + replacementBaseUrl );
            sendResponse({ success: true });
        });
        return true; // 表明会异步发送响应
    }
});    