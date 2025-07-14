#!/bin/bash

curdir=$(cd `dirname $0`;pwd)
path="${curdir}/dev_charge/smartparkcloud-services/"
deployjarpath="/home/smartparkcloud-docker/ruoyi/"
dockcomposepath="/home/smartparkcloud-docker/"
copyscript="${curdir}/copy_148_dev.sh"
jarnames="ruoyi-gateway ruoyi-auth ruoyi-modules-system ruoyi-modules-file ruoyi-visual-monitor ruoyi-dm ruoyi-dm-cli ruoyi-modules-ai"
python_script="/data/smartparkcloud/ding.py"


python "$python_script" message
function pullcode {

    cd $path
    #以远程gitlab为准，删除本地差异文件
    git pull 

    if [ $? -gt 0 ] ; then
        echo "pull code failed" 
    fi 
}

function compile {


    cd $path
    mvn clean compile 
    if [ $? -gt 0 ] ; then
        echo "maven compile failed"
    else
        mvn clean package -P dev148
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
        ssh root@192.168.1.148 "/usr/bin/bash /home/smartparkcloud-docker/deleteimg.sh \"${microname}\""
    fi
}

function containerallopt {
#    cd $dockcomposepath 
    for i in $jarnames
    do 
        delcontainerimage $i
        ssh root@192.168.1.148 "cd /home/smartparkcloud-docker/&& ./dockercompose.sh \"${i}\""
    done
}


function microcontaineropt {
    cd $dockcomposepath 
    micronames="$1"
    for i in $micronames
    do 
        delcontainerimage $i
        ssh root@192.168.1.148 "cd /home/smartparkcloud-docker/&&./dockercompose.sh \"${i}\""
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
    python "$python_script" message2
}

run "$1"  
