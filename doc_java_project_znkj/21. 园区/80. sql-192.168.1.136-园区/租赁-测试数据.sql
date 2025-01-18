
select * from zn_event_process_rule e ;

select e.group_id,e.manual_watch,e.del_flag,e.* from zn_device_lease e
where e.zn_device_sn_var = 'csff001'
;

-- 重置测试数据为可查询
select zaedd.status,zaedd.create_time,zaedd.process_id,zaedd.* from zn_ais_event_data_details_operate zaedd
where zaedd.zn_device_sn_var = 'csff001';

-- 重置某个设备下的所有事件
update zn_ais_event_data_details_operate
set process_id=null,
    status = 0,
    create_time=now()
where zn_device_sn_var = 'csff001';

-- 抢单数据
update zn_ais_event_data_details_operate
set zn_device_sn_var = 'csqd001',
    status = 0,
    create_time=now()
where id in (1,2,3,4,5,6,7,8,9,10);

update zn_ais_event_data_details_operate
set process_id= null,
    zn_device_sn_var = 'csff001',
    status = 0,
    create_time=now()
where id in (11,12,13,14,15,16,17,18,19,20,21);

-- 重置事件
update zn_ais_event_data_details_operate
set zn_device_sn_var = 'csff001',
    process_id=null,
    acquire_time=null,
    process_time=null,
    process_text=null,
    process_picture=null,
    status = 0,
    create_time=now()
where id in  (87,88,89,90,91,92,93,94,95,96);

-- 分发数据
update zn_ais_event_data_details_operate
set process_id=null,
    zn_device_sn_var = 'csff001',
    status = 0,
    create_time=now()
where id in (11,12,13,14,15,16,17,18,19,20,21);

select e.* from zn_event_process_staff e
where e.user_phone in
      ('11111111111', '11111111112', '11111111113',
                       '11111111114', '11111111115','13133333331','14444444444');
select e.* from zn_event_process_staff_group e;

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
-- 抢单组
    -- 1875392811901046784
    -- 1875392811901046785
    -- sn
    -- 202409141746018331

-- 云端 入库前校验
select * from zn_device_sn e where e.zn_device_sn_var = 'csqd001';
select * from zn_channel e where e.zn_device_sn_var = 'csqd001';
