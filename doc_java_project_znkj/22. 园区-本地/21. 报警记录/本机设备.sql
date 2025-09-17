-- 硬盘
select *
from zn_machine_disk;
-- 核心
select *
from zn_machine_core;
-- 告警记录
select *
from zn_device_alerts e
where e.alert_type_code=1;
