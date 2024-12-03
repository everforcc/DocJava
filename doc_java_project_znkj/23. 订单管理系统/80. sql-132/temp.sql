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
where zt.id in (1833801129650032642,1862786666091556865,1863769716279521281);