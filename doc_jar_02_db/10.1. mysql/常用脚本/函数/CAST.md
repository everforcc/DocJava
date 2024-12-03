<span  style="font-family: Simsun,serif; font-size: 17px; ">

### cast

~~~sql
-- CAST(expression AS TYPE);
-- CAST()函数将任何类型的值转换为具有指定类型的值。目标类型可以是以下类型之一：BINARY，CHAR，DATE，DATETIME，TIME，DECIMAL，SIGNED，UNSIGNED。
-- CAST()函数通常用于返回具有指定类型的值，以便在WHERE，JOIN和HAVING子句中进行比较。
~~~

~~~sql
-- 示例
SELECT (1 + '1') / 2;
--
SELECT (1 + CAST('1' AS UNSIGNED)) / 2;
--
SELECT CONCAT('MySQL CAST example #', CAST(2 AS CHAR));
~~~

</span>