
-- 梯控
select *
from zn_lift_record;

-- 1. 设备数量
-- /system/lift/correlationList

select *
from zn_lift zl
where  zl.del_flag = 0;

-- 2. 累计同行总人次
select *
from zn_lift_record zlr
where zlr.del_flag = 0;

-- 3. 当日通行
select *
from zn_lift_record zlr
where zlr.del_flag = 0
  and zlr.create_time >= concat(curdate(), ' 00:00:00')
order by zlr.create_time desc;
;
-- 昨日通行
select *
from zn_lift_record zlr
where zlr.del_flag = 0
  and zlr.create_time >= concat(date_sub(curdate(), interval 1 day), ' 00:00:00')
  and zlr.create_time < concat(curdate(), ' 00:00:00')
;

-- 4. 重点人员

