
-- 1. 数据存在 NOT EXISTS
SELECT '1' FROM DUAL WHERE NOT EXISTS
(SELECT 1 FROM oneforall.cc_website e WHERE e.`id` = '1' );
-- 2. 数据存在 EXISTS
SELECT '1' FROM DUAL WHERE EXISTS
(SELECT 1 FROM oneforall.cc_website e WHERE e.`id` = '1' );