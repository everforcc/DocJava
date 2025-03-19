
select e.product_price,e.* from znkj_product e
where e.id = '1889923559631400962';

select e.* from znkj_product e
where  e.series_id = 1900094736119631874 ;

-- znkjCategorySeries
select * from znkj_category_series e
where e.cs_name = '测试类被切换';

-- 1900735698025623553
select e.cs_desc,e.* from znkj_category_series e
where e.type = 2 and e.parent_id = 0;

-- 递归
-- order by e.type

WITH RECURSIVE cte_departments AS (
    SELECT id, parent_id, id AS path
    FROM znkj_category_series
    WHERE parent_id = 1  -- 顶级部门的ID
    UNION ALL
    SELECT d.id, d.parent_id, CONCAT(cte.path, ',', d.id) AS path
    FROM znkj_category_series d
             JOIN cte_departments cte ON d.parent_id = cte.id
)
SELECT * FROM cte_departments;