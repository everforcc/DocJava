SELECT t.STATUS,t.EXPIRE_TYPE,t.EXPIRE_TIME,t.BEGIN_TIME,t.END_TIME,t.* FROM mt_coupon t where t.ID = 14;
SELECT t.USER_ID,t.STATUS,t.CREATE_TIME,t.EXPIRE_TIME,t.* FROM mt_user_coupon t where t.COUPON_ID = 14;

SELECT t.USER_ID,t.COUPON_ID,t.STATUS,t.CREATE_TIME,t.EXPIRE_TIME,t.* FROM mt_user_coupon t
where t.USER_ID = 40 and t.STATUS = 'A' and t.ID = 174;

select e.STATUS,e.REMARK,e.USER_COUPON_ID,e.* from mt_confirm_log e
where e.USER_COUPON_ID = 174
and e.STATUS = 'A'
order by e.CREATE_TIME desc;

select * from mt_coupon_goods e;

select e.REMARK,e.COUPON_ID,e.STATUS,e.CREATE_TIME,e.* from mt_order e
-- where e.ORDER_SN = '2410232016180004533627'
where e.COUPON_ID = '174'
order by e.CREATE_TIME desc;
-- 坏了，有超时取消未支付的数据，然后回撤销就有多个卡券了

-- 商品 按照修改时间倒序排列

SELECT e.SORT,e.UPDATE_TIME,e.* FROM mt_goods e
WHERE status <> 'D' AND merchant_id = 1 AND ( store_id = 0 OR store_id = 4 )
ORDER BY sort ASC , update_time DESC LIMIT 100;
