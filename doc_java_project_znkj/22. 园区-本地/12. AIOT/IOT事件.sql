
-- 1922588090121396226
select zsrr.sensor_id,zsrr.*
from zn_sensor_report_record zsrr
where zsrr.id = 1931257083251298306
;

-- 1922588090121396226
-- ´«¸ÐÆ÷id
select *
from zn_device_device zdd
where zdd.del_flag = 0
 -- and zdd.device_type = 8
  and zdd.device_id = 1924715772797198338;


select *
from zn_ais_event_data zaed
order by zaed.create_time desc;