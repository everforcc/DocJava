
select zcpvrh.create_time,zcpvrh.*
from zn_car_park_vehicle_record_history zcpvrh
where zcpvrh.del_flag = 0
  -- and zcpvrh.in_out = 0
  and zcpvrh.create_time >= concat(curdate(), ' 00:00:00');


select zcpvr.create_time,zcpvr.*
from zn_car_park_vehicle_record zcpvr
where zcpvr.del_flag = 0
  and zcpvr.create_time >= concat(curdate(), ' 00:00:00');

