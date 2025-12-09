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

echo -e "${BLUE}开始重置容器...${NC}"
# 先删除容器
./delimg.sh "$@"
# 再拉起容器
./runimg.sh "$@" && echo -e "${GREEN}容器重置成功${NC}" || echo -e "${RED}容器重置失败${NC}"

exit 0
