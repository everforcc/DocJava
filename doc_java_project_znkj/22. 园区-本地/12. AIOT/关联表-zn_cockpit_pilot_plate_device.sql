-- zn_cockpit_pilot_plate_device
-- ¹ØÁª±í
select * from zn_cockpit_pilot_plate_device zcppd where zcppd.del_flag = 0 and zcppd.plate_id = 1922252721890246658 ;

-- 1920687117668179969
select * from zn_cockpit_pilot_plate_device zcppd where zcppd.del_flag = 0 and zcppd.device_id = 1920687117668179969 ;

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
