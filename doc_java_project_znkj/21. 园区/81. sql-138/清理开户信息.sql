-- 15339031223
select * from zn_device_sn zds where zds.zn_device_sn_var = 'DEV857603214';

-- 1146242007954497536
select su.user_id,su.* from sys_user su where su.user_name = '15339031223';

select zpu.huifu_id,zpu.* from zn_pay_user zpu where zpu.id = 1146242007954497536;

-- huifu_id
delete from zn_pay_apply where apply_obj = '6666000176343458';
-- user_id
delete from zn_pay_user where id = 1146242007954497536;
-- user_id
update zn_pay_apply_progress set progress = 0
where id = 1146242007954497536;


