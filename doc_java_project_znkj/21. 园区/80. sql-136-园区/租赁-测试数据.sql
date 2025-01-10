
select * from zn_event_process_rule e ;

select e.group_id,e.* from zn_device_lease e;

-- 重置测试数据为可查询
select zaedd.camera_id,zaedd.zn_device_sn_var,zaedd.* from zn_ais_event_data_details_operate zaedd;
update zn_ais_event_data_details_operate
set zn_device_sn_var = 'csqd001',
    status = 0,
    create_time=now()
where id in (1,2,3,4,5,6,7,8,9,10);

update zn_ais_event_data_details_operate
set zn_device_sn_var = 'csff001',
    status = 0,
    create_time=now()
where id in (11,12,13);

select e.group_id,e.* from zn_event_process_staff e
where e.user_phone in
      ('11111111111', '11111111112', '11111111113',
                       '11111111114', '11111111115');

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
