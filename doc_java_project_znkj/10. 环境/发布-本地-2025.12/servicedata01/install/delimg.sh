#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

if [ $# -eq 0 ]; then
    echo -e "${RED}Error: 至少需要一个容器名称参数${NC}"
    exit 1
fi

function delcontainer() {
    for conname in "$@"; do
        if [[ "$conname" == *"nvr"* ]]; then
            conname="nvr"
        fi

        containerid=$(docker ps -a --format '{{.Names}}' | grep -E "^(zn-)?${conname}$" | awk '{print $1}')
        if [ -n "$containerid" ]; then
            for idstr in $containerid; do
                local imgname
                imgname=$(docker ps -a | grep -i "$idstr" | awk '{print $NF}')
        echo -e "${BLUE}正在停止容器 $imgname${NC}"
        docker container stop "$idstr" >/dev/null 2>&1 && echo -e "${GREEN}容器 $imgname 停止成功${NC}" || echo -e "${RED}容器 $imgname 停止失败${NC}"
        echo -e "${BLUE}正在删除容器 $imgname${NC}"
        docker container rm -f "$idstr" >/dev/null 2>&1 && echo -e "${GREEN}容器 $imgname 删除成功${NC}" || echo -e "${RED}容器 $imgname 删除失败${NC}"
            done
        fi
    done
}

function delimage() {
    for imgkword in "$@"; do
        if [[ "$imgkword" == *"nvr"* ]]; then
            imgkword="nvr"
        fi

        imageid=$(docker images --format '{{.Repository}}' | grep -E "^(zn-)?${imgkword}$" | awk '{print $3}')
        if [ -n "$imageid" ]; then
            for imgid in $imageid; do
                local imgname
                imgname=$(docker images | grep -i "$imgid" | awk '{print $1}')
        echo -e "${BLUE}正在删除镜像 $imgname${NC}"
        docker image rmi -f "$imgid" >/dev/null 2>&1 && echo -e "${GREEN}镜像 $imgname 删除成功${NC}\n" || echo -e "${RED}镜像 $imgname 删除失败${NC}\n"
            done
        fi
    done
}

delcontainer "$@"
delimage "$@"

exit 0
