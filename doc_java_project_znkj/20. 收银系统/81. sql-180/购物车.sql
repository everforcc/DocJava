-- 查询用户信息
SELECT * FROM mt_user;
SELECT * FROM t_account;

-- 购物车
SELECT e.NUM,e.GOODS_ID,e.CREATE_TIME,e.* FROM mt_cart e order by e.CREATE_TIME desc ;
SELECT e.is_single_spec,e.* FROM mt_goods e where e.ID = '578';
select * from mt_coupon_goods e where e.GOODS_ID = 578 ;
select * from mt_coupon e where e.ID = 5;
select * from mt_user_coupon e
where e.COUPON_ID = 5 and e.USER_ID = 40 and e.STATUS = 'A' ;


SELECT * FROM mt_cart e WHERE e.hang_no = '#07' ;

-- 查询绑定的商品是否存在
SELECT e.is_single_spec,e.* FROM mt_goods e 
WHERE e.type = 'service' AND e.status = 'A' AND e.id = 576;

SELECT * FROM mt_goods t WHERE t.STATUS = 'A' AND t.type = 'service' AND t.id = ?;
