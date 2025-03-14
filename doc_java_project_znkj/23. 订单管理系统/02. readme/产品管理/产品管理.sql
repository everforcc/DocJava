
-- 修改完之后需要重新保存，才能覆盖掉数据库中的数据
-- 查看只是根据里
-- 1829412137844346881
select e.product_config_json,e.* from znkj_product e where e.del_flag = 0;

select * from znkj_product_config e
where e.id  in (1829412564279234562, 1829412303221559297,1829412180169068546);


