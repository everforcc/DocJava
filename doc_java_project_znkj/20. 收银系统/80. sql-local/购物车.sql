-- 查询用户信息
SELECT *
FROM mt_user;
SELECT *
FROM t_account;

-- 购物车 最新排序
SELECT e.*
FROM mt_cart e
order by e.CREATE_TIME desc;

-- 挂单
SELECT *
FROM mt_cart e
WHERE e.hang_no = '#07';

-- 查询绑定的商品是否存在
SELECT e.is_single_spec, e.*
FROM mt_goods e
WHERE e.type = 'service'
  AND e.status = 'A'
  AND e.id = 576;
