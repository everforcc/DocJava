<span  style="font-family: Simsun,serif; font-size: 17px; ">

### exceptionCaught

### 触发条件

- 异常发生：当Netty处理链中发生任何异常时触发
- 上游处理器异常：在ChannelPipeline中前面的处理器抛出异常时触发
- I/O操作异常：网络读写过程中发生异常时触发

### 具体场景

- 数据解析异常：XiaoyuDecoder 解析数据包格式错误时
- 业务处理异常：handle 方法执行过程中发生异常时
- 网络异常：连接断开、数据传输错误等网络相关异常时

### 处理逻辑

- 打印异常堆栈：调用 cause.printStackTrace() 记录异常信息
- 关闭连接：调用 ctx.close() 主动关闭当前连接，防止异常连接占用资源

### 异常传播机制

- 异常会沿着ChannelPipeline向后传播
- 如果没有被其他处理器处理，最终会到达 exceptionCaught 方法
- 这是Netty异常处理的最后一道防线

</span>