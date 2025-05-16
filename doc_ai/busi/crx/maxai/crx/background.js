chrome.webRequest.onBeforeRequest.addListener(
    function(details) {
        chrome.storage.sync.get('rules', function(data) {
            if (data.rules) {
                for (const rule of data.rules) {
                    const originalUrl = rule.originalUrl;
                    const replaceUrl = rule.replaceUrl;

                    // 使用正则表达式确保完整匹配原始URL，避免 "http://192.168.3.8/prod-api" 匹配到 "http://192.168.3.8/prod-api-something"
                    const regex = new RegExp('^' + originalUrl.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + '(.*)$');
                    const match = details.url.match(regex);

                    if (match) {
                        const path = match[1];
                        const newUrl = replaceUrl + path;

                        console.log('原始URL:', details.url);
                        console.log('替换URL:', newUrl);

                        return {redirectUrl: newUrl};
                    }
                }
            }
        });
    },
    {urls: ["<all_urls>"]},
    ["blocking"]
);

chrome.webRequest.onBeforeSendHeaders.addListener(
    function(details) {
        chrome.storage.sync.get('rules', function(data) {
            if (data.rules) {
                for (const rule of data.rules) {
                    const originalUrl = rule.originalUrl;
                    const replaceUrl = rule.replaceUrl;

                    // 使用正则表达式确保完整匹配原始URL
                    const regex = new RegExp('^' + originalUrl.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + '(.*)$');
                    if (details.url.match(regex)) {
                        const requestHeaders = details.requestHeaders;

                        //  处理请求头
                        if (rule.headers && rule.headers.length > 0) {
                            //  删除已存在的header
                            rule.headers.forEach(headerRule => {
                                const existingHeaderIndex = requestHeaders.findIndex(header => header.name === headerRule.name);
                                if (existingHeaderIndex !== -1) {
                                    requestHeaders.splice(existingHeaderIndex, 1);
                                }
                            });

                            // 添加或替换请求头
                            rule.headers.forEach(headerRule => {
                                requestHeaders.push({ name: headerRule.name, value: headerRule.value });
                            });
                        }

                        console.log('修改后的请求头:', requestHeaders);
                        return { requestHeaders: requestHeaders };
                    }
                }
            }
        });
    },
    {urls: ["<all_urls>"]},
    ["blocking", "requestHeaders", "extraHeaders"]
);
