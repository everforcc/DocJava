<span  style="font-family: Simsun,serif; font-size: 17px; ">

### head

- 当nginx 遇到大数据流时，会把数据存到本地然后分次向客户端传输。
- 于是：

1. 存入文件有权限，读取文件没有权限，报错。
2. 大数据流超过nginx设置最大缓存，报错。

~~~nginx
user root   //此处的意思是nginx 使用root 的权限，解决问题1
head{
    proxy_buffers 16 512k;     //此处值代表nginx 设置 16个 512k 的块进行缓存，总共大小为16*512k   解决问题2
    proxy_buffer_size 512k;    //磁珠值代表每块大小 解决问题2
}
~~~

- 缓存目录
~~~
/var/cache/nginx/proxy_temp
~~~

</span>