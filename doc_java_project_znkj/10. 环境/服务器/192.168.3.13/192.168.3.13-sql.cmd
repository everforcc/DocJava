
rem 数据库地址
set url=192.168.3.13
rem 数据库名
set db=anm_db

set day=%date:~0,4%-%date:~5,2%-%date:~8,2%
set db_name=%db%_%day%-%time:~0,2%%time:~3,2%%time:~6,2%
set db_sql=%db_name%.sql
set db_7z=db_%db_name%.7z

echo %db%
echo %db_name%
echo %db_sql%
echo %db_7z%

rem 生成sql
mysqldump -h %url% -P 3306 -u root -pznkj123456 %db% > %db_sql%

rem 压缩
7z a -r ./%day%/%db_7z% %db_sql%

rem 删除未压缩文件
del %db_sql%