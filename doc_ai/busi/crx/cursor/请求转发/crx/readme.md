### 问题调整

- 可以的情况
    - 当 http://192.168.3.39/prod-api/ 转发到 http://127.0.0.1:8080 是可以成功的
- 问题情况
    - 当 http://192.168.0.30/prod-api/ 转发到 http://192.168.3.39/prod-api/ 是失败的
    - 失败结果为
    - http://192.168.0.30/prod-api/system/user/getInfo 转发到了 http://192.168.3.39/system/user/getInfo

### 原需求

写一个chrome插件 需要实现如下功能 拦截请求并转发

给两个输入框 输入框一 输入 http://192.168.0.8:8080
输入框二 输入 http://127.0.0.1:8080
点击确定按钮 例如现在的请求是 http://192.168.0.8:8080/test?a=b
转发请求结果为 http://127.0.0.1:8080/test?a=b

每一个请求都要在控制台打印一下

界面需要美化一下

1. 新增两个输入框，分别用于输入替换的请求头和值，并添加一个按钮用于添加或删除替换规则。
2. 可以新增多组这样的输入框，用来替换请求头 请求头要放到 Request Headers 里面

当输入框一 http://192.168.3.8/prod-api/
输入框二 http://127.0.0.1/
原请求 http://192.168.3.8/prod-api/system/dzgProduct/list?pageSize=10&pageNum=1
希望被替换后的请求 http://127.0.0.1/system/dzgProduct/list?pageSize=10&pageNum=1

原请求的请求头都要跟着转发过去，除非修改了请求头的值，用修改后的值

美化一下当前界面，有初始面板大小。也需要自适应

### bug

输入框一 http://192.168.3.8/prod-api/
输入框二 http://127.0.0.1/
原请求 http://192.168.3.8/prod-api/system/dzgProduct/list?pageSize=10&pageNum=1
被替换后的请求出错，是这样 http://127.0.0.1/$%7Bpath%7D?pageSize=10&pageNum=1

设置的请求头也没有生效 Provisional headers are shown

保存设置没有提示信息，设置的请求头Authorization在向替换后的地址请求的时候也没有加上去，没生效

当我给定一个请求头 比如token的时候，替换后的地址的请求头没有这个token


