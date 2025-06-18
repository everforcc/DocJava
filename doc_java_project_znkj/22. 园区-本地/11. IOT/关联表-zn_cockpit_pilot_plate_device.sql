-- zn_cockpit_pilot_plate_device
-- ¹ØÁª±í
select * from zn_cockpit_pilot_plate_device zcppd ;

-- iot 8
select zcppd.plate_id,zcppd.* from zn_cockpit_pilot_plate_device zcppd
where zcppd.device_type_code = 8;
-- camera 7
select zcppd.plate_id,zcppd.* from zn_cockpit_pilot_plate_device zcppd
where zcppd.device_type_code = 7;

select *
from zn_machine_camera zmc
where zmc.id in (
select distinct zcppd.device_id from zn_cockpit_pilot_plate_device zcppd
where zcppd.device_type_code = 7);
