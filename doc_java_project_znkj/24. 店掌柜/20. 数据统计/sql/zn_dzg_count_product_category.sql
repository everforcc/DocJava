-- zn_dzg_count_product_category

-- ·ÖÀà
select zdpc.category_name name,count(zdp.id) num
from zn_dzg_product_category zdpc
         left join zn_dzg_product zdp on zdp.product_category_id = zdpc.id
where zdpc.del_flag = 0
  and zdp.del_flag = 0
group by zdp.product_category_id
;

select zdpc.category_name name,
       count(zdp.id) num
               from zn_dzg_product_category zdpc
               left join zn_dzg_product zdp on zdp.product_category_id = zdpc.id
               where zdpc.del_flag = 0
                   and zdp.del_flag = 0
               group by zdp.product_category_id;

select zdp.product_category_id ,sum(zdp.inventory) from zn_dzg_product zdp
group by zdp.product_category_id
;

