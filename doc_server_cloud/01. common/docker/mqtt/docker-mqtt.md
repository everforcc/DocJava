<span  style="font-family: Simsun,serif; font-size: 17px; ">

- [docker-官网](https://hub.docker.com/)
- [mqtt-官网](https://www.emqx.com/zh/downloads-and-install/broker?os=Docker)

~~~

~~~

### 1. 下载

~~~
docker pull emqx/emqx:5.8.2
~~~

### 2. 启动

~~~
docker run -d --name emqx -p 1883:1883 -p 8083:8083 -p 8084:8084 -p 8883:8883 -p 18083:18083 emqx/emqx:5.8.2
~~~

### 3. docker compose

~~~
~~~

</span>