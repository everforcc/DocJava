select e.remark, e.create_time, e.update_time, e.del_flag,e.payment_status, e.*
from zn_car_payment_record e
-- where e.id = 1100178799544377344
order by e.payment_status desc
;