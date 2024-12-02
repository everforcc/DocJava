-- 配合模糊查询
SELECT e.`sourceurl`,REPLACE(REPLACE(e.`sourceurl`,'（','('),'）',')')  FROM cc_novel e
WHERE
REPLACE(REPLACE(e.`sourceurl`,'（','('),'）',')')
LIKE
CONCAT('%',REPLACE(REPLACE('(n'	,'（','('),'）',')'),'%');