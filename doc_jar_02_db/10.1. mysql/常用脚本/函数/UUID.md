### UUID

~~~sql
SELECT 
UUID(),
(SELECT UUID()),
REPLACE(UUID(),'-',''),
REPLACE((SELECT UUID()),'-',''),
e.`createtime` 
FROM oneforall.`cc_novel` e;
~~~