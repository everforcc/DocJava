select *
from znkj_category_series
where parent_id = 0
  and type = 2
  and del_flag = 0;