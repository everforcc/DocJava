select t.MOBILE,t.MERCHANT_ID,t.* from mt_user t where t.status != 'D' and t.MOBILE != '';

select t.status,t.MERCHANT_ID,t.* from mt_user t where t.MOBILE = '15136126776' AND t.status != 'D';

SELECT * FROM mt_coupon WHERE ID = 5;


select * from mt_user_coupon e;