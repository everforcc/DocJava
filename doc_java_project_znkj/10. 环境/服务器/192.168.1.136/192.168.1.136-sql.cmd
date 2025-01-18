
rem ���ݿ��ַ
set url=192.168.1.136
rem ���ݿ���
set db1=smart_park_config
set db2=smart_park

set day=%date:~0,4%-%date:~5,2%-%date:~8,2%
set db1_name=%db1%_%day%-%time:~0,2%%time:~3,2%%time:~6,2%
set db1_name_sql=%db1%.sql
set db1_name_7z=db_%db1%.7z
echo %db1_name%

rem ����sql�ļ���
set db2_name=%db2%_%day%-%time:~0,2%%time:~3,2%%time:~6,2%
set db2_name_sql=%db2%.sql
set db2_name_7z=db_%db2%.7z
echo %db2_name%

rem ���� db sql
mysqldump -h %url% -P 3306 -u root -pznkj123456 %db1% > %db1_name_sql%
rem ѹ��sql
7z a -r ./%day%/%db1_name_7z% %db1_name_sql%
rem ɾ��δѹ���ļ�
del %db1_name_sql%


rem ���� db2 sql
mysqldump -h %url% -P 3306 -u root -pznkj123456 %db2% > %db2_name_sql%
rem ѹ��sql
7z a -r ./%day%/%db2_name_7z% %db2_name_sql%
rem ɾ��δѹ���ļ�
del %db2_name_sql%
