~~~
# 进入容器
docker exec -it nginx1232 /bin/bash
# 修改配置文件后生效
nginx -s reload
# 查看是否生效
nginx -t
~~~