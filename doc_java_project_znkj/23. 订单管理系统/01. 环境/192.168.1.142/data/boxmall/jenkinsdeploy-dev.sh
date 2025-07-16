#!/bin/bash

curdir=$(cd `dirname $0`;pwd)
path="${curdir}/boxmall-services_dev-charge/boxmall-services"
deployjarpath="/data/boxmall-docker/ruoyi/"
dockcomposepath="/data/boxmall-docker/"
copyscript="${curdir}/copy-dev.sh"
jarnames="ruoyi-admin ruoyi-monitor-admin ruoyi-xxl-job-admin"

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

function mdfypomfile(){
    pomfile="${path}/pom.xml"
    sed -i "321s/true/false/g" $pomfile
    sed -i "332s/false/true/g" $pomfile
}

function compile {

#    mdfypomfile

    cd $path
#    mvn clean compile -P test
    mvn clean compile -P dev 
    if [ $? -gt 0 ] ; then
        echo "maven compile failed"
    else
#        mvn clean package -P test
        mvn clean package -P dev
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

function delcontainerimage() {
    microname="$1"
    if [ ! -z "$microname" ] ; then
        containerid=`docker container ls -a |grep -i "$microname" |awk '{print $1}'`
        if [ ! -z "$containerid" ] ; then
            for j in $containerid
            do
                docker container stop $j
                docker container rm $j
            done
        fi
        imagesid=`docker image ls |grep -i "$microname" | awk '{print $3}'` 
        if [ ! -z "$imagesid" ] ; then
            for k in $imagesid
            do
                docker image rmi $k
            done
        fi
        docker-compose build $microname
    fi
}

function containerallopt {
    cd $dockcomposepath 
    for i in $jarnames
    do 
        delcontainerimage $i
    done
    docker-compose up -d ruoyi-admin ruoyi-monitor-admin ruoyi-xxl-job-admin 
}


function microcontaineropt {
    cd $dockcomposepath 
    micronames="$1"
    for i in $micronames
    do 
        delcontainerimage $i
        docker-compose up -d $i
    done
}

function containeropt() {
    args="$1"

    if [ "$args" == "all" ] ; then
        containerallopt 
    else
         microcontaineropt "$args"
    fi
} 

function run (){
    args="$1"
    if [ -z "$args" ] ; then
        args="all"
    fi
    pullcode
    compile
    copyjars "$args" 
    containeropt "$args"
}

run "$1"  
