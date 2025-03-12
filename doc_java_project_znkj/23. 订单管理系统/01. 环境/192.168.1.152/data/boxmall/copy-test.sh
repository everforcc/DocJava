#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
#echo "begin copy sql "
#cp ../sql/ry_20210908.sql ./mysql/db
#cp ../sql/ry_config_20220114.sql ./mysql/db

# copy html
#echo "begin copy html "
#cp -r ../ruoyi-ui/dist/** ./nginx/html/dist

codepath="/data/boxmall/boxmall-services_test/boxmall-services"
dockerpath="/data/boxmall-docker"

function copyalljars() {
    # copy jar
    echo "begin copy ruoyi-admin "
    cp ${codepath}/ruoyi-admin/target/ruoyi-admin.jar ${dockerpath}/ruoyi/admin/target/
    
    echo "begin copy ruoyi-monitor-admin "
    cp ${codepath}/ruoyi-extend/ruoyi-monitor-admin/target/ruoyi-monitor-admin.jar ${dockerpath}/ruoyi/extend/ruoyi-monitor-admin/target/
    
    echo "begin copy ruoyi-xxl-job-admin "
    cp ${codepath}/ruoyi-extend/ruoyi-xxl-job-admin/target/ruoyi-xxl-job-admin.jar ${dockerpath}/ruoyi/extend/ruoyi-xxl-job-admin/target/
    
}

function copyjar() {

    jarnm="$1"
    
    case $jarnm in 
        ruoyi-admin)
            echo "begin copy ruoyi-admin "
            cp ${codepath}/ruoyi-admin/target/ruoyi-admin.jar ${dockerpath}/ruoyi/admin/target/
        ;; 
        ruoyi-monitor-admin)
            echo "begin copy ruoyi-monitor-admin "
            cp ${codepath}/ruoyi-extend/ruoyi-monitor-admin/target/ruoyi-monitor-admin.jar ${dockerpath}/ruoyi/extend/ruoyi-monitor-admin/target/
        ;;
        ruoyi-xxl-job-admin)
            echo "begin copy ruoyi-xxl-job-admin "
            cp ${codepath}/ruoyi-extend/ruoyi-xxl-job-admin/target/ruoyi-xxl-job-admin.jar ${dockerpath}/ruoyi/extend/ruoyi-xxl-job-admin/target/
        ;;
        *) 
            echo "input jar name error"
        ;;
    esac

}

function copyjars(){

    jarnamestr="$1"

    for i in $jarnamestr
    do
        copyjar "$i"
    done
}

function run(){

    jarnames="$1"

    datestr=`date +%Y%m%d%H%M%S`
    cp -rf ${dockerpath}/ruoyi ${dockerpath}/ruoyi${datestr}

    if [ "$jarnames" == "all" ] ; then
        copyalljars 
    else
        copyjars "$jarnames"  
    fi
}

run "$1"
