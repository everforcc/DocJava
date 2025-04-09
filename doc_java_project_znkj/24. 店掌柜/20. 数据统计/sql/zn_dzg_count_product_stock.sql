-- zn_dzg_count_product_stock

-- 出库入库
select
    sum(IF(zdpsl.store_type = 'C' , zdpsl.nums, 0))
        as count_in,
    sum(IF(zdpsl.store_type = 'R' , zdpsl.nums, 0))
        as count_out
from zn_dzg_product_store_log zdpsl
where zdpsl.del_flag = 0

;

-- 库存数量
select sum(zdp.inventory)
from zn_dzg_product zdp
where zdp.del_flag = 0;

select *
from zn_dzg_product zdp
where zdp.del_flag = 0;


