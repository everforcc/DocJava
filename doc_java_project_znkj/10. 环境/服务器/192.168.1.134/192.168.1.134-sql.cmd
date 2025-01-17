
rem 生成sql文件名
set url=192.168.1.134
set db=smartparklocal

set filename=%db%_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
set filenamesql=%filename%.sql
set filename7z=db_%filename%.7z
echo %db%
echo %filename%
echo %filenamesql%
echo %filename7z%

rem 生成sql
mysqldump -h %url% -P 3306 -u root -pznkj123456 %db% > %filenamesql%

rem 压缩
7z a -r %filename7z% %filenamesql%

rem 删除未压缩文件
del %filenamesql%