
select *
from zn_focus_user_device;

ALTER TABLE zn_focus_user_device ADD focus_type tinyint(1) null comment '0 人员 1 车辆';

