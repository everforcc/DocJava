select e.group_id, e.user_phone, e.password, e.*
from zn_event_process_staff e;

select e.group_id,e.zn_device_sn_var,e.* from zn_device_lease e;

select e.zn_device_sn_var,e.* from
zn_ais_event_data_details_operate e;
