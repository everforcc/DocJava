
-- 卡券表
SELECT * FROM mt_coupon e;
-- 卡券商品表
SELECT * FROM mt_coupon_goods;
-- 优惠券组
SELECT * FROM mt_coupon_group;
-- 会员卡券表
SELECT * FROM mt_user_coupon e;

-- 根据商品ID查询出可用的卡券ID
-- 卡券ID，商品ID
SELECT e.coupon_id,e.goods_id,e.* FROM mt_coupon_goods e;

-- 某个用户是否有这个卡券ID
SELECT e.coupon_id,e.* FROM mt_user_coupon e
WHERE e.type = 'T' AND e.user_id = 12 AND e.status = 'A' AND e.coupon_id IN (3,5) ;

select * from mt_user e
where e.ID = '4';

--
SELECT t.USER_ID,t.COUPON_ID,t.* FROM mt_user_coupon t
WHERE t.STATUS in ('A') and t.USER_ID = 4;

SELECT * FROM mt_coupon e
where e.NAME = '测试计次卡';

SELECT * FROM mt_user_coupon e
where e.TYPE = 'T' and e.STATUS = 'A' ;

select * from mt_coupon_goods o where o.COUPON_ID = ? and o.STATUS = 'A';

select distinct e.STATUS from mt_confirm_log e;
-- mt_confirm_log 卡券核销流水
select e.ORDER_ID,e.* from mt_confirm_log e;

select count(*) from mt_confirm_log e;
select count(e.ORDER_ID), e.ORDER_ID from mt_confirm_log e
group by e.ORDER_ID;

-- 现有的卡券分类
SELECT e.type,e.* FROM mt_coupon e
where e.TYPE = 'T' and e.STATUS = 'A';
SELECT * FROM mt_coupon_goods;

-- 会员可用卡券
-- id 2 系统管理员 admin
-- id 40
-- 之前那一次成功绑卡，应该是我手动修改了数据，所以能成功
SELECT t.USER_ID,t.STATUS,t.* FROM mt_user_coupon t WHERE t.USER_ID = 40 AND t.STATUS in ( 'A' ) ORDER BY t.BALANCE DESC LIMIT 1000;
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


