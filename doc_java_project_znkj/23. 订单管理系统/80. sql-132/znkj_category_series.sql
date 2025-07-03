select *
from znkj_category_series e;

select e.type,e.cs_name,count(*)
from znkj_category_series e
group by e.type,e.cs_name
order by e.cs_name ;

--
select * from znkj_category_series e
where e.id = 1831864987178504194;

--
select * from znkj_kind e
where e.del_flag = 0
  and e.series_id = 1829419449262804994;


-- 产品类别系列
select * from znkj_category_series e
where e.id = 1829419517248278530;
-- 型号 kind_name 可以和父级重复
select e.kind_name,e.* from znkj_kind e
where e.del_flag = 0
  and e.series_id = 1829419517248278530;

-- 递归
select * from znkj_category_series e
where e.id = 1829419407923744769;
select e.del_flag,e.* from znkj_category_series e
where e.parent_id = 1829419407923744769;
SELECT * FROM znkj_category_series WHERE del_flag=0 AND (parent_id = 1829419407923744769 AND del_flag = 0);

-- 根据系列类别id，关联
-- 0
select * from znkj_kind e where e.series_id = 1831864987178504194;
-- 1
select e.id from znkj_kind e where e.series_id = 1829419449262804994;
-- 2
select e.id from znkj_kind e where e.series_id = 1829419517248278530;

-- 0
SELECT COUNT(*) AS total FROM znkj_product
WHERE del_flag = 0 AND
      (kind_id IN (select * from znkj_kind e where e.series_id = 1831864987178504194)
           AND type = 1);
-- 1
SELECT COUNT(*) AS total FROM znkj_product
WHERE del_flag = 0 AND
    (kind_id IN (select e.id from znkj_kind e where e.series_id = 1829419449262804994)
        AND type = 1);
-- 2
SELECT COUNT(*) AS total FROM znkj_product
WHERE del_flag = 0 AND
      (kind_id IN (select e.id from znkj_kind e where e.series_id = 1829419517248278530)
           AND type = 1);
--


