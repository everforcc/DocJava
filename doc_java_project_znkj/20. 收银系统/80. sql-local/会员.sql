
-- 会员信息
select * from mt_user t where t.STATUS != 'D' AND t.GROUP_ID IN ( 1 );
