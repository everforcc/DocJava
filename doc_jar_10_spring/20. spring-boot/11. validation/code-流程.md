<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 1. pom

~~~xml
<!-- 不用spring -->
<dependency>
    <groupId>javax.validation</groupId>
    <artifactId>validation-api</artifactId>
</dependency>
        <!-- 整合spring       -->
        <!--        JSR303数据校验-->
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-validation</artifactId>
</dependency>
~~~

### 2. dto类字段需要的加上注解

~~~
- @NotNull 等
- @size 等
- 如果自定义了ISave和IUpdate的话，也要在group里面加入
~~~

### 3. 自定义接口，控制不同情况需要控制的字段

- 可选，自定义分组

~~~
ISave
IUpdate
IMDelete
IDelete
~~~

### 4. 使用方式

#### 4.1 @Validated

~~~
1. controller 方法参数
(@Validated @RequestBody Dto dto)
~~~

#### 4.2 @Valid

~~~
3. 方法上加上包含组的注解  @Validated({ISave.class})

3.1. 需要校验的类要有注解@Validated
3.2. 方法上 @Validated({ISave.class})
3.3. 参数注解@Valid Object obj
~~~

</span>