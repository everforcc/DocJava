-- 查询用户信息
SELECT * FROM mt_user;
SELECT * FROM t_account;

-- 购物车
SELECT e.* FROM mt_cart e order by e.CREATE_TIME desc ;
SELECT * FROM mt_cart e WHERE e.hang_no = '#07' ;

-- 查询绑定的商品是否存在
SELECT e.is_single_spec,e.* FROM mt_goods e 
WHERE e.type = 'service' AND e.status = 'A' AND e.id = 576;

SELECT * FROM mt_goods t WHERE t.STATUS = 'A' AND t.type = 'service' AND t.id = ?;
