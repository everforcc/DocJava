select e.payment_user_id,e.parking_space_id,e.payment_time, e.create_time, e.update_time, e.del_flag, e.payment_status, e.*
from zn_car_payment_record e
order by e.create_time desc
;

-- ZL0123456788
select distinct e.zn_device_sn_var
from zn_car_payment_record e;