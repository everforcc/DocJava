<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 配置文件读取流程

- [Spring Cloud 拉取 Nacos 中配置文件](https://blog.csdn.net/qq_37778018/article/details/126779477)

#### 1. bootstarp.yml

- 程序启动首先读取应用中bootstarp.yml配置文件

#### 2. DEFAULT_GROUP 默认分组

- 再到 nacos 读取 DEFAULT_GROUP 默认分组下的
~~~
application-${spring.profiles.active}.${spring.cloud.nacos.config.file-extension}
例如：application-dev.yml
~~~

#### 3. ${spring.cloud.nacos.config.group} 配置分组

- 最后到 nacos 读取 ${spring.cloud.nacos.config.group} 配置分组下的
~~~
${spring.application.name}.${spring.cloud.nacos.config.file-extension}
例如：kafka-test-dev.yml
~~~

### 持久化Sentinel

- 参考Sentinel目录

</span>