select e.update_time,
       e.create_time,
       e.model_name,
       e.manager_id,
       e.all_id,
       e.last_day,
       e.update_time,
       e.create_time,
       e.*
from zn_model e
order by e.update_time desc;

select e.model_name,
       e.car_space_type,
       e.car_space_max_count,
       e.manager_id,
       e.all_id,
       e.last_day,
       e.update_time,
       e.create_time,
       e.*
from zn_model e
where e.model_name = 'CSTB001'
order by e.update_time desc;
