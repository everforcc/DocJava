<span  style="font-family: Simsun,serif; font-size: 17px; ">

~~~yaml
spring:
  cloud:
    gateway:
      discovery:
        locator:
          lowerCaseServiceId: true
          enabled: true
      routes:
        # 认证中心
        - id: xxx-auth
          uri: lb://xxx-auth
          predicates:
            - Path=/pre/**
          filters:
            # 验证码处理
            - XXXFilter
~~~

### uri 的三种配置方式

#### 1. http

- http方式，自然指的是可以转发任意http链接，比如可以配置以下这样：
- 这里的uri可以设置为任意你需要的http请求地址。

~~~
routes:
    - id: demo_router
    # 路由ID
    uri: http://www.csdn.cn
    # 将请求转发到首页
    predicates: - Path=/demo/**
~~~

#### 2. websocket

- websocket方式，指的就是转发至websocket请求，如下配置所示：

~~~
routes: 
    - id: demo_router 
    # 路由ID 
    uri: ws://localhost:8080 
    predicates: 
        - Path=/demo/**
~~~

#### 3. 注册中心

- 注册中心服务方式，可以多加注意些，其不需要再配置指定的端口，只需要配置好相应服务即可，这也避免了之后可能因为修改端口而造成的修改工作。
- 这里需要注意的是，一旦使用lb注册中心服务方式，将会自动走内部的负载均衡策略，这也是lb的一个特点，选择使用时可以考虑一下这一点。
~~~
routes: 
    - id: demo_router 
    # 路由ID 
    uri: lb://demo1 
    # 已在注册中心注册过的服务名称 
    predicates: 
        - Path=/demo/**
~~~

</span>