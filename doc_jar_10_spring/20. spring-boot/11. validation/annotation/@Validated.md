<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @Valid

- JDK jsr303
- 标准JSR-303规范的标记型注解，用来标记验证属性和方法返回值，进行级联和递归校验
- @Valid可以用在属性级别约束，用来表示级联校验。
- @Valid可用于方法、字段、构造器和参数上

### @Validated

- 支持分组校验
- Spring的注解，是标准JSR-303的一个变种（补充），提供了一个分组功能，可以在入参验证时，根据不同的分组采用不同的验证机制
- @Validated注解可以用于类级别，用于支持Spring进行方法级别的参数校验。
- @Validated只能用在类、方法和参数上

</span>