-- ʹ�� JSON_UNQUOTE ����ȥ��˫����
SELECT JSON_UNQUOTE('\"abc\"');

-- ���JSON_EXTRACTʹ��
SELECT JSON_UNQUOTE(JSON_EXTRACT(column, '$.mark')) AS address FROM dual;