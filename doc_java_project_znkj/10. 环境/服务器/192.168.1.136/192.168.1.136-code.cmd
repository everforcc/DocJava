
git clone -b dev-lease_20250102 http://guokailong:c.c.5664@gitlab.zgzhongnan.com/root/smartparkcloud-services.git

set day=%date:~0,4%-%date:~5,2%-%date:~8,2%
set filename=code_smartparkcloud-services_%day%-%time:~0,2%%time:~3,2%%time:~6,2%

rem ѹ��
7z a -r ./%day%/%filename%.7z smartparkcloud-services/*
rem ɾ��Դ�ļ�
rmdir /S /Q smartparkcloud-services
