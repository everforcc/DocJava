select *
from znkj_category_series e;

select e.type,e.cs_name,count(*)
from znkj_category_series e
group by e.type,e.cs_name
order by e.cs_name ;
