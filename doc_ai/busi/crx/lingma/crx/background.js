chrome.runtime.onInstalled.addListener(function() {
    updateInterceptor();
});

chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
    if (request.action === 'updateInterceptor') {
        updateInterceptor();
    }
});

function updateInterceptor() {
    chrome.webRequest.onBeforeRequest.removeListener(interceptRequest);
    chrome.webRequest.onBeforeRequest.addListener(
        interceptRequest,
        { urls: ["<all_urls>"] },
        ["blocking"]
    );
}

function interceptRequest(details) {
    chrome.storage.local.get(['originalUrl', 'replaceUrl'], function(result) {
        const originalUrl = result.originalUrl;
        const replaceUrl = result.replaceUrl;
        if (originalUrl && replaceUrl) {
            const lowerCaseOriginalUrl = originalUrl.toLowerCase().replace(/\/+$/, '');
            const lowerCaseRequestUrl = details.url.toLowerCase().replace(/\/+$/, '');

            if (lowerCaseRequestUrl.startsWith(lowerCaseOriginalUrl)) {
                const newUrl = details.url.replace(originalUrl, replaceUrl);
                console.log(`请求 ${details.url} 符合规则，重定向到：${newUrl}`);
                return { redirectUrl: newUrl }; // 这里返回重定向的URL
            }
        }
        console.log('请求不符合规则，不进行重定向');
        return {};
    });
}
