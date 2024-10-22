-- 商品
SELECT e.LOGO,e.IMAGES,e.CREATE_TIME,e.* FROM mt_goods e
ORDER BY e.CREATE_TIME DESC;

-- 理发计次卡
select e.STATUS,e.type,e.* from mt_goods e where e.ID = 578;

select * from mt_goods t where t.id = ? and t.STATUS = 'A' AND t.type = ?;

select t.COUPON_IDS,t.PRICE,t.* from mt_goods t ;