
-- 增加 指定sn 支付用户

-- 1. manager_phone
select e.manager_phone,e.* from zn_device_sn e where e.zn_device_sn_var = 'PRE758294763';

-- 2.
select e.user_id,e.* from sys_user e where e.user_name like '%13103785939';

-- 3. 复制 huifu_id 是 6666000151824676 的，修改id 为 sys_user
select * from zn_pay_user e where e.id = 1077596090997547008 ;

