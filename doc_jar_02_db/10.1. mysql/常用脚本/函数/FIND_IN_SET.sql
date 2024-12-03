-- 查找字符串在set中的位置
-- 3
SELECT FIND_IN_SET('1', '2,21,1,4');
-- 0
SELECT FIND_IN_SET('1', '2,21,0,4');
-- 两个参数任意一个为null，就返回null
SELECT FIND_IN_SET('1', NULL);