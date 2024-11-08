select e.TYPE,e.* from mt_stock e
order by e.ID desc;
select e.WEIGHT,e.NUM,e.* from mt_stock_item e
order by e.ID desc;
select e.WEIGHT,e.stock,e.* from mt_goods e
where e.ID = 610;