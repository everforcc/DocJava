
-- 1. 查出所有的经销商
select su.* from sys_user su
left join sys_user_role sur on su.user_id= sur.user_id
where sur.role_id = 3;
-- 角色
select * from sys_user_role sur
where sur.role_id = 3;
select * from sys_role;

-- 经销商表
select su.user_id,su.* from sys_user su ;
select su.nick_name,zdl.dealer_id,zdl.* from zn_device_lease zdl
left join sys_user su on zdl.dealer_id = su.user_id;

-- 2. 经销商名下的所有sn
-- 可能未激活
-- group_id
select e.group_id,e.zn_device_sn_var,e.dealer_id,e.contact_person '联系人',e.phone '手机号',e.* from zn_device_lease e;
select e.group_id,e.* from zn_device_lease e;
-- 已激活
-- select e.* from zn_device_sn e;
-- select * from sys_user e ;

-- 3. 事件处理人员表
-- 使用sn相关联
-- ,zeps.group_id
select zeps.* from zn_event_process_staff zeps ;

select zeps.group_id,zeps.dealer_Id,zeps.* from zn_event_process_staff zeps
order by rand();

-- 移除设备sn
select zepsg.* from zn_event_process_staff_group zepsg ;
-- select * from zn_device_lease;

-- 4. 事件表
select zaedd.zn_device_sn_var,zaedd.* from zn_ais_event_data_details_operate zaedd
where zaedd.process_id = 1;

-- 重置测试数据为可查询
update zn_ais_event_data_details_operate
set status = 0,
    create_time=now()
where id in (1,2,3,4,5,6,7,8,9,10,11,12,13);

-- zn_ais_event_data_details_operate
--
-- select zed.algorithm_id,zed.* from zn_event_data zed;
-- copy 表
-- select zedo.algorithm_id,zedo.* from zn_event_data_operate zedo;

-- 设备租赁相关
-- select zdl.dealer_id,zdl.* from zn_device_lease zdl ;
-- select zdlr.* from zn_device_lease_record zdlr ;

select * from zn_event_process_rule e ;
select 60*24 from dual;

-- 测试数据
-- dealer_id
-- 123456789 派单
-- 人员
    -- 11111111111
    -- 11111111112
    -- 11111111113
-- 987654321 抢单
-- 人员
    -- 11111111114
    -- 11111111115

-- zn_ais_camera
select e.longitude,e.latitude,e.* from zn_machine_camera e
where e.id in (1869664776612081666);
