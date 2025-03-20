-- 1901977089791164417
select e.payment_status, e.total_amount, e.manager_id, e.*
from zn_rental_fee_record e
order by e.create_time desc;