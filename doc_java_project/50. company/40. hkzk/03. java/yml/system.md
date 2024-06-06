~~~yaml
# Tomcat
server:
  port: 9201
# Spring
spring:
  application:
    # Ӧ������
    name: cc-system
  profiles:
    # ��������
    active: dev
  cloud:
    nacos:
      discovery:
        # ����ע���ַ
        server-addr: 47.120.35.101:8848
#        ip: 192.168.1.15
#        port: ${server.port}
        #namespace: 199e675d-7f8b-417c-a32a-706e22c95712
      config:
        # �������ĵ�ַ
        server-addr: 47.120.35.101:8848
        # �����ļ���ʽ
        file-extension: yml
        # ��������
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
    map-underscore-to-camel-case: true # �շ����������⣬��Ч�����ļ�
flowable:
  async-executor-activate: false
~~~