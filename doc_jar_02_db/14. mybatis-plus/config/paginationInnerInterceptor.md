<span  style="font-family: Simsun,serif; font-size: 17px; ">

[TOC]

~~~ java
public PaginationInnerInterceptor paginationInnerInterceptor() {
    PaginationInnerInterceptor paginationInnerInterceptor = new PaginationInnerInterceptor();
    // 设置最大单页限制数量，默认 500 条，-1 不受限制
    paginationInnerInterceptor.setMaxLimit(-1L);
    // 分页合理化
    paginationInnerInterceptor.setOverflow(true);
    return paginationInnerInterceptor;
}
~~~

### 参数

~~~java
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
protected boolean optimizeJoin=true;
~~~

</span>