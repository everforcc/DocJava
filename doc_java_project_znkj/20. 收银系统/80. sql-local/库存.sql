select e.TYPE,e.* from mt_stock e
order by e.ID desc;
select e.WEIGHT,e.NUM,e.* from mt_stock_item e
order by e.ID desc;
select e.WEIGHT,e.stock,e.* from mt_goods e
where e.ID = 610;

-- нч©Б╢Ф
-- D(String), 1(String), 0(Integer), 4(String), 0(Integer), 0(Integer), S(String), 0(Integer), S(String), 0(Integer)
SELECT count(0) FROM mt_goods
WHERE status <> 'D' AND merchant_id = 1 AND (store_id = 0 OR store_id = 4)

  AND ((is_single_spec <> 'S' AND stock > 0))
  AND ((is_single_spec = 'S' AND weight > 0));

-- 39
SELECT count(0)
FROM mt_goods
WHERE status <> 'D'
  AND merchant_id = 1
  AND (store_id = 0 OR store_id = 4);
-- 35
SELECT count(0)
FROM mt_goods
WHERE status <> 'D'
  AND merchant_id = 1
  AND (store_id = 0 OR store_id = 4)
  AND ((is_single_spec <> 'S' AND stock > 0) OR (is_single_spec = 'S' AND weight > 0));
-- 4
SELECT count(0)
FROM mt_goods
WHERE status <> 'D'
  AND merchant_id = 1
  AND (store_id = 0 OR store_id = 4)
  AND ((is_single_spec <> 'S' AND stock = 0) OR (is_single_spec = 'S' AND weight = 0));