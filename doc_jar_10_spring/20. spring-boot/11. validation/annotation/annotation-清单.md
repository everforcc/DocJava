<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 注解清单

| key                                                   | value                                                                        |
|-------------------------------------------------------|------------------------------------------------------------------------------|
| @Pattern                                              | 正则 需要类上@Validated 方法参数@Valid                                                 |
| @Pattern(value)                                       | 限制必须符合指定的正则表达式                                                               |
| @Validated                                            | 类注解                                                                          |
| @Valid                                                | 递归的对关联对象进行校验, 如果关联对象是个集合或者数组,那么对其中的元素进行递归校验,如果是一个map,则对其中的值部分进行校验.(是否进行递归验证) |
| @Null                                                 | 限制只能为null                                                                    |
| @NotNull                                              | 限制必须不为null,NotNull无法过滤空字符串                                                   |
| @AssertFalse                                          | 限制必须为false                                                                   |
| @AssertTrue                                           | 限制必须为true                                                                    |
| @DecimalMax(value)                                    | 限制必须为一个不大于指定值的数字                                                             |
| @DecimalMin(value)                                    | 限制必须为一个不小于指定值的数字                                                             |
| @Digits(integer,fraction)                             | 限制必须为一个小数，且整数部分的位数不能超过integer，小数部分的位数不能超过fraction                            |
| @Max(value)                                           | 限制必须为一个不大于指定值的数字                                                             |
| @Min(value)                                           | 限制必须为一个不小于指定值的数字                                                             |
| @Size(max,min)                                        | 限制字符长度必须在min到max之间                                                           |
| @Past                                                 | 验证注解的元素值（日期类型）比当前时间早                                                         |
| @Future                                               | 限制必须是一个将来的日期                                                                 |
| @NotEmpty                                             | 验证注解的元素值不为null且不为空（字符串长度不为0、集合大小不为0）                                         |
| @NotBlank                                             | 验证注解的元素值不为空（不为null、去除首位空格后长度为0），不同于@NotEmpty，@NotBlank只应用于字符串且在比较时会去除字符串的空格  |
| @Email                                                | 验证注解的元素值是Email，也可以通过正则表达式和flag指定自定义的email格式                                  |
| @Range(min=, max=)                                    | 被指定的元素必须在合适的范围内                                                              | 
| @Range(min=10000,max=50000,message=”range.bean.wage”) |                                                                              |
| @CreditCardNumber                                     | 信用卡验证                                                                        |  
| @ScriptAssert(lang= ,script=, alias=)                 |                                                                              |
| @URL(protocol=,host=, port=,regexp=, flags=)          |                                                                              |

### 组合使用

- 可以相互组合使用
- @Pattern(value)可以配合 @NotEmpty
- 或者正则表达式限制长度
- 根据业务情况处理

</span>