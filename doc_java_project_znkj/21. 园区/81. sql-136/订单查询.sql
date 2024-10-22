-- 订单
SELECT e.* FROM zn_pay_order e
where e.id = '1043156362961494016'
order by e.create_time desc ;

-- 订单详情
SELECT e.* FROM zn_pay_order_record e order by e.create_time desc ;
