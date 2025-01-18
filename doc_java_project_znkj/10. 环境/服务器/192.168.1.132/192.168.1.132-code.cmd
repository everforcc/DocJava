
git clone -b dev_stone http://guokailong:c.c.5664@gitlab.zgzhongnan.com/root/boxmall-services.git

set day=%date:~0,4%-%date:~5,2%-%date:~8,2%
set filename=code_boxmall-services_%day%-%time:~0,2%%time:~3,2%%time:~6,2%

rem Ñ¹Ëõ
7z a -r ./%day%/%filename%.7z boxmall-services/*
rem É¾³ýÔ´ÎÄ¼þ
rmdir /S /Q boxmall-services
