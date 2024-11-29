<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 同一个方法被多个aspect拦截

- 实现 Ordered，或者注解 @Order

1. 优先级 @Order(1) 数字越小越优先
2. 优先级高的先处理，around begin,before
3. 优先级高的后处理，after begin,around after

</span>