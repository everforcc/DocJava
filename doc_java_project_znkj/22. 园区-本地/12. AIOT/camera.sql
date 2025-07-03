select zaed.device_id,zaed.*
from zn_ais_event_data zaed;

select distinct zaed.device_id
from zn_ais_event_data zaed;

-- 1920686923639676929
select *
from zn_machine_camera zmc
where zmc.id = 1920687117668179969;

--
select *
from zn_machine_camera zmc
where zmc.id in (
    select distinct zcppd.device_id
    from zn_cockpit_pilot_plate_device zcppd );

--

-- careme id 事件

select *
from zn_ais_event_data zaed;

-- 1920686923639676929
select distinct zaed.device_id
from zn_ais_event_data zaed;
-- 1920687117668179969
select distinct zaed.camera_id
from zn_ais_event_data zaed;

select *
from zn_machine_camera zmc
where zmc.id in (1920686923639676929, 1920687117668179969);

select *
from zn_machine_camera zmc
where zmc.id in (
select distinct zaed.device_id
from zn_ais_event_data zaed);

select *
from zn_machine_camera zmc
where zmc.id in (
    select distinct zaed.camera_id
    from zn_ais_event_data zaed);



-- plateid
-- 绑定iot设备和相机
-- 相机事件，device_id camera_id
-- 关联关系表， plateid
-- aiot
-- 关联关系表， plateid

