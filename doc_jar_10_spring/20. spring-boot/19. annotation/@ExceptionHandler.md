<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @RestControllerAdvice

- 用来处理404，等访问的问题，接管spring自定义

### @ExceptionHandler(Exception.class)

- 用来捕获全局的异常
- 需要配合方法注解
- yml调整配置

~~~yml
# 自定义404
# 出现错误时, 直接抛出异常
spring.mvc.throw-exception-if-no-handler-found=true
  # 不要为我们工程中的资源文件建立映射
spring.resources.add-mappings=false
~~~

</span>