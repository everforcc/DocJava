<span  style="font-family: Simsun,serif; font-size: 17px; ">

### 分页查询数据不一致问题分析报告

#### 问题现象

- COUNT查询返回40条记录
- 分页查询第二页只返回7条记录（预期应返回10条）

#### 根本原因

##### JOIN操作逻辑错误

- 在 SysUserMapper.xml 中的 selectUserDhList 查询中：
- 使用了 LEFT JOIN zn_device_sn_bmc dh ON u.phonenumber = dh.manager_phone
- 但在 WHERE 条件中使用 AND dh.zn_device_sn_var LIKE concat('%', #{sn}, '%')
- 此写法将 LEFT JOIN 退化为 INNER JOIN，只返回两表都有匹配记录的数据

##### 查询逻辑不一致

- COUNT 查询统计的是满足设备SN条件的所有用户数
- 分页查询实际受 JOIN 条件限制，过滤掉了没有设备关联的用户

#### 解决方案

- 推荐修改方式
- 将 SysUserMapper.xml 中的 selectUserDhList 查询条件修改为子查询形式：

~~~
<if test="sn != null and sn != ''">
    AND u.phonenumber IN ( 
        SELECT manager_phone 
        FROM zn_device_sn_bmc 
        WHERE zn_device_sn_var LIKE concat('%', #{sn}, '%')
    )
</if>

~~~

### 优势

- 避免 JOIN 退化问题
- 提高查询性能
- 保证 COUNT 和分页查询结果一致性
- 逻辑更清晰易懂
- 实施建议
- 修改 SysUserMapper.xml 文件中的 selectUserDhList 查询语句
- 将原来的 LEFT JOIN 和 WHERE 条件替换为子查询方式
- 测试修改后的分页功能，确保数据一致性

</span>