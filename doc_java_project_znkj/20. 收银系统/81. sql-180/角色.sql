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
where ad.ACCT_ID = 32 ;

select d.*
from t_duty d;