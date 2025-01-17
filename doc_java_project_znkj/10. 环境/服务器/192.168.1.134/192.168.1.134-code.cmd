
git clone -b app_up-20241102 http://guokailong:c.c.5664@gitlab.zgzhongnan.com/root/smartparklocal.git
set filename= code_smartparklocal_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
7z a -r %filename%.7z smartparklocal/*
rem É¾³ýÔ´ÎÄ¼þ
rmdir /S /Q smartparklocal
