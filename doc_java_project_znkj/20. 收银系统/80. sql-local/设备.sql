-- 设备 本地配置
-- 2024-05-07 17:52:23
SELECT e.activation_date,e.*
FROM zn_local e;

update zn_local set activation_date = null
where id = 1;