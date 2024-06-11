~~~yaml
# Tomcat
server:
  port: 9201
# Spring
spring:
  application:
    # 应用名称
    name: cc-system
  profiles:
    # 环境配置
    active: dev
  cloud:
    nacos:
      discovery:
        # 服务注册地址
        server-addr: 47.120.35.101:8848
#        ip: 192.168.1.15
#        port: ${server.port}
        #namespace: 199e675d-7f8b-417c-a32a-706e22c95712
      config:
        # 配置中心地址
        server-addr: 47.120.35.101:8848
        # 配置文件格式
        file-extension: yml
        # 共享配置
        shared-configs:
          - application-${spring.profiles.active}.${spring.cloud.nacos.config.file-extension}
        #namespace: 199e675d-7f8b-417c-a32a-706e22c95712
      username: nacos
      password: nacos
  jackson:
    default-property-inclusion: NON_EMPTY
mybatis-plus:
  configuration:
    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
    map-underscore-to-camel-case: true # 驼峰命名法问题，等效配置文件
flowable:
  async-executor-activate: false
~~~