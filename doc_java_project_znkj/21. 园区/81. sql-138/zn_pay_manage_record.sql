select e.record_status, e.pay_time, e.amount, e.order_small_type, e.biz_id, e.*
from zn_pay_manage_record e
order by e.create_time desc;

