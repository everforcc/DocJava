
select *
from t_t1 e;

update t_t1
set b=b + -1
where a = 1;

update t_t1
set b=b + 1
where a = 1;

update t_t1
set b=b + +1
where a = 1;
