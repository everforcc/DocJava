
-- 车牌相机
select * from zn_car_park_vehicle_record_history;
select *
from zn_car_park_vehicle_record;

-- 1. 设备数量
-- /system/carPlateCamera/carPlateCamera
select zcpc.*
from zn_car_plate_camera zcpc
where zcpc.del_flag = 0;

-- --------------------------

-- 车位
-- 2. 车位数量
SELECT * FROM zn_model WHERE model_type = 2 AND LEVEL =4 AND del_flag = 0;
-- 3. 剩余车位
SELECT * FROM zn_model WHERE model_type = 2 AND LEVEL =4 AND del_flag = 0 AND manager_id is null;
-- 4. 重点车辆-todo


-- ---------------------
select zcpvr.pay_money,zcpvr.*
from zn_car_park_vehicle_record zcpvr;
-- 1. 当日入场总数
select zcpvr.pay_money,zcpvr.*
from zn_car_park_vehicle_record zcpvr
where zcpvr.del_flag = 0
  and zcpvr.in_out = 0
and zcpvr.create_time >= concat(curdate(), ' 00:00:00')
;
-- 2. 当日出场总数
select zcpvr.pay_money,zcpvr.*
from zn_car_park_vehicle_record zcpvr
where zcpvr.del_flag = 0
  and zcpvr.in_out = 1
  and zcpvr.create_time >= concat(curdate(), ' 00:00:00')
;
-- 3. 停车费总收入
-- 之前的+昨天的
select zcpvr.pay_money,zcpvr.*
from zn_car_park_vehicle_record zcpvr
where zcpvr.del_flag = 0
  and zcpvr.in_out = 1
  and zcpvr.status = 2
  and zcpvr.create_time >= concat(date_sub(curdate(), interval 1 day), ' 00:00:00')
  and zcpvr.create_time < concat(curdate(), ' 00:00:00')
;

-- 4. 当日停车费收入
select zcpvr.pay_money,zcpvr.*
from zn_car_park_vehicle_record zcpvr
where zcpvr.del_flag = 0
  and zcpvr.in_out = 1
  and zcpvr.status = 2
  and zcpvr.create_time >= concat(curdate(), ' 00:00:00')
;

