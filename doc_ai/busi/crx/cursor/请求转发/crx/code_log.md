# Chrome插件请求转发与CORS问题排查记录

## 1. 问题现象
- 访问 `http://192.168.0.30/prod-api/xxx` 期望转发到 `http://192.168.3.39/prod-api/xxx`
- 实际转发路径丢失 `/prod-api/`，变成 `http://192.168.3.39/xxx`

## 2. 插件代码修复
- 定位到 background.js 的正则转发规则，发现 regexSubstitution 拼接有误。
- 修正后，保证 targetUrlObj.pathname 以 `/` 结尾，转发后路径正确。

## 3. 新问题：CORS 报错
- 报错信息：No 'Access-Control-Allow-Origin' header is present on the requested resource.
- 原因：目标服务器未返回 CORS 相关响应头，浏览器拦截了请求。
- 插件 declarativeNetRequest 机制无法绕过 CORS 校验。

## 4. 解决建议
- 推荐后端服务器支持 CORS。
- 或本地开发用代理服务器转发并加上 CORS 响应头。
- 临时调试可用特殊参数启动 Chrome 关闭 CORS 校验（不推荐生产环境）。

## 5. 关闭 CORS 校验的 Chrome 启动命令
- Windows 示例：

```sh
"C:\Program Files\Google\Chrome\Application\chrome.exe" --disable-web-security --user-data-dir="C:/chrome_dev_cors"
```
- 说明：
  - 关闭所有 Chrome 窗口后，使用上述命令行启动。
  - `--user-data-dir` 必须指定一个新的用户数据目录。
  - 仅用于本地开发调试，勿用于日常浏览。 