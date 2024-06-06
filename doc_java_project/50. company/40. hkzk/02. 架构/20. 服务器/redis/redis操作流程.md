<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 操作流程

### 1. 创建映射目录

- redis配置文件
- data存放目录

### 2. 修改每个redis节点的配置文件

- ip
- port
- password

### 3. 将配置文件放到对应的目录

- 不同端口下的配置文件

### 4. 修改docker yml信息

- volumes
- 映射本地路径

### 5. 构建容器

- 执行脚本构建

### 6. 构建集群

- 执行脚本构建
- redis 5 版本以后通过redis-cli就可以构建

~~~
Can I set the above configuration?
输入 yes 接受
~~~

### 7. 测试集群构建是否成功

~~~
docker exec -it redis5201 redis-cli -p 5201 -a youdiancaideyunwei cluster nodes
~~~

### 参考

- [参考地址-使用Docker-Compose搭建Redis集群（三台机器）](https://blog.csdn.net/m0_59388826/article/details/133674725)

</span>