

select e.phonenumber, count(e.user_id)
from sys_user e
group by e.phonenumber
;

-- 15210202062
-- 15738573601
-- 17665222565
-- 18012345678

-- 1899798393156841474
select e.*
from sys_user e
where e.phonenumber = '18511251127' or e.user_name like '%18511251127%' ;

select e.create_time,sur.role_id,e.*
from sys_user e left join sys_user_role sur on e.user_id = sur.user_id
order by e.create_time desc;

select e.*
from sys_user e
where e.user_id = 1899798393156841474;

select * from sys_role e ;
select * from sys_user_role sur
where sur.user_id = 1899798393156841474;

select e.pay_time,e.create_time,e.update_time,e.* from zn_pay_order e
where
      order_type = 4 and e.status = 1
    order by  e.create_time desc;