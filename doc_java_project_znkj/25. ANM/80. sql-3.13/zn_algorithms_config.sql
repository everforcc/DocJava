
-- zn_algorithms_config
select e.deployed_time_json,e.algorithms_id,e.del_flag,e.* from zn_algorithms_config e
where e.model_id = 1871486882813480960;

select count(*) from zn_algorithms_config e
where e.model_id = 1871486882813480960;

select e.deployment_status,e.camera_id,e.deployed_time_json,e.algorithms_id,e.del_flag,e.* from zn_algorithms_config e
where e.model_id = 1871486882813480960
  and e.algorithms_id = 2001 and e.camera_id = 594;

select e.del_flag,e.* from zn_algorithms_config e
where e.id = 1872476739987738624;

SELECT * FROM zn_algorithms_config
WHERE del_flag=0
  AND (model_id = 1871486882813480960 AND algorithms_id = 2001);

select e.deployment_status, e.*
from zn_algorithms_config e
where e.del_flag = 0
  and e.core_id = 29;