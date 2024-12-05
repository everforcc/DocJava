<span  style="font-family: Simsun,serif; font-size: 17px; ">

[TOC]

### 示例脚本

~~~java
@Select({"<script>",
        "SELECT * FROM cc_mybatis_plus_user WHERE 1=1 ",
        "<if test='condition.name != null and condition.name != `` '>",
        " and name = #{condition.name}",
        "</if>",
        "</script>"
})
Page<MybatisPlusUser> selectCondition(MybatisPlusUser condition,Page<MybatisPlusUser> userPage);
~~~

### @Select -> script

- [x] 直接select
- [x] 太长用数组


</span>