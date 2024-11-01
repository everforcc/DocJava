
-- 会员信息
select * from mt_user t where t.STATUS != 'D' AND t.GROUP_ID IN ( 1 );

-- 登录账号关联的会员id
-- admin用户 16
select e.staff_id,e.* from t_account e
where e.acct_id = 2;
select e.staff_id,e.* from t_account e
where e.staff_id = 16;

-- 52
select e.USER_ID,e.* from mt_staff e
where e.ID = 16;

-- 关联关系
-- t_account.staff_id = mt_staff.id
-- mt_staff.USER_ID = mt_user.id
-- mt_cart.USER_ID = mt_user.id

-- 账号 shouyin
-- 是否员工
select e.IS_STAFF,e.ID,e.* from mt_user e
where e.ID = 57;
select e.id,e.* from mt_staff e
where e.USER_ID = 57;
select * from t_account e
where e.staff_id = 21;
select * from mt_cart e
where e.USER_ID = 57;
-- order by e.CREATE_TIME desc

select e.USER_ID,e.* from mt_cart e;

-- 如果穿了 goodIds的情况下
-- 如果传 userid，就切换给这个用户，否则就切换给收银员
-- 如果不传，不切换，单纯查询
select * from mt_user e where e.ID = 56;

select e.MERCHANT_ID, e.* from mt_user e
where e.MERCHANT_ID = 1;