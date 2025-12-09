#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 检查jq是否安装
if ! command -v jq &> /dev/null; then
    echo -e "\033[0;31m错误：未安装jq软件包，请先安装jq\033[0m"
    exit 1
fi

exec 2>/dev/null

log_api=$(curl -sX POST "http://127.0.0.1:10800/api/v1/login" -H "Content-Type: application/json" -d '{"username": "admin", "password": "0192023a7bbd73250516f069df18b500"}')
login_api_code=$(echo "$log_api" | jq -r '.LiveQing.Header.ErrorNum')
login_api_message=$(echo "$log_api" | jq -r '.LiveQing.Header.ErrorString')
cookie_token=$(echo "$log_api" | jq -r '.LiveQing.Body.CookieToken')

case $log_api in
"")
    echo -e "${RED}登录接口调用错误，无法连接到NVR服务${NC}"
    exit 1
    ;;
"\"用户名或密码错误\"")
    echo -e "${YELLOW}用户名或密码错误，与初始账户密码不符${NC}"
    exit 1
    ;;
*)
    echo -e "\n${BLUE}登录接口返回：${NC}"
    echo -e "${BLUE}状态码:${GREEN}$login_api_code\n${BLUE}消息:${GREEN}$login_api_message\n"
    ;;
esac

get_api=$(curl -sX GET "http://127.0.0.1:10800/api/v1/getrequestkey" -H "Cookie: token=$cookie_token")
get_api_code=$(echo "$get_api" | jq -r '.LiveQing.Header.ErrorNum')
get_api_message=$(echo "$get_api" | jq -r '.LiveQing.Header.ErrorString')
sn=$(echo "$get_api" | jq -r '.LiveQing.Body.RequestKey')

case $get_api in
"")
    echo -e "${RED}机器码接口调用错误，无法连接到NVR服务${NC}"
    exit 1
    ;;
"\"Unauthorized\"")
    echo -e "${YELLOW}登录出现问题，授权出错或token过期${NC}"
    exit 1
    ;;
*)
    echo -e "\n${BLUE}机器码接口返回：${NC}"
    echo -e "${BLUE}状态码:${GREEN}$get_api_code\n${BLUE}消息:${GREEN}$get_api_message\n${BLUE}机器码为：${NC}$sn\n"
    ;;
esac

exec 2>&1

echo -e "${BLUE}授权码接口返回：${NC}"
activation_api_response=$(curl -sX POST "http://192.168.1.122:5000/execute" \
  -H "Content-Type: application/json" \
  -d '{"args":["active", "'"$sn"'", "512", "750EBA411BF27EC1527L1953C69F48F3980C7597C93817115E7DC74CFFDBD3AC889FDA6C1F5F9BE83384556237903727E9BA0923A", "9999"]}')

activation_code=$(echo "$activation_api_response" | jq -r '.stdout')
if [ -z "$activation_code" ] || [ ${#activation_code} -lt 100 ]; then
    echo -e "${BLUE}获取状态：${RED}失败${NC}\n${BLUE}错误代码：${RED}$activation_code${NC}"
    exit 1
fi
echo -e "${BLUE}获取状态：${GREEN}成功${NC}\n${BLUE}开始激活...${NC}\n"

exec 2>/dev/null

activation_api=$(curl -sX GET "http://127.0.0.1:10800/api/v1/verifyproductcode?productcode=$activation_code" -H "Cookie: token=$cookie_token")
activation_api_code=$(echo "$activation_api" | jq -r '.LiveQing.Header.ErrorNum')
activation_api_message=$(echo "$activation_api" | jq -r '.LiveQing.Header.ErrorString')
activation_api_state=$(echo "$activation_api" | jq -r '.LiveQing.Body.State')

case $activation_api in
"")
    echo -e "${RED}激活接口调用错误，无法连接到服务器${NC}"
    exit 1
    ;;
"\"Unauthorized\"")
    echo -e "${YELLOW}登录出现问题，授权出错或token过期${NC}"
    exit 1
    ;;
*)
    echo -e "${BLUE}激活接口返回：${NC}"
    echo -e "${BLUE}状态码:${GREEN}$activation_api_code\n${BLUE}消息:${GREEN}$activation_api_message"
    if [ "$activation_api_state" = "1" ]; then
        echo -e "${BLUE}激活状态: ${GREEN}激活成功${NC}\n"
    else
        echo -e "${BLUE}激活状态: ${RED}激活失败${NC}\n"
    fi
    ;;
esac

exit 0
