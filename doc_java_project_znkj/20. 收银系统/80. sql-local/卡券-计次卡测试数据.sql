--   测试数据

-- 会员可用卡券
-- admin id  2
-- 黄忠   id  40
-- 之前那一次成功绑卡，应该是我手动修改了数据，所以能成功
SELECT t.STATUS,t.EXPIRE_TYPE,t.EXPIRE_TIME,t.* FROM mt_coupon t where t.ID = 10;
SELECT t.USER_ID,t.STATUS,t.* FROM mt_user_coupon t
WHERE t.USER_ID = 40 AND t.STATUS in ( 'A' ) ORDER BY t.BALANCE DESC LIMIT 1000;


SELECT e.type,e.* FROM mt_coupon e where e.ID = 5;
select * from mt_user e where e.id = 2;
select * from mt_user e where e.id = 40;

-- admin用户绑定的卡券
SELECT e.type,e.* FROM mt_coupon e where e.ID = 5;
select t.USER_ID,t.STATUS,t.CREATE_TIME,t.* from mt_user_coupon t where t.ID = 167;

-- 黄忠 id 40 用户绑定的卡券
SELECT e.type,e.* FROM mt_coupon e where e.ID in (5,6);
select t.USER_ID,t.STATUS,t.COUPON_ID,t.CREATE_TIME,t.id,t.* from mt_user_coupon t
where t.USER_ID = 40 and t.STATUS = 'A' and t.TYPE = 'T';
-- 卡券和商品绑定关系
select * from mt_coupon_goods e where e.COUPON_ID in (5,6);


--
SELECT t.USER_ID,t.STATUS,t.CREATE_TIME,t.* FROM mt_user_coupon t WHERE t.USER_ID = 40 AND t.STATUS in ( 'A' ) ;
-- ID 167 USER_ID 修改为 2
SELECT t.USER_ID,t.STATUS,t.CREATE_TIME,t.* FROM mt_user_coupon t where t.ID = 167;


