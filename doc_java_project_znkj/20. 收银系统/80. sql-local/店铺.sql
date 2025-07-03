select * from  mt_store e
where e.STATUS = 'A';

SELECT * FROM mt_store
WHERE status <> 'D' AND merchant_id = 1
  AND IS_DEFAULT = 'y'
  AND ID = 4;

SELECT * FROM mt_merchant E
where e.STATUS = 'A'
AND e.ID = 1;

-- 主键自增从几开始
SELECT AUTO_INCREMENT
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'fuint_food'
  AND TABLE_NAME = 'mt_store';