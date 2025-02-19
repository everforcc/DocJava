
-- 库位
select e.* from zn_dzg_warehouse e ;
select e.* from zn_dzg_warehouse_log e ;
-- 分类
select e.* from zn_dzg_goods_type e ;
-- 物品
select e.del_flag,e.* from zn_dzg_goods e ;
-- 1890322409819144194
select e.warehouse_id,e.* from zn_dzg_stock e
where e.goods_id = 1890322409819144194;

--

select e.*,w.absolute_path from zn_dzg_warehouse_log e
left join zn_dzg_warehouse w on e.warehouse_id = w.id
where e.del_flag = 0 and e.warehouse_id = 1891690416600412161;

select e.id,e.name 物品名称,e.specification 物品规格,zdw.absolute_path 库位,e.stock_num 盘点数量
from zn_dzg_goods e
left join zn_dzg_stock s on e.id = s.goods_id
left join zn_dzg_warehouse zdw on s.warehouse_id = zdw.id
where e.del_flag = 0 and s.del_flag = 0 and zdw.del_flag = 0
and e.id in (1890326675774414849,1890322409819144194);