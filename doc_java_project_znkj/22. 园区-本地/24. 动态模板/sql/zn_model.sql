select e.full_name,e.manager_id,e.* from zn_model e
where e.model_type = 1 and e.level = 5
-- 将model_name包装为数字然后排序
order by CAST(e.model_name AS UNSIGNED) ;