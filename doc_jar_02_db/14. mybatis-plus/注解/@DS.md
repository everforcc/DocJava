<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @DS

- @Master
- @Slave
- 都是用来切换数据源的
- @DS("name1") 可以灵活自定义

### 使用

- 在service层接口上使用，实现类使用也可以
- 如果多个接口标注使用不同的数据源，但是使用了同一个mapper接口，会导致切换失败
    - 可能是因为，aop切换了多次导致覆盖

</span>