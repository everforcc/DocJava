-- 商品
SELECT e.LOGO, e.IMAGES, e.CREATE_TIME, e.*
FROM mt_goods e
ORDER BY e.CREATE_TIME DESC;

-- 根据id查询
select e.STATUS, e.type, e.COUPON_IDS, e.PRICE, e.STOCK, e.*
from mt_goods e
where e.ID = 578;

-- 查询最新的
select e.STOCK, e.STATUS, e.type, e.COUPON_IDS, e.PRICE, e.*
from mt_goods e
order by e.UPDATE_TIME desc;

select * from mt_cart e;
select count(*) from mt_cart e
where e.HANG_NO = '#02';
delete from mt_cart where HANG_NO='';

select * from mt_goods_cate e;

SELECT e.STATUS,e.*
FROM mt_goods e
where e.CATE_ID = 5;


SELECT distinct e.STATUS
FROM mt_goods e;

SELECT e.*
FROM mt_goods e
where e.ID = 595;

select distinct e.account_status
from t_account e;

