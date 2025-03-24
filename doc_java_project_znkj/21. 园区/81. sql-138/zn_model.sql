select e.model_name, e.manager_id, e.all_id, e.last_day, e.update_time, e.create_time, e.*
from zn_model e
where e.model_type = 2
  and e.level = 4
--  and e.all_id like '%1901619558699417602%'
--  and e.manager_id is not null
  and e.zn_device_sn_var = 'ZL0123456788'
order by e.last_day desc;
-- order by e.model_name;


select distinct level
from zn_model e;

select e.all_id, e.*
from zn_model e
where e.zn_device_sn_var = 'ZL0123456788'
  and e.level = 2
  and e.model_type = 2
  and e.del_flag = 0;

select e.model_name, e.manager_id, e.all_id, e.last_day, e.update_time, e.create_time, e.*
from zn_model e
where e.model_type = 2
  and e.level = 4
  and e.manager_id is not null
order by e.create_time desc;

