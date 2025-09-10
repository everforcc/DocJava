select *
from zn_meter_payment_recrd;

-- 水表
select count(*)
from zn_meter_water_metadata e
where del_flag = 0
  and e.device_id in (select id
                      from zn_meter_water a
                      where a.del_flag = 0);

select *
from zn_meter_water
where id = 1920747566048731137;

-- 电表
select *
from zn_meter_electric e where e.del_flag = 0;
select count(*)
from zn_meter_electric_metadata a
where a.del_flag = 0
  and a.device_id in (select e.id
                         from zn_meter_electric e where e.del_flag = 0);