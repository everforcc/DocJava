select e.* from znkj_product e;
select e.* from znkj_product_config e;

-- 产品关联产品配置
select e.product_status,e.up_status,e.product_name,e.product_config_json, zpc.config_name as productName,e.*
from znkj_product e
    left join znkj_product_config zpc
        on zpc.parent_id = '1829412137844346881' and zpc.id = JSON_EXTRACT(e.product_config_json, '$[0].value')
WHERE e.del_flag=0 AND (e.type = 1) ORDER BY e.create_time DESC LIMIT 10;

-- 算力核心
SELECT *
FROM znkj_product WHERE id=1833791562513911809 AND del_flag=0;

-- 有产品类型的数据
SELECT COUNT(*) AS total FROM znkj_product WHERE del_flag = 0 AND (type = 1 AND product_status = 1 AND up_status = 1 AND product_name = '算例核心5101');

