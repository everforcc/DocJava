-- mysql��ת��
-- group_concat( [DISTINCT] ��Ҫ���ӵ��ֶ� [Order BY �����ֶ� ASC/DESC] [Separator ���ָ�����] )
-- SEPARATOR
-- �����﷨
SELECT GROUP_CONCAT(DISTINCT e.dict_name ORDER BY e.`dict_id` DESC SEPARATOR'\n\n')
FROM sys_dict_type e;

-- ��װ�ַ���
SELECT GROUP_CONCAT(CONCAT('// ', e.dict_name,'\n','public static final String ', UPPER(e.dict_type), " = \"", e.`dict_type`, "\" ;")SEPARATOR'\n\n')
FROM sys_dict_type e;
