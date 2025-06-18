<span  style="font-family: Simsun,serif; font-size: 17px; ">

[TOC]

### @Sensitive

### 实现链路

~~~mermaid
sequenceDiagram
    participant Jackson
    participant SensitiveHandler
    Jackson->>SensitiveHandler: 发现带@Sensitive的String字段
    SensitiveHandler->>SensitiveHandler: 读取注解参数(strategy/roleKey/perms)
    SensitiveHandler-->>Jackson: 返回配置好的序列化器实例

~~~


</span>