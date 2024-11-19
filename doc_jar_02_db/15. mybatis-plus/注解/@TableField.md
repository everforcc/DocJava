<span  style="font-family: Simsun,serif; font-size: 17px; ">

### @TableField

- [@TableField](https://baomidou.com/pages/223848/#tablefield)
- 描述：字段注解（非主键）

~~~
@TableName("sys_user")
public class User {
    @TableId
    private Long id;
    @TableField("nickname")
    private String name;
    private Integer age;
    private String email;
}
~~~

### 注意事项

- 是MyBatis-Plus的注解
- 所以必须在MyBatis-Plus对应的api下才能生效

~~~
List<MybatisPlusUser> userList = userMapper.selectList(null);
~~~

### 实现原理

- 编译后的sql,所以直接写sql不能生效

~~~
SELECT id,name,age,email AS ee,version,deleted,create_time,update_time FROM cc_mybatis_plus_user WHERE deleted=0
~~~

### 默认值

- [文档](https://baomidou.com/reference/annotation/#update)
- 在执行更新操作时，指定字段在 SET 子句中的表达式。这个属性的优先级高于 el 属性，允许你自定义字段的更新逻辑。

~~~
@TableField(value = "up_flag", update = "0")
private Integer upFlag;

@TableField(update="%s+1") // 自定义更新时的表达式
private Integer version;
~~~

</span>