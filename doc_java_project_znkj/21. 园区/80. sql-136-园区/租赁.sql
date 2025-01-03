
-- 1. 查出所有的经销商
select su.* from sys_user su
left join sys_user_role sur on su.user_id= sur.user_id
where sur.role_id = 3;

select * from sys_user_role sur
where sur.role_id = 3;
select * from sys_role;


-- 经销商表
select su.user_id,su.* from sys_user su ;
select su.nick_name,zdl.dealer_id,zdl.* from zn_device_lease zdl
left join sys_user su on zdl.dealer_id = su.user_id;


-- 经销商名下的所有sn
select e.dealer_id,e.* from zn_device_lease e;
select * from sys_user e ;


-- 事件处理人员表
-- 使用sn相关联
select zeps.zn_device_sn_var,zeps.dealer_Id,zeps.* from zn_event_process_staff zeps ;
select su.user_id,su.* from sys_user su ;


-- 事件表
select zaedd.algorithm_id,zaedd.* from zn_ais_event_data_details zaedd;
--
select zed.algorithm_id,zed.* from zn_event_data zed;
-- copy 表
select zedo.algorithm_id,zedo.* from zn_event_data_operate zedo;



-- 设备租赁相关
select zdl.dealer_id,zdl.* from zn_device_lease zdl ;
select zdlr.* from zn_device_lease_record zdlr ;
