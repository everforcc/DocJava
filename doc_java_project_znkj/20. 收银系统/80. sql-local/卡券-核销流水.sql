-- 卡券核销流水，按照时间倒序排列
select e.CREATE_TIME, e.USER_COUPON_ID, e.ORDER_ID as '订单ID', e.*
from mt_confirm_log e
order by e.CREATE_TIME desc;

-- 查询具体的订单
select e.PAY_STATUS, e.COUPON_ID, e.*
from mt_order e
where e.ID = 180;
