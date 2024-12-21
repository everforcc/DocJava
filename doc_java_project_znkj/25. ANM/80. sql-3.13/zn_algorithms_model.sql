
-- 算法类型(1目标识别、2特征检测)
select e.id,e.algorithm_type,e.* from zn_algorithms_model e ;

-- 27
select e.core_id,e.* from zn_algorithms_model e ;

select * from zn_algorithms_config e
where e.core_id = 27;

--
SELECT * FROM zn_algorithms_model
WHERE del_flag=0 AND algorithm_type = 1 AND id <> 1866378124951154688;
