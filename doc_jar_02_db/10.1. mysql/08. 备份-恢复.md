<span  style="font-family: Simsun,serif; font-size: 17px; ">

### sqlyog

- 用客户端导出
- 如果要导入从库,需要修改

~~~
-- 主库
use mdbname
-- 修改为
use mdbname_his
-- 最上面的注释不要修改,否则会报错
-- 暂时不需要过多了解
~~~

### mysqldump

- 8.0 不同版本命令不同
~~~sql
mysqldump -h 127.0.0.1 -P 3306 -uusername -ppassword --databases oneforall > /tmp/back.sql;
~~~

</span>