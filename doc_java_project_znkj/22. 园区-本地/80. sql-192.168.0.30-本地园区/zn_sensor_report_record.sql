select *
from zn_sensor_report_record;

select distinct zsrr.is_deal
from zn_sensor_report_record zsrr;

select record.is_deal,count(record.id) as count  from zn_sensor sensor
                                                          inner join zn_sensor_report_record record on record.sensor_id = sensor.id
where sensor.del_flag = 0 and record.del_flag = 0

group by record.is_deal;

select *
from  zn_sensor zs where zs.del_flag = 0 ;