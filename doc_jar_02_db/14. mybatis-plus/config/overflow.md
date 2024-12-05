<span  style="font-family: Simsun,serif; font-size: 17px; ">

[TOC]

### 源码

- PaginationInnerInterceptor
~~~
/**
 * 溢出总页数后是否进行处理
 */
protected boolean overflow;
/**
 * 单页分页条数限制
 */
protected Long maxLimit;
/**
 * 数据库类型
 * <p>
 * 查看 {@link #findIDialect(Executor)} 逻辑
 */
private DbType dbType;
/**
 * 方言实现类
 * <p>
 * 查看 {@link #findIDialect(Executor)} 逻辑
 */
private IDialect dialect;
/**
 * 生成 countSql 优化掉 join
 * 现在只支持 left join
 *
 * @since 3.4.2
 */
protected boolean optimizeJoin = true;
~~~

### 生效逻辑

~~~java
/**
 * count 查询之后,是否继续执行分页
 *
 * @param page 分页对象
 * @return 是否
 */
protected boolean continuePage(IPage<?> page) {
    if (page.getTotal() <= 0) {
        return false;
    }
    if (page.getCurrent() > page.getPages()) {
        if (overflow) {
            //溢出总页数处理
            handlerOverflow(page);
        } else {
            // 超过最大范围，未设置溢出逻辑中断 list 执行
            return false;
        }
    }
    return true;
}
~~~

</span>