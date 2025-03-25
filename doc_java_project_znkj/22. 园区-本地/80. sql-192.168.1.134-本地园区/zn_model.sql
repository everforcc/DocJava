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
-- where e.model_name = 'TBSTB001'
order by e.update_time desc;

-- 1904369224120872962
select * from zn_model e
where e.id = 1904369224120872962;

select * from zn_model e
where e.model_name = 'TBCS';

select * from zn_model e
where e.parent_id = 1904369224120872962;

select count(*) from zn_model e
where e.parent_id = 1904369224120872962;


select count(*) from zn_model e
where e.parent_id = 1904374150934900737;

select e.update_time,
       e.create_time,
       e.model_name,
       e.manager_id,
       e.all_id,
       e.last_day,
       e.up_flag,
       e.up_count,
       e.* from zn_model e
order by e.update_time desc;

select e.update_time,
       e.create_time,
       e.model_name,
       e.manager_id,
       e.all_id,
       e.last_day,
       e.up_flag,
       e.up_count,
       e.* from zn_model e
where e.parent_id = 1904374150934900737
order by e.update_time desc;


select count(*) from zn_model e
where e.parent_id = 1904374150934900737;

