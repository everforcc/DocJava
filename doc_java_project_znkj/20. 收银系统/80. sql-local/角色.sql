select * from t_duty e ;

select d.DUTY_ID
from t_duty d
    left join t_account_duty ad
        on d.DUTY_ID = ad.DUTY_ID
where ad.ACCT_ID = 32 and d.status = 'A'
;

select * from t_account_duty e;

select d.DUTY_ID
from t_duty d
         left join t_account_duty ad
                   on d.DUTY_ID = ad.DUTY_ID
where ad.ACCT_ID = 32;

select * from t_account_duty ad
where ad.ACCT_ID = 17 ;
select * from t_account_duty ad
where ad.ACCT_ID = 18 ;
select * from t_account_duty ad
where ad.ACCT_ID = 147 ;

select * from t_account_duty ad
order by ad.acct_id desc;

select distinct ad.acct_id from t_account_duty ad
order by ad.acct_id asc;

select * from t_duty e;

select d.*
from t_duty d;