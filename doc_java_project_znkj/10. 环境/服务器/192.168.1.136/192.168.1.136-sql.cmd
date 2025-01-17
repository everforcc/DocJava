
rem 生成sql文件名
set filename= smart_park_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
set config= smart_park_config_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
echo %filename%
echo %config%
rem 生成sql
mysqldump -h 192.168.1.136 -P 3306 -u root -pznkj123456 smart_park_config > %config%.sql
7z a -r %config%.7z %config%.sql
rem 压缩
mysqldump -h 192.168.1.136 -P 3306 -u root -pznkj123456 smart_park > %filename%.sql
7z a -r %filename%.7z %filename%.sql
rem 删除未压缩文件
del %filename%.sql
del %config%.sql