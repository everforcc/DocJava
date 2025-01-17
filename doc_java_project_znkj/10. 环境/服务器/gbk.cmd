set filename= fuint_food%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%.sql
echo %filename%
mysqldump -h 192.168.1.180 -P 3306 -u root -pznkj123456 -¨Cset-gtid-purged=OFF fuint_food > %filename%