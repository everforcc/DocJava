<span style="font-family:Simsun,serif; font-size:17px;">

[TOC]

### nginx负载均衡

#### 1.轮询

~~~
upstream backserver { 
 server 192.168.0.12; 
 server 192.168.0.13; 
} 
~~~

#### 2.权重

~~~
# 权重越高，在被访问的概率越大，如上例，分别是20%，80%。
upstream backserver { 
 server 192.168.0.12 weight=2; 
 server 192.168.0.13 weight=8; 
} 
~~~

#### 3.ip_hash

~~~
upstream backserver { 
 ip_hash; 
 server 192.168.0.12:88; 
 server 192.168.0.13:80; 
} 
~~~

#### 4.fair(第三方插件)

~~~
必须安装upstream_fair模块。
对比 weight、ip_hash更加智能的负载均衡算法，fair算法可以根据页面大小和加载时间长短智能地进行负载均衡，响应时间短的优先分配。

哪个服务器的响应速度快，就将请求分配到那个服务器上。
upstream backserver { 
 server server1; 
 server server2; 
 fair; 
} 
~~~

#### 5.url_hash(第三方插件)

~~~
必须安装Nginx的hash软件包

按访问url的hash结果来分配请求，使每个url定向到同一个后端服务器，可以进一步提高后端缓存服务器的效率。

upstream backserver { 
 server squid1:3128; 
 server squid2:3128; 
 hash $request_uri; 
 hash_method crc32; 
}
~~~

</span>