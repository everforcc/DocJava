<span  style="font-family: Simsun,serif; font-size: 17px; ">

- [docker logs]()

### docker logs

~~~shell
# 1. 显示容器的全部日志
docker logs <container_id>
# 2. 跟踪容器的日志输出
docker logs -f <container_id>
# 3. 显示最后100行日志
docker logs --tail 100 <container_id>
# 4. 查看最后20条日志并实时跟踪：
docker logs --tail 20 -f container_name
~~~

### 时间过滤

- 不常用

~~~shell
# 1. 显示容器的日志时间
docker logs -t container_name
# 2. 查看最近30分钟的日志
docker logs --since 30m container_name
# 3. 查看指定时间范围内的日志：
docker logs --since "2023-01-01T00:00:00" --until "2023-01-01T12:00:00" container_name
~~~

### 计容日志保存到文件

~~~shell
# 将日志保存到文件（追加模式）
docker logs <container_id> >> output.log 2>&1
# 将日志保存到文件（覆盖模式）
docker logs <container_id> > output.log 2>&1
~~~

### 示例

~~~shell
# 输出最新100行日志并保存到文件
docker logs --tail 100 -f 2c7052a94736 > 5.log 2>&1 &
docker logs --tail 100 -f 2c7052a94736 | grep 河南中南信息科技有限公司 > 6.log 2>&1 &
# 输出最新100行日志过滤并保存到文件
nohup docker logs --tail 100 -f 2c7052a94736 | grep 河南中南信息科技有限公司 > 5.log 2>&1 &
~~~

</span>