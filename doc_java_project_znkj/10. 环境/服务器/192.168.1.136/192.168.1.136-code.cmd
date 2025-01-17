
git clone -b dev-lease_20250102 http://guokailong:c.c.5664@gitlab.zgzhongnan.com/root/smartparkcloud-services.git
set filename= smartparkcloud-services_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%
7z a -r %filename%.7z smartparkcloud-services/*
rem É¾³ýÔ´ÎÄ¼þ
rmdir /S /Q smartparkcloud-services
