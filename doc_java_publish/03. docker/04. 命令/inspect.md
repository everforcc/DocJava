<span  style="font-family: Simsun,serif; font-size: 17px; ">

- [docker inspect](https://docs.docker.com/reference/cli/docker/inspect/)

### 查看某个镜像的文件挂载目录

~~~
# 语法
docker inspect --format='{{ .Mounts }}' 镜像名或者镜像ID

# 示例
docker inspect --format='{{ .Mounts }}' 24ba0236665c
~~~

- 返回值

~~~
[
{bind  /etc/localtime /etc/localtime  ro false rprivate} 
{bind  /data/fuintFOODsys/nginx/conf.d /etc/nginx/conf.d  rw true rprivate} 
{bind  /data/fuintFOODsys/nginx/conf/nginx.conf /etc/nginx/nginx.conf  rw true rprivate} 
{bind  /etc/resolv.conf /etc/resolv.conf  ro false rprivate} 
{bind  /data/fuintFOODsys/nginx/logs /var/log/nginx  rw true rprivate} 
{bind  /data/fuintFOODsys/nginx/html /var/www/html  rw true rprivate}
]
~~~

</span>