
-- 增加 指定sn 支付用户

-- 1. 根据sn查出来manager_phone
select e.manager_phone,e.* from zn_device_sn e where e.zn_device_sn_var = 'PRE670182493';

-- 2. 根据手机号查出来 user_id
select e.user_id,e.* from sys_user e where e.user_name like '%17597998777';

-- 1122937010332508160
-- 3. 复制 huifu_id 是 6666000151824676 的，修改id 为 sys_user.user_id
select * from zn_pay_user e where e.id = 1121557053677117440 ;

