select e.order_type,e.zn_device_sn_var, e.order_small_type, e.status, e.price, e.order_json, e.zn_device_sn_var, e.*
from zn_pay_order e
where e.id = 1100148727039008768
order by e.create_time desc;



-- 1100038494488764416
select e.pay_order_id,e.order_small_type,e.record_status, e.pay_time, e.amount, e.order_small_type, e.biz_id,e.zn_device_sn_var, e.*
from zn_pay_manage_record e
where e.pay_order_id = 1100148727039008768
order by e.create_time desc;

-- 1901977089791164417
select e.payment_status,e.zn_device_sn_var,e.paid_amount,e.* from zn_rental_fee_record e
where e.id = 1901976822777577474;

