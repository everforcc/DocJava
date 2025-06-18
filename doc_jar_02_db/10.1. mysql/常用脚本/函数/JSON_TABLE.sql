SELECT jt.name,jt.value
FROM zn_user,
     JSON_TABLE(
             labels_json,
             '$[*]' COLUMNS(
                 id VARCHAR(50) PATH '$.id',
                 name VARCHAR(255) PATH '$.name',
                 value VARCHAR(255) PATH '$.value'
                 )
         ) AS jt
WHERE jt.id = '1920674861240803330';

SELECT
    JSON_UNQUOTE(JSON_EXTRACT(zn_user.labels_json, CONCAT('$[', idx, '].name'))) AS name,
    JSON_UNQUOTE(JSON_EXTRACT(zn_user.labels_json, CONCAT('$[', idx, '].value'))) AS value
FROM zn_user,
     (SELECT 0 AS idx UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
         -- ... 可根据需要扩展更多数字 (最多99)
     ) AS indexes
WHERE
        idx < JSON_LENGTH(zn_user.labels_json)
  AND zn_user.labels_json->>CONCAT('$[', idx, '].id') = '1920674861240803330';