<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @PostConstruct

- **定义:** 在方法上加该注解会在项目启动的时候执行该方法，也可以理解为在spring容器初始化的时候执行该方法。
- **说明:** ：被@PostConstruct修饰的方法会在服务器加载Servlet的时候运行，并且只会被服务器调用一次，类似于Serclet的inti()方法。
    - 被@PostConstruct修饰的方法会在构造函数之后，init()方法之前运行。

</span>