
-- 1. 设备总数
-- /system/gate/correlationList
select *
from zn_gate zg
where zg.del_flag = 0;

-- 2. 累计通行总人次
select * from zn_gate_record zgr
where zgr.del_flag = 0
order by zgr.create_time desc
--  and zgr.pass_direction = 1
--  and zgr.staff_id = 1925823097675255810
;

-- 3. 当日通行
-- concat(curdate(), ' 00:00:00'),zgr.create_time,
select concat(curdate(), ' 00:00:00'),zgr.create_time,zgr.* from zn_gate_record zgr
where zgr.del_flag = 0
-- 创建时间大于今天0点00
  and zgr.create_time >= concat(curdate(), ' 00:00:00')
order by zgr.create_time desc;

-- 昨日通行
select concat(curdate(), ' 00:00:00'),zgr.create_time,zgr.* from zn_gate_record zgr
where zgr.del_flag = 0
-- 创建时间大于今天0点00
  and zgr.create_time >= concat(date_sub(curdate(), interval 1 day), ' 00:00:00')
  and zgr.create_time < concat(curdate(), ' 00:00:00')
order by zgr.create_time desc;


select count(*) from zn_gate_record zgr
where zgr.del_flag = 0;

-- 4. 重点人员

