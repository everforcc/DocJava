-- �����ַ�����set�е�λ��
-- 3
SELECT FIND_IN_SET('1', '2,21,1,4');
-- 0
SELECT FIND_IN_SET('1', '2,21,0,4');
-- ������������һ��Ϊnull���ͷ���null
SELECT FIND_IN_SET('1', NULL);