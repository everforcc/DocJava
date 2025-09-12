<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 当这个nginx收到某种url的时候转发到另一个指定ip的nginx80端口具体逻辑如下
-
- 当前 192.168.1.138 nginx /cc
- 转发到 192.168.1.188 的 /web 路径
- 例如 http://192.168.1.138/cc/path/a
- 转发结果 http://192.168.1.188/web/path/a
-
- 分别给出两个nginx的配置

</span>