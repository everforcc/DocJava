-- 时间区间查询
-- DATE
SELECT e.`createtime` FROM cc_novel e
WHERE e.`createtime` >= DATE('2022-09-13') AND e.`createtime` < DATE('2022-09-14');

-- DATE_FORMAT
SELECT e.`createtime`,e.* FROM cc_website e
WHERE e.`createtime` > DATE_FORMAT('2023-03-31 01:00:00', '%Y-%m-%d %H:%i:%s')
ORDER BY e.`createtime` DESC;