<span  style="font-family: Simsun,serif; font-size: 17px; ">


### ������

- SpringBoot Admin
- ����������,�õ���
- ΢�����

### �����

~~~

~~~

### �ͻ���

- �ο�����
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
- �����ļ�
~~~yaml
# ��¶��ض˵�
# ����
# ����Ҫ����ע���ַ
logging:
  file:
    name: logs/cc-gateway/info.log
# ΢����ͨ��nacosע��
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
    # ΢����
    logfile:
      external-file: logs/cc-gateway/info.log
~~~
- security
~~~
��Ҫ�����û������룬Ϊ�˰�ȫ����
~~~

</span>