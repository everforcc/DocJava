document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('save').addEventListener('click', function() {
        const originalUrl = document.getElementById('originalUrl').value;
        const replaceUrl = document.getElementById('replaceUrl').value;
        if (originalUrl && replaceUrl) {
            localStorage.setItem('originalUrl', originalUrl);
            localStorage.setItem('replaceUrl', replaceUrl);
            console.log('设置已保存：', { originalUrl, replaceUrl });
            alert('设置已保存！');
            // 更新请求拦截器
            chrome.runtime.sendMessage({ action: 'updateInterceptor' });
        } else {
            console.log('保存失败：原地址和替换后的地址不能为空');
            alert('请填写原地址和替换后的地址！');
        }
    });

    document.getElementById('clear').addEventListener('click', function() {
        document.getElementById('originalUrl').value = '';
        document.getElementById('replaceUrl').value = '';
        localStorage.removeItem('originalUrl');
        localStorage.removeItem('replaceUrl');
        console.log('设置已清空');
        alert('设置已清空！');
        // 更新请求拦截器
        chrome.runtime.sendMessage({ action: 'updateInterceptor' });
    });
});