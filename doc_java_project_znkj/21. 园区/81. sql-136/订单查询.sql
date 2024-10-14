-- 订单
SELECT e.* FROM zn_pay_order e order by e.create_time desc ;

-- 订单详情
SELECT e.* FROM zn_pay_order_record e order by e.create_time desc ;
