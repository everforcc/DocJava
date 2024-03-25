<span  style="font-family: Simsun,serif; font-size: 17px; ">


### 技术点

- SpringBoot Admin
- 单机操作简单,用的少
- 微服务版

### 服务端

~~~

~~~

### 客户端

- 参考代码
~~~xml

<dependency>
    <groupId>de.codecentric</groupId>
    <artifactId>spring-boot-admin-starter-server</artifactId>
    <version>${spring-boot-admin.version}</version>
</dependency>
        <!-- SpringBoot Actuator -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
~~~
- 配置文件
~~~yaml
# 暴露监控端点
# 单机
# 还需要增加注册地址
logging:
  file:
    name: logs/cc-gateway/info.log
# 微服务通过nacos注册
management:
  endpoints:
    web:
      exposure:
        include: '*'
  endpoint:
    health:
      show-details: always
    shutdown:
      enabled: true
    # 微服务
    logfile:
      external-file: logs/cc-gateway/info.log
~~~
- security
~~~
需要配置用户名密码，为了安全调整
~~~

</span>