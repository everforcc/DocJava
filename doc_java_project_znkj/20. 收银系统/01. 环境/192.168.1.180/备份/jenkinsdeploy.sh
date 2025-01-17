#!/bin/bash

curdir=$(cd `dirname $0`;pwd)
path="${curdir}/fuintadmin-service"
deployjarpath="/data/fuintFOODsys/jar"
copyscript="${curdir}/copy.sh"
jarnames="fuint-food-1.0.0.jar"

function pullcode {

    cd $path
    #以远程gitlab为准，删除本地差异文件
#    git fetch --all
#    git reset --hard  origin/master
#    git clean -f
#    git pull -u origin master
    git pull 

    if [ $? -gt 0 ] ; then
        echo "pull code failed" 
    fi 
}


function compile {

#    mdfypomfile

    cd $path
    mvn clean compile -P prod 
    if [ $? -gt 0 ] ; then
        echo "maven compile failed"
    else
        mvn clean package -P prod
        if [ $? -gt 0 ] ; then
            echo "maven package failed"
        fi
    fi
    
}

function copyjars(){

    args="$1"
    if [ -e $copyscript ] ; then
        $copyscript "$args" 
    else
        echo "copy script file is not exist" 
    fi 
}

function killproc() {
    jarname="$1"
    pid=`ps -ef |grep -i "$jarname" |grep -iv "grep" | awk '{print $2}'`
    kill -9 $pid
}

function startproc() {
    jarname="$1"
    javaopt="-Dfile.encoding=UTF-8 -Xmx2048m -Xms2048m -Xss256k -Xmn1024m"

    nohup /opt/java/jdk1.8.0_421/bin/java $javaopt -jar ${deployjarpath}/$jarname >/data/fuintFOODsys/jar/logs.txt 2>&1 &    
}

function run (){
    args="$1"
    pullcode
    compile
    killproc "$args"
    copyjars "$args" 
    startproc "$args" 
}

run "fuint-food-1.0.0.jar"  
