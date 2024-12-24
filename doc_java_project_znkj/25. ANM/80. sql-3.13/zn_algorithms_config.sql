
-- zn_algorithms_config
select e.deployed_time_json,e.algorithms_id,e.del_flag,e.* from zn_algorithms_config e
where e.model_id = 1871486882813480960;

select count(*) from zn_algorithms_config e
where e.model_id = 1871486882813480960;

select e.deployment_status,e.camera_id,e.deployed_time_json,e.algorithms_id,e.del_flag,e.* from zn_algorithms_config e
where e.model_id = 1871486882813480960
  and e.algorithms_id = 2001 and e.camera_id = 594;
