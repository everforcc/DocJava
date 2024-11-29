<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 方法参数

### 连接点(JoinPoint)

- AOP框架除了Spring AOP之外，还包括AspectJ、JBoss AOP；
- 上述框架的区别是Spring AOP只支持到方法连接点，另外两个还支持字段和构造器连接点。
- 连接点是在应用执行过程中能够插入切面的一个点，这个点可以是调用方法时，抛出异常时，甚至是修改一个字段时，切面代码可以利用这些连接点插入到应用的正常流程中，并添加新的行为，如日志、安全、事务、缓存等。

### 1. 方法说明

- 在方法中拿到参数
- point.getThis()
- point.getTarget()
- point.getArgs()
- point.getSignature()

| 注解                        | 说明                  |
|---------------------------|---------------------|
| Object getThis();         | 返回AOP框架为目标对象生成的代理对象 |
| Object getTarget();       | 返回被织入增强处理的目标对象      |
| Object[] getArgs();       | 返回目标方法的参数           |
| Signature getSignature(); | 返回目标方法的签名信息。可获取方法名等 |

</span>