#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

if [ $# -eq 0 ]; then
    echo -e "${YELLOW}可用容器列表:${NC}"
    echo -e "${BLUE}iccs iccs-dist anm anm-dist aic mysql nginx redis nanomq nvr-rk nvr-a1 nvr-a2${NC}"
    echo -e "${YELLOW}可用容器组列表:${NC}"
    echo -e "${BLUE}rk、rkm、rks、a1、a2、ss${NC}"
    echo -e "${YELLOW}使用示例:${NC}"
    echo -e "${BLUE}  启动单个容器: ./runimg.sh redis${NC}"
    echo -e "${BLUE}  启动多个容器: ./runimg.sh redis mysql nginx${NC}"
    echo -e "${BLUE}  使用profile启动容器组: ./runimg.sh profile rk${NC}"
    echo -e "${RED}Error: 请指定要启动的容器或容器组${NC}"
    exit 1
fi

if [ "$1" = "profile" ]; then
    shift  # 移除profile参数
    docker compose --profile "$@" up -d && echo -e "${GREEN}容器启动成功${NC}" || echo -e "${RED}容器启动失败${NC}"
else
    docker compose up -d "$@" && echo -e "${GREEN}容器启动成功${NC}" || echo -e "${RED}容器启动失败${NC}"
fi

exit 0
