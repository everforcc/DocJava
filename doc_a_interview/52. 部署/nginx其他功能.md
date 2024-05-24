<span style="font-family:Simsun,serif; font-size:17px;">

[TOC]

### nginx

- [参考地址](https://mp.weixin.qq.com/s?__biz=MzI2OTQxMTM4OQ==&mid=2247523657&idx=5&sn=afbb01ca31c277916af7f22ce0db58c4&chksm=eae2681bdd95e10d6ac372af8814c5281fcce6dba8dd0b759d15aff72891f104b56598e7a193&scene=27)
- 访问谷歌正向代理
- 抗并发，nginx处理请求是异步非阻塞的，而apache则是阻塞性的，在高并发下nginx能保持低资源，低消耗高性能。

### CDN 服务

- 将网站的内容发布到最接近用户的网络边缘，使用户可就近取得所需的内容，提高用户访问网站的速度。

### 限流

### 配置高可用

1. 正常限制访问频率
2. 突发限制访问频率
3. 限制并发连接数

### 限制浏览器访问

~~~
## 不允许谷歌浏览器访问 如果是谷歌浏览器返回500
     if ($http_user_agent ~ Chrome) {   
        return 500;  
    }
~~~

### 开启压缩

~~~
http{
    gzip on;
}
~~~

</span>