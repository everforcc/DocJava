select e.create_time,e.* from znkj_category_series e where e.type = 2 and e.parent_id != 0 order by  e.create_time;

select * from znkj_category_series
where parent_id=0 and type = 2;

select e.* from znkj_category_series e
where e.parent_id in (select id from znkj_category_series
                      where parent_id=0 and type = 2);

select * from znkj_category_series
where parent_id = 1899760881486589953 and type = 2;

select * from znkj_category_series order by create_time desc;


