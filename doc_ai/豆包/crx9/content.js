chrome.runtime.onMessage.addListener(function (message, sender, sendResponse) {
    if (message.action === 'replaceRequest') {
        const { originalUrl, newUrl } = message;
        // 可以在这里使用 XMLHttpRequest 或 fetch 来发送新请求
        fetch(newUrl)
           .then(response => response.text())
           .then(data => {
                // 这里可以根据实际情况处理响应数据，例如替换页面内容
                console.log('新请求响应数据：', data);
            })
           .catch(error => {
                console.error('新请求出错：', error);
            });
    }
});    