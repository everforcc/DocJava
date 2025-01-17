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

codepath="/data/code/fuintapp/fuintadmin-service"
deploypath="/data/fuintFOODsys/jar"

function copyalljars() {
    # copy jar
    echo "begin copy fuint-food-1.0.0.jar "
    cp ${codepath}/fuint-application/target/fuint-food-1.0.0.jar ${deploypath}/fuint-food-1.0.0.jar
    
}



function run(){

    jarnames="$1"

    datestr=`date +%Y%m%d%H%M%S`
    cp -rf ${deploypath}/fuint-food-1.0.0.jar ${deploypath}/fuint-food-1.0.0.jar.${datestr}

    copyalljars 
}

run "$1"
