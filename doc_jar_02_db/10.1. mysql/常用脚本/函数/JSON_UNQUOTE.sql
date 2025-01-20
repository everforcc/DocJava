-- 使用 JSON_UNQUOTE 函数去除双引号
SELECT JSON_UNQUOTE('\"abc\"');

-- 配合JSON_EXTRACT使用
SELECT JSON_UNQUOTE(JSON_EXTRACT(column, '$.mark')) AS address FROM dual;