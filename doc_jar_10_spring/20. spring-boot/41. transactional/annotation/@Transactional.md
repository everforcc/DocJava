<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @Transactional(rollbackFor = Exception.class)

- 参数 rollbackFor
- 不写不会回滚

~~~
@Transactional(rollbackFor = Exception.class)
~~~

### 避免 脏读，幻读，不可重复读

- anm主线程更新
- 子线程查询，没有查到更新后的数据，是这个注解的作用
- 但是应该吧子线程的数据移到外面

</span>