<span  style="font-family: Simsun,serif; font-size: 17px; ">

### dual

~~~sql
SELECT VERSION()
FROM DUAL;
~~~

~~~sql
-- sql不区分大小写格式化时间 分 用 mi 
select to_date('2005-01-01 13:14:20', 'yyyy-mm-dd HH24:mi:ss')
from dual; 
~~~

### INFORMATION_SCHEMA

- 表名，列名

~~~sql
SELECT COUNT(*)
FROM INFORMATION_SCHEMA.Columns
WHERE table_schema = 'bank_dev'
  AND table_name = 't_old_branchdetail'
  AND column_name = 'sponsor';

SELECT *
FROM INFORMATION_SCHEMA.Columns;
~~~

- 查看创建时间

~~~sql

~~~

</span>