select * from  mt_store e
where e.STATUS = 'A';

SELECT * FROM mt_store
WHERE status <> 'D' AND merchant_id = 1
  AND IS_DEFAULT = 'y'
  AND ID = 4;

SELECT * FROM mt_merchant E
where e.STATUS = 'A'
AND e.ID = 1;
