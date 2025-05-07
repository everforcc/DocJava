

select e.phonenumber, count(e.user_id)
from sys_user e
group by e.phonenumber
;

-- 15210202062
-- 15738573601
-- 17665222565
-- 18012345678

select e.*
from sys_user e
where e.phonenumber = '15738573601';


select e.pay_time,e.create_time,e.update_time,e.* from zn_pay_order e
where
      order_type = 4 and e.status = 1
    order by  e.create_time desc;