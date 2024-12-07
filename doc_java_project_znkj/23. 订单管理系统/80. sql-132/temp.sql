select e.minimum_purchase_quantity, e.stock_quantity, e.del_flag, e.*
from znkj_product e
where e.del_flag = 0
  and e.id = 1862697898626035713;

-- ¹ºÎï³µ
select *
from znkj_shopping_trolley zt
where zt.del_flag = 0
  and zt.product_id = 1862697898626035713;

select *
from znkj_shopping_trolley zt
where zt.id in (1833801129650032642, 1862786666091556865, 1863769716279521281);

--

SELECT *
FROM znkj_product
WHERE del_flag = 0
  AND (type = 1 AND product_status = 1 AND up_status = 1 AND product_name LIKE '%ËãÀýºËÐÄ5101%')
LIMIT 10;


select *
from znkj_app_banner e
where e.del_flag = 0;

SELECT e.create_time, e.*
FROM znkj_app_banner e
WHERE del_flag=0 AND (status = '0') ORDER BY create_time DESC;