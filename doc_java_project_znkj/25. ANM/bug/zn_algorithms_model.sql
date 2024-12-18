-- 可接入算法次数
-- 128
SELECT e.`algorithms_allow`,e.algorithm_type,e.core_type, e.*
FROM zn_algorithms_model e
where e.algorithm_type = '1' and e.core_type = 'bm1684X';

select mc.max_support_algorithm,mc.algorithm_type, mc.core_type, mc.*
from zn_core_model_capacity mc
where mc.algorithm_type = '1' and mc.core_type = 'bm1684X';
