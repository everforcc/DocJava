<span  style="font-family: Simsun,serif; font-size: 17px; ">

#### - 单节点 6379

~~~shell
# docker 启动
docker run -v /myredis/conf:/usr/local/etc/redis --name myredis redis redis-server /usr/local/etc/redis/redis.conf
# 可选参数
 -v /home/redis/myredis/myredis.conf:/etc/redis/redis.conf
 -v /home/redis/myredis/data:/data
 --restart=always  # 总是开机启动
 --log-opt max-size=100m  # 日志
 --log-opt max-file=2 
 -p 6379:6379 
 --name myredis 
 -v /home/redis/myredis/myredis.conf:/etc/redis/redis.conf -v /home/redis/myredis/data:/data 
 -d redis 
 redis-server /etc/redis/redis.conf   # 以配置文件启动
 --appendonly yes  # 持久化
 --requirepass 123456 # 密码
~~~

- 启动脚本
~~~shell
sh docker-redis.sh
~~~

### 链接

~~~shell
#　本地链接
redis-cli -h 180.76.156.43 -p 6379 -a c.c.5664
~~~

</span>