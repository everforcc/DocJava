-- mysql行转列
-- group_concat( [DISTINCT] 需要连接的字段 [Order BY 排序字段 ASC/DESC] [Separator ‘分隔符’] )
-- SEPARATOR
-- 测试语法
SELECT GROUP_CONCAT(DISTINCT e.dict_name ORDER BY e.`dict_id` DESC SEPARATOR'\n\n')
FROM sys_dict_type e;

-- 组装字符串
SELECT GROUP_CONCAT(CONCAT('// ', e.dict_name,'\n','public static final String ', UPPER(e.dict_type), " = \"", e.`dict_type`, "\" ;")SEPARATOR'\n\n')
FROM sys_dict_type e;
