-- 硬盘
select *
from zn_machine_disk e where e.status != 8;
-- 核心
select *
from zn_machine_core e where e.status = 1;
-- 告警记录
select *
from zn_device_alerts e
where e.alert_type_code=1;
