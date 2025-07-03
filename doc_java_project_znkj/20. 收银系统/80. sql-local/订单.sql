-- 使用卡券的订单
SELECT e.COUPON_ID, e.*
FROM mt_order e
where e.COUPON_ID != '';

-- 根据订单号查询
select e.AMOUNT, e.DISCOUNT, e.PAY_AMOUNT, e.*
from mt_order e
where e.ORDER_SN = '202410221737421703777';

-- 超时订单
SELECT e.REMARK, e.CREATE_TIME, e.COUPON_ID, e.*
FROM mt_order e
where e.REMARK = '超时未支付取消'
order by e.REMARK desc;
