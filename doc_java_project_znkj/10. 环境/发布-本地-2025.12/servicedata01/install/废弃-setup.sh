#!/bin/bash

# 全局变量定义
# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 系统配置
LOG_RETENTION_COUNT=3  # 日志保留数量

# 路径配置
SERVICE_DATA_DIR="/data/servicedata"  # 服务数据目录
BACKUP_DIR="/data/backup"  # 备份目录
#DOWNLOAD_URL="http://download.zgzhongnan.com/s/RXDKwh"  # 更新包下载地址
#UPDATE_FILE="servicedata.tar.gz"  # 更新包文件名

# 网络配置
MAIN_CORE_IP="127.0.0.1"
STORAGE_CORE_IPS=("192.168.100.2" "192.168.100.3" "192.168.100.4" "192.168.100.5")
COMPUTE1_CORE_IPS=("192.168.110.2" "192.168.110.3" "192.168.110.4" "192.168.110.5")
COMPUTE2_CORE_IPS=("192.168.120.2" "192.168.120.3" "192.168.120.4" "192.168.120.5")

# 用户凭证
DEFAULT_USER="znkj"
DEFAULT_PASS="znkj"
COMPUTE_USER="linaro"
COMPUTE_PASS="linaro"

# 日志配置
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
LOG_DIR="${SCRIPT_DIR}/logs"
LOG_FILE="${LOG_DIR}/$(date "+%Y-%m-%d_%H:%M:%S").log"
LOG_ENABLED=true

# 初始化字符设置
stty erase '^?'
stty erase '^H'

# 检查并创建日志目录
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR" || {
        echo -e "${RED}无法创建日志目录 ${LOG_DIR}${NC}"
        exit 1
    }
    chmod 755 "$LOG_DIR"
fi

# 版本比较函数
# 返回值: 0=版本相同, 1=版本1>版本2, 2=版本1<版本2
compare_versions() {
    local ver1=$1
    local ver2=$2
    local IFS=.
    local i ver1=($ver1) ver2=($ver2)

    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i=${#ver2[@]}; i<${#ver1[@]}; i++)); do
        ver2[i]=0
    done

    for ((i=0; i<${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            return 1
        elif [[ 10#${ver1[i]} -gt 10#${ver2[i]} ]]; then
            return 1
        elif [[ 10#${ver1[i]} -lt 10#${ver2[i]} ]]; then
            return 2
        fi
    done
    return 0
}

# 清理旧日志文件，保留最新的3个
cleanup_logs() {
    if [ -d "$LOG_DIR" ]; then
        # 查找所有.log文件，按修改时间倒序排列
        files=($(find "$LOG_DIR" -name "*.log" -type f -printf "%T@ %p\n" | sort -rn | cut -d' ' -f2))

        # 保留最新的LOG_RETENTION_COUNT个文件
        if [ ${#files[@]} -gt $LOG_RETENTION_COUNT ]; then
            for ((i=$LOG_RETENTION_COUNT; i<${#files[@]}; i++)); do
                rm -f "${files[i]}"
                log_msg "INFO" "删除旧日志文件: ${files[i]}"
            done
        fi
    fi
}

# 日志函数
# output_mode: 0=两者都输出(默认), 1=只输出日志文件, 2=只输出控制台
log_msg() {
    local level=$1
    local message=$2
    local output_mode=${3:-0}  # 默认为0(两者都输出)
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    # 控制台输出
    if [[ $output_mode -eq 0 || $output_mode -eq 2 ]]; then
        case $level in
            "INFO")
                echo -e "${GREEN}[${timestamp}][INFO] ${message}${NC}"
                ;;
            "WARN")
                echo -e "${YELLOW}[${timestamp}][WARN] ${message}${NC}"
                ;;
            "ERROR")
                echo -e "${RED}[${timestamp}][ERROR] ${message}${NC}"
                ;;
            *)
                echo -e "${BLUE}[${timestamp}][DEBUG] ${message}${NC}"
                ;;
        esac
    fi

    # 文件输出
    if [[ $output_mode -eq 0 || $output_mode -eq 1 ]] && [ "$LOG_ENABLED" = true ]; then
        echo "[${timestamp}][${level}] ${message}" >> "$LOG_FILE"
    fi
}

# 工具函数部分
# 确认操作
# 返回: 0=确认, 1=取消
confirm_action() {
    local action=$1
    while true; do
        read -rp "$(echo -e "${GREEN}确定要${action}吗? (Y/n) [${YELLOW}Y${GREEN}]: ${NC}")" confirm
        confirm=${confirm:-y}
        case $confirm in
            [Yy]*)
                return 0
                ;;
            [Nn]*)
                echo -e "${YELLOW}已取消${action}操作${NC}"
                return 1
                ;;
            *)
                echo -e "${RED}无效输入，请输入 Y 或 n${NC}"
                ;;
        esac
    done
}

# 打印分割线
print_divider() {
    echo -e "${BLUE}========================================${NC}"
}

# 从TAG中提取版本号
extract_version() {
    local tag=$1
    # 匹配x.x.x或x.x格式的版本号
    if [[ $tag =~ ([0-9]+\.){1,2}[0-9]+ ]]; then
        echo "${BASH_REMATCH[0]}"
    else
        echo ""
    fi
}

# 核心功能函数部分
# 检测核心状态
check_core_status() {
    local device_model=$1
    local ips=()

    # 设置不区分大小写匹配
    local old_nocasematch
    shopt -q nocasematch && old_nocasematch=1 || old_nocasematch=0
    shopt -s nocasematch

    # 根据设备型号设置要ping的IP列表
    case $device_model in
        *1c*)
            ips=("$MAIN_CORE_IP")
            ;;
        *1a*)
            ips=("$MAIN_CORE_IP")
            ;;
        *1b*)
            ips=("$MAIN_CORE_IP")
            ;;
        *1s*)
            ips=("$MAIN_CORE_IP")
            ;;
        *1c1a*)
            ips=("$MAIN_CORE_IP" "${COMPUTE1_CORE_IPS[0]}")
            ;;
        *1c1s*)
            ips=("$MAIN_CORE_IP" "${COMPUTE1_CORE_IPS[0]}")
            ;;
        *1c2s*)
            ips=("$MAIN_CORE_IP" "${COMPUTE1_CORE_IPS[0]}" "${COMPUTE1_CORE_IPS[1]}")
            ;;
        "*2c2s *")
            ips=("$MAIN_CORE_IP" "${STORAGE_CORE_IPS[0]}" "${COMPUTE1_CORE_IPS[0]}" "${COMPUTE1_CORE_IPS[1]}")
            ;;
        *3c*)
            ips=("$MAIN_CORE_IP" "${STORAGE_CORE_IPS[0]}" "${STORAGE_CORE_IPS[1]}"
                 "${COMPUTE1_CORE_IPS[0]}" "${COMPUTE1_CORE_IPS[1]}" "${COMPUTE1_CORE_IPS[2]}" "${COMPUTE1_CORE_IPS[3]}"
                 "${COMPUTE2_CORE_IPS[0]}" "${COMPUTE2_CORE_IPS[1]}" "${COMPUTE2_CORE_IPS[2]}" "${COMPUTE2_CORE_IPS[3]}")
            ;;
        *5c*)
            ips=("$MAIN_CORE_IP" "${STORAGE_CORE_IPS[0]}" "${STORAGE_CORE_IPS[1]}" "${STORAGE_CORE_IPS[2]}" "${STORAGE_CORE_IPS[3]}"
                 "${COMPUTE1_CORE_IPS[0]}" "${COMPUTE1_CORE_IPS[1]}" "${COMPUTE1_CORE_IPS[2]}" "${COMPUTE1_CORE_IPS[3]}"
                 "${COMPUTE2_CORE_IPS[0]}" "${COMPUTE2_CORE_IPS[1]}" "${COMPUTE2_CORE_IPS[2]}" "${COMPUTE2_CORE_IPS[3]}")
            ;;
        *)
            log_msg "WARN" "未知设备型号: $device_model"
            ;;
    esac

    # 恢复原来的nocasematch设置
    [[ $old_nocasematch -eq 0 ]] && shopt -u nocasematch

    # 并行ping检测并收集结果
    local status_output=""
    for ((i=0; i<${#ips[@]}; i++)); do
        local core_name=""
        local ip="${ips[i]}"

        # 判断IP类型
        if [[ "$ip" == "$MAIN_CORE_IP" ]]; then
            core_name="主核心"
        else
            # 检查存储核心
            for ((j=0; j<${#STORAGE_CORE_IPS[@]}; j++)); do
                if [[ "$ip" == "${STORAGE_CORE_IPS[j]}" ]]; then
                    core_name="存储核心$((j+1))"
                    break
                fi
            done

            # 检查算力核心1
            if [ -z "$core_name" ]; then
                for ((j=0; j<${#COMPUTE1_CORE_IPS[@]}; j++)); do
                    if [[ "$ip" == "${COMPUTE1_CORE_IPS[j]}" ]]; then
                        core_name="算力核心1-$((j+1))"
                        break
                    fi
                done
            fi

            # 检查算力核心2
            if [ -z "$core_name" ]; then
                for ((j=0; j<${#COMPUTE2_CORE_IPS[@]}; j++)); do
                    if [[ "$ip" == "${COMPUTE2_CORE_IPS[j]}" ]]; then
                        core_name="算力核心2-$((j+1))"
                        break
                    fi
                done
            fi

            # 检查算力核心3
            if [ -z "$core_name" ]; then
                for ((j=0; j<${#COMPUTE3_CORE_IPS[@]}; j++)); do
                    if [[ "$ip" == "${COMPUTE3_CORE_IPS[j]}" ]]; then
                        core_name="算力核心3-$((j+1))"
                        break
                    fi
                done
            fi

            # 检查算力核心4
            if [ -z "$core_name" ]; then
                for ((j=0; j<${#COMPUTE4_CORE_IPS[@]}; j++)); do
                    if [[ "$ip" == "${COMPUTE4_CORE_IPS[j]}" ]]; then
                        core_name="算力核心4-$((j+1))"
                        break
                    fi
                done
            fi

            # 默认命名
            if [ -z "$core_name" ]; then
                core_name="核心$((i+1))"
            fi
        fi

        if ping -c 1 -W 1 "$ip" &> /dev/null; then
            status_output+="${YELLOW}${core_name} ${GREEN}在线${NC}"
        else
            status_output+="${YELLOW}${core_name} ${RED}离线${NC}"
        fi

        if [ $i -lt $((${#ips[@]}-1)) ]; then
            status_output+="、"
        fi
    done

    echo "$status_output"
}

# 检测软件版本信息
check_software_versions() {
    # 检测znhead状态
    local znhead_status=$(dpkg --list | grep -w znhead)
    local znhead_version=""
    local output=""
    local return_code=0

    if [[ -n "$znhead_status" ]]; then
        local status_code=$(echo "$znhead_status" | awk '{print $1}')
        znhead_version=$(echo "$znhead_status" | awk '{print $3}' | cut -d'.' -f1-3)

        case "$status_code" in
            ii)
                output+="${BLUE}zn_head:${NC} ${GREEN}${znhead_version}${NC}\n"
                log_msg "INFO" "zn_head已安装，版本: $znhead_version" "1"
                return_code=0  # 正常安装状态
                ;;
            rc)
                output+="${BLUE}zn_head:${NC} ${YELLOW}已被卸载但配置残留${NC}\n"
                log_msg "WARN" "zn_head已移除但配置残留" "1"
                return_code=2  # 需要重新安装
                ;;
            iU)
                output+="${BLUE}zn_head:${NC} ${YELLOW}上次安装未完成${NC}\n"
                log_msg "WARN" "zn_head安装未完成" "1"
                return_code=3  # 安装异常
                ;;
            rH)
                output+="${BLUE}zn_head:${NC} ${YELLOW}卸载失败${NC}\n"
                log_msg "WARN" "zn_head移除失败" "1"
                return_code=3  # 异常状态
                ;;
            pC)
                output+="${BLUE}zn_head:${NC} ${YELLOW}完全卸载未完成${NC}\n"
                log_msg "WARN" "zn_head完全清除未完成" "1"
                return_code=3  # 异常状态
                ;;
            h*)
                output+="${BLUE}zn_head:${NC} ${YELLOW}版本被保留，已禁止升级${NC}\n"
                log_msg "WARN" "zn_head版本被保留" "1"
                return_code=3  # 异常状态
                ;;
            *)
                output+="${BLUE}zn_head:${NC} ${RED}未知状态${NC}\n"
                log_msg "WARN" "zn_head未知状态: $status_code" "1"
                return_code=3  # 异常状态
                ;;
        esac

        # 仅在正常安装状态下进行版本比较
        if [ "$status_code" = "ii" ]; then
            # 从.env文件读取目标版本号
            local target_version=$(grep 'znhead_version=' ${SCRIPT_DIR}/.env | cut -d'=' -f2)
            if [ -n "$target_version" ]; then
                # 比较版本号
                compare_versions "$target_version" "$znhead_version"
                case $? in
                    0)
                        log_msg "INFO" "zn_head版本已是最新" "1"
                        return_code=0  # 版本最新
                        ;;
                    1)
                        log_msg "INFO" "zn_head需要更新 (当前: $znhead_version, 目标: $target_version)" "1"
                        return_code=1  # 需要更新
                        ;;
                    2)
                        log_msg "WARN" "zn_head版本高于目标版本 (当前: $znhead_version, 目标: $target_version)" "1"
                        return_code=0  # 版本高于目标，视为正常
                        ;;
                esac
            fi
        fi
    else
        output+="${BLUE}zn_head:${NC} ${YELLOW}未安装${NC}\n"
        log_msg "INFO" "zn_head未安装" "1"
        return_code=2  # 未安装
    fi

    # 检测docker容器并提取版本号
    local iccs_container=$(docker ps -a --filter "name=^zn-iccs$" --format "{{.Image}}" | cut -d':' -f2)
    # 提取x.x.x格式版本号
    iccs_container=$(echo "$iccs_container" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    local anm_container=$(docker ps -a --filter "name=^zn-anm$" --format "{{.Image}}" | cut -d':' -f2)
    # 提取x.x.x格式版本号
    anm_container=$(echo "$anm_container" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | head -1)

    if [ -n "$iccs_container" ]; then
        output+="${BLUE}zn-iccs:${NC} ${GREEN}${iccs_container}${NC}\n"
        log_msg "INFO" "zn-iccs服务已安装，版本: $iccs_container" "1"
    else
        output+="${BLUE}zn-iccs:${NC} ${RED}未安装${NC}\n"
    fi

    if [ -n "$anm_container" ]; then
        output+="${BLUE}zn-anm:${NC} ${GREEN}${anm_container}${NC}"
        log_msg "INFO" "zn-anm服务已安装，版本: $anm_container" "1"
    else
        output+="${BLUE}zn-anm:${NC} ${RED}未安装${NC}"
    fi

    echo -e "$output"
    return $return_code
}

# 获取设备信息
get_device_info() {
    local device_model=""

    # 获取所有WAN网卡IP地址
    local wan_interfaces=$(ip -o link show | awk -F': ' '{print $2}' | grep 'wan')
    for iface in $wan_interfaces; do
        local ip_addr=$(ip -4 addr show $iface | grep -oP '(?<=inet\s)\d+(\.\d+){3}' || echo "未获取到")
        if [ "$ip_addr" = "未获取到" ]; then
            echo -e "$iface IP: ${YELLOW}${ip_addr}${NC}"
        else
            echo -e "$iface IP: ${GREEN}${ip_addr}${NC}"
        fi
    done
    [ -z "$wan_interfaces" ] && echo -e "${YELLOW}未找到WAN网卡${NC}"

    # 优先从/proc/device-tree/model获取设备型号
    if [ -f "/proc/device-tree/model" ]; then
        device_model=$(tr -d '\0' < /proc/device-tree/model)
        log_msg "INFO" "从/proc/device-tree/model获取设备型号: $device_model" "1"
    fi

    # 如果未获取到，尝试从/proc/cpuinfo获取
    if [ -z "$device_model" ] && [ -f "/proc/cpuinfo" ]; then
        device_model=$(awk -F': ' '/model name/{print $2; exit}' /proc/cpuinfo)
        log_msg "INFO" "从/proc/cpuinfo获取设备型号: $device_model" "1"
    fi

    # 如果仍未获取到，提示用户
    if [ -z "$device_model" ]; then
        device_model="未获取到设备型号"
        log_msg "WARN" "无法获取设备型号"
        echo -e "${YELLOW}无法识别设备型号，按回车键退出...${NC}"
        read
        exit 1
    fi

    echo -e "设备型号: ${GREEN}${device_model}${NC}"
    # 检测核心状态
    local status=$(check_core_status "$device_model")
    echo -e "设备状态: $status"

    # 检测并显示软件版本信息
    check_software_versions
}

# 修改.env文件中aicTAG字段的第一个部分
update_aic_model() {
    local new_model=$1
    local aic_line=$(grep 'aicTAG=' ${SCRIPT_DIR}/.env)
    local current_model=$(echo "$aic_line" | cut -d'=' -f2 | cut -d'-' -f1)

    if [ -z "$new_model" ]; then
        log_msg "ERROR" "无效的芯片类型"
        echo -e "${RED}无效的芯片类型${NC}"
        exit 1
    fi

    # 备份原文件
    cp ${SCRIPT_DIR}/.env ${SCRIPT_DIR}/.env.bak
    log_msg "INFO" "已创建版本号备份文件"

    # 替换模型名称
    sed -i "s/^aicTAG=.*/aicTAG=${new_model}-$(echo "$aic_line" | cut -d'-' -f2-)/" ${SCRIPT_DIR}/.env
    log_msg "INFO" "已将aicTAG从${current_model}修改为${new_model}"
    echo -e "${GREEN}已更新aic模型为 ${new_model}${NC}"
}

# 处理znhead安装/更新
handle_znhead_installation() {
    local device_model=$1
    local check_result=$2

    # 根据设备型号选择目标IP
    local target_ip="localhost"
    case $device_model in
        *1c1a*|*1c1s*|*1c2s*|"*2c2s *"|*3c*|*5c*)
            target_ip="${COMPUTE1_CORE_IPS[0]}"
            ;;
    esac

    case $check_result in
        1)  # 需要更新
            log_msg "INFO" "开始更新znhead (目标IP: $target_ip)"
            echo -e "${YELLOW}检测到znhead需要更新，正在更新...${NC}"
            remote_exec "$target_ip" "sudo apt-get update && sudo apt-get install -y --only-upgrade znhead"
            if [ $? -eq 0 ]; then
                log_msg "INFO" "znhead更新成功"
                echo -e "${GREEN}znhead更新成功${NC}"
            else
                log_msg "ERROR" "znhead更新失败"
                echo -e "${RED}znhead更新失败${NC}"
                exit 1
            fi
            ;;
        2)  # 未安装
            log_msg "INFO" "开始安装znhead (目标IP: $target_ip)"
            echo -e "${YELLOW}检测到znhead未安装，正在安装...${NC}"
            remote_exec "$target_ip" "sudo apt-get update && sudo apt-get install -y znhead"
            if [ $? -eq 0 ]; then
                log_msg "INFO" "znhead安装成功"
                echo -e "${GREEN}znhead安装成功${NC}"
            else
                log_msg "ERROR" "znhead安装失败"
                echo -e "${RED}znhead安装失败${NC}"
                exit 1
            fi
            ;;
        3)  # 状态异常
            log_msg "ERROR" "znhead状态异常，无法自动处理"
            echo -e "${RED}znhead状态异常，请手动检查${NC}"
            exit 1
            ;;
    esac
    return 0
}

# 远程执行命令
remote_exec() {
    local ip=$1
    local cmd=$2
    local user="$DEFAULT_USER"
    local pass="$DEFAULT_PASS"

    # 根据IP段设置用户名和密码
    if [[ $ip =~ ${COMPUTE1_CORE_IPS[0]%\.*}\. || $ip =~ ${COMPUTE2_CORE_IPS[0]%\.*}\. ]]; then
        user="$COMPUTE_USER"
        pass="$COMPUTE_PASS"
    fi

    log_msg "INFO" "在${ip}上执行命令: ${cmd}"
    sshpass -p "${pass}" ssh -o StrictHostKeyChecking=no ${user}@${ip} "$cmd"
    if [ $? -ne 0 ]; then
        log_msg "ERROR" "在${ip}上执行命令失败: ${cmd}"
        echo -e "${RED}在${ip}上执行命令失败${NC}"
        #return 1
    fi
}

# 文件传输函数
transfer_files() {
    local targets=("$@")
    local success=true

    for target in "${targets[@]}"; do
        if ! rsync -azrhupPl --checksum "$SERVICE_DATA_DIR" "$target"; then
            log_msg "ERROR" "文件传输到${target}失败"
            echo -e "${RED}文件传输到${target}失败${NC}"
            success=false
        fi
    done

    $success || return 1
}

# 启动服务函数
start_services() {
    local targets=("$@")
    local success=true

    for target in "${targets[@]}"; do
        local ip=${target%:*}
        local profile=${target#*:}
        if ! remote_exec "$ip" "cd ${SERVICE_DATA_DIR}/install && docker compose --profile $profile up -d"; then
            success=false
        fi
    done

    $success || return 1
}

# 获取设备配置
get_device_config() {
    local device_model=$1
    local config=()

    # 设置不区分大小写匹配
    local old_nocasematch
    shopt -q nocasematch && old_nocasematch=1 || old_nocasematch=0
    shopt -s nocasematch

    case $device_model in
        *1c*)
            config=(
                "aic_model="
                "transfer_targets="
                "service_targets=localhost:rk"
            )
            ;;
        *1a*)
            config=(
                "aic_model=cv186"
                "transfer_targets="
                "service_targets=localhost:a2"
            )
            ;;
        *1b*)
            config=(
                "aic_model=bm1688"
                "transfer_targets="
                "service_targets=localhost:a2"
            )
            ;;
        *1s*)
            config=(
                "aic_model=bm1684x"
                "transfer_targets="
                "service_targets=localhost:a1"
            )
            ;;
        *1c1a*|*1c1s*)
            remote_model=$(remote_exec "192.168.110.2" "awk -F': ' '/model name/{print \$2; exit}' /proc/cpuinfo") || return 1
            config=(
                "aic_model=${remote_model%% *}"
                "transfer_targets=linaro@192.168.110.2:/data/"
                "service_targets=localhost:rkm service_targets=192.168.110.2:ss"
            )
            ;;
        *1c2s*)
            config=(
                "aic_model=bm1684x"
                "transfer_targets=linaro@192.168.110.2:/data/ transfer_targets=linaro@192.168.110.3:/data/"
                "service_targets=localhost:rkm service_targets=192.168.110.2:ss service_targets=192.168.110.3:ss"
            )
            ;;
        "*2c2s *")
            config=(
                "aic_model=bm1684x"
                "transfer_targets=znkj@192.168.100.2:/data/ transfer_targets=linaro@192.168.110.2:/data/ transfer_targets=linaro@192.168.110.3:/data/"
                "service_targets=localhost:rkm service_targets=192.168.100.2:rks service_targets=192.168.110.2:ss service_targets=192.168.110.3:ss"
            )
            ;;
        *3c*)
            config=(
                "aic_model=bm1684x"
                "transfer_targets=znkj@192.168.100.2:/data/ transfer_targets=znkj@192.168.100.3:/data/ transfer_targets=linaro@192.168.110.2:/data/ transfer_targets=linaro@192.168.110.3:/data/ transfer_targets=linaro@192.168.110.4:/data/ transfer_targets=linaro@192.168.110.5:/data/ transfer_targets=linaro@192.168.120.2:/data/ transfer_targets=linaro@192.168.120.3:/data/ transfer_targets=linaro@192.168.120.4:/data/ transfer_targets=linaro@192.168.120.5:/data/"
                "service_targets=localhost:rkm service_targets=192.168.100.2:rks service_targets=192.168.100.3:rks service_targets=192.168.110.2:ss service_targets=192.168.110.3:ss service_targets=192.168.110.4:ss service_targets=192.168.110.5:ss service_targets=192.168.120.2:ss service_targets=192.168.120.3:ss service_targets=192.168.120.4:ss service_targets=192.168.120.5:ss"
            )
            ;;
        *5c*)
            config=(
                "aic_model=bm1684x"
                "transfer_targets=znkj@192.168.100.2:/data/ transfer_targets=znkj@192.168.100.3:/data/ transfer_targets=znkj@192.168.100.4:/data/ transfer_targets=znkj@192.168.100.5:/data/ transfer_targets=linaro@192.168.110.2:/data/ transfer_targets=linaro@192.168.110.3:/data/ transfer_targets=linaro@192.168.110.4:/data/ transfer_targets=linaro@192.168.110.5:/data/ transfer_targets=linaro@192.168.120.2:/data/ transfer_targets=linaro@192.168.120.3:/data/ transfer_targets=linaro@192.168.120.4:/data/ transfer_targets=linaro@192.168.120.5:/data/"
                "service_targets=localhost:rkm service_targets=192.168.100.2:rks service_targets=192.168.100.3:rks service_targets=192.168.100.4:rks service_targets=192.168.100.5:rks service_targets=192.168.110.2:ss service_targets=192.168.110.3:ss service_targets=192.168.110.4:ss service_targets=192.168.110.5:ss service_targets=192.168.120.2:ss service_targets=192.168.120.3:ss service_targets=192.168.120.4:ss service_targets=192.168.120.5:ss"
            )
            ;;
        *)
            log_msg "WARN" "未知设备型号: $device_model"
            echo -e "${RED}未知设备型号: $device_model${NC}"
            [[ $old_nocasematch -eq 0 ]] && shopt -u nocasematch
            exit 1
            ;;
    esac

    # 恢复原来的nocasematch设置
    [[ $old_nocasematch -eq 0 ]] && shopt -u nocasematch

    # 返回配置数组
    echo "${config[@]}"
}

# 安装功能
install() {
    # if ! confirm_action "安装"; then
    #     return 1
    # fi

    # 初始化变量
    local iccs_installed anm_installed device_model znhead_status

    # 检查iccs和anm是否已安装
    iccs_installed=$(docker ps -a --filter "name=^zn-iccs$" --format "{{.ID}}")
    anm_installed=$(docker ps -a --filter "name=^zn-anm$" --format "{{.ID}}")

    if [ -n "$iccs_installed" ] || [ -n "$anm_installed" ]; then
        log_msg "WARN" "检测到已安装的服务: iccs=$iccs_installed, anm=$anm_installed"
        echo -e "${RED}检测到已安装的服务，请先卸载或使用更新功能${NC}"
        echo -e "${YELLOW}按任意键返回主菜单...${NC}"
        read
        return 1
    fi

    log_msg "INFO" "开始安装流程"

    # 获取设备信息和znhead状态
    device_model=$(get_device_info | grep "设备型号" | cut -d' ' -f4)
    [ -z "$device_model" ] && exit 1

    check_software_versions >/dev/null
    znhead_status=$?
    log_msg "DEBUG" "设备型号: $device_model, znhead状态码: $znhead_status" "1"

    # 处理znhead安装/更新
    log_msg "INFO" "处理znhead安装/更新 (状态码: $znhead_status)"

    case $znhead_status in
        0)
            log_msg "INFO" "znhead已安装且版本最新" "1"
            ;;
        1)
            log_msg "INFO" "znhead需要更新" "1"
            handle_znhead_installation "$device_model" "$znhead_status" || {
                log_msg "ERROR" "znhead更新失败" "1"
                exit 1
            }
            log_msg "INFO" "znhead更新完成" "1"
            ;;
        2|rc)
            log_msg "INFO" "znhead未安装或配置残留" "1"
            handle_znhead_installation "$device_model" "2" || {
                log_msg "ERROR" "znhead安装失败" "1"
                exit 1
            }
            log_msg "INFO" "znhead安装完成" "1"
            ;;
        3)
            log_msg "ERROR" "znhead状态异常，无法继续安装" "1"
            exit 1
            ;;
        *)
            log_msg "ERROR" "未知的znhead状态码: $znhead_status" "1"
            exit 1
            ;;
    esac

    # 获取设备配置并正确处理带空格的配置项
    log_msg "DEBUG" "获取设备配置..." "1"
    local config_str=$(get_device_config "$device_model") || exit 1
    log_msg "DEBUG" "原始配置字符串: $config_str" "1"

    # 使用mapfile正确处理带空格的配置项
    local config=()
    mapfile -t config <<< "$(echo "$config_str" | tr ' ' '\n')"
    log_msg "DEBUG" "解析后的配置数组: ${config[*]}" "1"

    # 解析配置 - 精确匹配指定格式
    local aic_model=""
    local transfer_targets=()
    local service_targets=()
    local parse_error=0

    # 收集所有配置项
    for item in "${config[@]}"; do
        case "$item" in
            aic_model=*)
                aic_model="${item#aic_model=}"
                log_msg "DEBUG" "找到aic_model配置: $aic_model" "1"
                ;;
            transfer_targets=*)
                # 使用eval正确处理带引号的字符串
                eval "targets=(${item#transfer_targets=})"
                log_msg "DEBUG" "找到transfer_targets配置: ${targets[*]}" "1"
                for target in "${targets[@]}"; do
                    if [[ "$target" =~ ^[a-zA-Z0-9]+@[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:/data/$ ]]; then
                        transfer_targets+=("$target")
                        log_msg "DEBUG" "添加transfer_target: $target" "1"
                    else
                        log_msg "WARN" "无效的transfer_target格式: $target (应为'用户名@ip:/data/')"
                        parse_error=1
                    fi
                done
                ;;
            service_targets=*)
                # 使用eval正确处理带引号的字符串
                eval "targets=(${item#service_targets=})"
                log_msg "DEBUG" "找到service_targets配置: ${targets[*]}" "1"
                for target in "${targets[@]}"; do
                    if [[ "$target" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[a-zA-Z0-9]+$ ]] || [[ "$target" == "localhost:"* ]]; then
                        service_targets+=("$target")
                        log_msg "DEBUG" "添加service_target: $target" "1"
                    else
                        log_msg "WARN" "无效的service_target格式: $target (应为'ip:模式'或'localhost:模式')"
                        parse_error=1
                    fi
                done
                ;;
            *)
                # 忽略其他配置项的警告，只记录错误
                if [[ "$item" != znkj@* && "$item" != linaro@* && ! "$item" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]]; then
                    log_msg "WARN" "未知配置项: $item"
                    parse_error=1
                fi
                ;;
        esac
    done

    # 检查必要配置
    if [ $parse_error -ne 0 ]; then
        log_msg "ERROR" "配置解析失败，设备型号可能不受支持"
        echo -e "${RED}配置解析失败，设备型号可能不受支持${NC}"
        echo -e "${YELLOW}按回车键退出...${NC}"
        read
        exit 1
    fi

    # 更新aic模型
    if [[ "${config[@]}" =~ "aic_model=" ]] && [ -n "$aic_model" ]; then
        if ! update_aic_model "$aic_model"; then
            log_msg "ERROR" "aic模型定义更新失败"
            parse_error=1
        fi
    else
        log_msg "INFO" "当前型号无算力芯片，跳过aic模型定义更新"
    fi

    # 执行文件传输
    if [ ${#transfer_targets[@]} -gt 0 ]; then
        log_msg "INFO" "开始文件传输到目标: ${transfer_targets[*]}"
        transfer_files "${transfer_targets[@]}" || {
            log_msg "ERROR" "文件传输失败"
            exit 1
        }
        log_msg "INFO" "文件传输完成"
    else
        log_msg "INFO" "无文件传输目标，跳过传输步骤"
    fi

    # 初始化配置文件（本地和所有远程设备）
    log_msg "INFO" "开始初始化配置文件"

    # 本地配置初始化
    if [ -f "${SCRIPT_DIR}/Set-config.sh" ]; then
        log_msg "INFO" "开始配置文件初始化"
        "${SCRIPT_DIR}/Set-config.sh" || {
            log_msg "ERROR" "配置文件初始化失败"
            exit 1
        }
        log_msg "INFO" "配置文件初始化完成"
    else
        log_msg "ERROR" "未找到Set-config.sh脚本"
        exit 1
    fi

    # 远程设备配置初始化
    # for target in "${service_targets[@]}"; do
    #     local ip=${target%:*}
    #     if [ "$ip" != "localhost" ]; then
    #         log_msg "INFO" "开始在${ip}上执行配置初始化"
    #         remote_exec "$ip" "cd ${SERVICE_DATA_DIR}/install && ./Set-config.sh" || {
    #             log_msg "ERROR" "在${ip}上执行配置初始化失败"
    #             exit 1
    #         }
    #         log_msg "INFO" "在${ip}上配置初始化完成"
    #     fi
    # done

    # 启动服务
    if [ ${#service_targets[@]} -gt 0 ]; then
        log_msg "INFO" "开始启动服务: ${service_targets[*]}"
        start_services "${service_targets[@]}" || {
            log_msg "ERROR" "服务启动失败"
            exit 1
        }
        log_msg "INFO" "服务启动完成"
    else
        log_msg "INFO" "无服务需要启动，跳过启动步骤"
    fi

    log_msg "INFO" "安装流程完成"
    echo -e "${GREEN}安装完成${NC}"
}

# 执行更新操作
perform_update() {
    local update_scope=$1  # full或service
    local service=$2       # 服务名称(可选)

    # 首先处理znhead安装/更新
    local device_model=$(get_device_info | grep "设备型号" | cut -d' ' -f4)
    [ -z "$device_model" ] && exit 1

    log_msg "INFO" "开始处理znhead安装/更新" "1"

    check_software_versions >/dev/null
    znhead_status=$?
    # 获取znhead状态(已在check_software_versions中检查过)
    case $znhead_status in
        0)
            log_msg "INFO" "znhead已安装且版本最新" "1"
            ;;
        1)
            log_msg "INFO" "znhead需要更新" "1"
            handle_znhead_installation "$device_model" "$znhead_status" || {
                log_msg "ERROR" "znhead更新失败" "1"
                exit 1
            }
            log_msg "INFO" "znhead更新完成" "1"
            ;;
        2)
            log_msg "INFO" "znhead未安装" "1"
            handle_znhead_installation "$device_model" "$znhead_status" || {
                log_msg "ERROR" "znhead安装失败" "1"
                exit 1
            }
            log_msg "INFO" "znhead安装完成" "1"
            ;;
        3)
            log_msg "ERROR" "znhead状态异常，无法继续更新" "1"
            exit 1
            ;;
        *)
            log_msg "ERROR" "未知的znhead状态码: $znhead_status" "1"
            exit 1
            ;;
    esac

# 获取设备配置并正确处理带空格的配置项
    log_msg "DEBUG" "获取设备配置..." "1"
    local config_str=$(get_device_config "$device_model") || exit 1
    log_msg "DEBUG" "原始配置字符串: $config_str" "1"

    # 使用mapfile正确处理带空格的配置项
    local config=()
    mapfile -t config <<< "$(echo "$config_str" | tr ' ' '\n')"
    log_msg "DEBUG" "解析后的配置数组: ${config[*]}" "1"

    # 解析配置 - 精确匹配指定格式
    local aic_model=""
    local transfer_targets=()
    local service_targets=()
    local parse_error=0

    # 收集所有配置项
    for item in "${config[@]}"; do
        case "$item" in
            aic_model=*)
                aic_model="${item#aic_model=}"
                log_msg "DEBUG" "找到aic_model配置: $aic_model" "1"
                ;;
            transfer_targets=*)
                # 使用eval正确处理带引号的字符串
                eval "targets=(${item#transfer_targets=})"
                log_msg "DEBUG" "找到transfer_targets配置: ${targets[*]}" "1"
                for target in "${targets[@]}"; do
                    if [[ "$target" =~ ^[a-zA-Z0-9]+@[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:/data/$ ]]; then
                        transfer_targets+=("$target")
                        log_msg "DEBUG" "添加transfer_target: $target" "1"
                    else
                        log_msg "WARN" "无效的transfer_target格式: $target (应为'用户名@ip:/data/')"
                        parse_error=1
                    fi
                done
                ;;
            service_targets=*)
                # 使用eval正确处理带引号的字符串
                eval "targets=(${item#service_targets=})"
                log_msg "DEBUG" "找到service_targets配置: ${targets[*]}" "1"
                for target in "${targets[@]}"; do
                    if [[ "$target" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[a-zA-Z0-9]+$ ]] || [[ "$target" == "localhost:"* ]]; then
                        service_targets+=("$target")
                        log_msg "DEBUG" "添加service_target: $target" "1"
                    else
                        log_msg "WARN" "无效的service_target格式: $target (应为'ip:模式'或'localhost:模式')"
                        parse_error=1
                    fi
                done
                ;;
            *)
                # 忽略其他配置项的警告，只记录错误
                if [[ "$item" != znkj@* && "$item" != linaro@* && ! "$item" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]]; then
                    log_msg "WARN" "未知配置项: $item"
                    parse_error=1
                fi
                ;;
        esac
    done

    # 检查必要配置
    if [ $parse_error -ne 0 ]; then
        log_msg "ERROR" "配置解析失败，设备型号可能不受支持"
        echo -e "${RED}配置解析失败，设备型号可能不受支持${NC}"
        echo -e "${YELLOW}按回车键退出...${NC}"
        read
        exit 1
    fi

    if [ -z "$service_targets" ]; then
        log_msg "ERROR" "无法获取服务目标配置"
        exit 1
    fi

    # 1. 调用Update.sh处理文件更新
    log_msg "INFO" "开始执行文件更新"

    # 在所有目标设备上执行Update.sh
    # for target in "${service_targets[@]}"; do
    #     local ip=${target%:*}
    #     log_msg "INFO" "在${ip}上执行文件更新"

    #     if [ "$ip" == "localhost" ]; then
    #         if [ -f "${SCRIPT_DIR}/Update.sh" ]; then
    #             "${SCRIPT_DIR}/Update.sh" || {
    #                 log_msg "ERROR" "本地文件更新失败"
    #                 exit 1
    #             }
    #         else
    #             log_msg "ERROR" "未找到Update.sh脚本"
    #             exit 1
    #         fi
    #     else
    #         remote_exec "$ip" "cd ${SERVICE_DATA_DIR}/install && ./Update.sh" || {
    #             log_msg "ERROR" "在${ip}上文件更新失败"
    #             #return 1
    #         }
    #     fi

    #     log_msg "INFO" "在${ip}上文件更新完成"
    # done

    # log_msg "INFO" "文件更新完成"

    # 2. 执行服务更新
    case "$update_scope" in
        "full")
            # 全量更新逻辑 - 先卸载再安装
            log_msg "INFO" "开始全量更新流程"
            uninstall || {
                log_msg "ERROR" "卸载失败，终止更新"
                exit 1
            }
            install || {
                log_msg "ERROR" "安装失败，终止更新"
                exit 1
            }
            log_msg "INFO" "全量更新完成"
            ;;
        "service")
            log_msg "INFO" "开始服务级更新流程: $service"

            # 删除指定服务
            log_msg "INFO" "开始删除服务: $service"
            for target in "${service_targets[@]}"; do
                local ip=${target%:*}
                log_msg "INFO" "在${ip}上删除服务: $service"
                if [ "$ip" == "localhost" ]; then
                    "${SERVICE_DATA_DIR}/install/delimg.sh" "$service" || {
                        log_msg "ERROR" "本地删除服务失败: $service"
                        #return 1
                    }
                else
                    remote_exec "$ip" "${SERVICE_DATA_DIR}/install/delimg.sh $service" || {
                        log_msg "ERROR" "在${ip}上删除服务失败: $service"
                        #return 1
                    }
                fi
                log_msg "INFO" "在${ip}上删除服务完成: $service"
            done

            # 启动指定服务
            log_msg "INFO" "开始启动服务: $service"
            start_services "${service_targets[@]}" || {
                log_msg "ERROR" "服务启动失败: $service"
                #return 1
            }
            log_msg "INFO" "服务启动完成: $service"

            log_msg "INFO" "服务级更新完成: $service"
            ;;
    esac
}

# 更新版本号(支持服务级和全局更新)
update_version() {
    local new_version=$1
    local service=$2  # 可选参数，指定服务名称

    [ -z "$new_version" ] && {
        log_msg "ERROR" "无效的版本号参数"
        exit 1
    }

    log_msg "INFO" "开始更新版本号为: $new_version (服务: ${service:-全局})"

    # 获取设备配置
    local device_model=$(get_device_info | grep "设备型号" | cut -d' ' -f4) || exit 1
    local config=($(get_device_config "$device_model")) || exit 1

    # 解析service_targets配置
    local service_targets=()
    for item in "${config[@]}"; do
        [[ "$item" == service_targets=* ]] && {
            service_targets=(${item#service_targets=})
            break
        }
    done

    [ -z "$service_targets" ] && {
        log_msg "ERROR" "无法获取服务目标配置"
        exit 1
    }

    # 统一的更新命令
    local update_cmd
    if [ -z "$service" ]; then
        update_cmd="sed -i \"s/\\(.*TAG=\\).*-latest/\\1${new_version}-latest/g\" ${SERVICE_DATA_DIR}/install/.env"
    else
        update_cmd="sed -i \"s/\\(${service}TAG=\\).*-latest/\\1${new_version}-latest/g\" ${SERVICE_DATA_DIR}/install/.env"
    fi

    # 在所有目标设备上执行更新
    for target in "${service_targets[@]}"; do
        local ip=${target%:*}
        log_msg "INFO" "在${ip}上更新版本号: $new_version (服务: ${service:-全局})"

        if [ "$ip" == "localhost" ]; then
            eval "$update_cmd" || {
                log_msg "ERROR" "本地版本号更新失败"
                exit 1
            }
        else
            remote_exec "$ip" "$update_cmd" || {
                log_msg "ERROR" "在${ip}上版本号更新失败"
                exit 1
            }
        fi
    done

    log_msg "INFO" "版本号更新完成: $new_version (服务: ${service:-全局})"
}

# 版本选择菜单
version_menu() {
    local update_scope=$1  # full或service
    local service=${2:-""}

    while true; do
        clear
        echo -e "${YELLOW}请选择${update_scope}更新方式:${NC}"
        echo -e "1. 更新当前版本到最新"
        echo -e "2. 切换到指定版本并更新到最新"
        echo -e "0. 返回"
        print_divider
        read -p "请输入选项(1-2,0): " choice

        case $choice in
            1)
                perform_update "$update_scope" "$service"
                return
                ;;
            2)
                read -p "请输入版本号(如1.3.2): " ver
                update_version "$ver" "$service"
                perform_update "$update_scope" "$service"
                return
                ;;
            0)
                return 1
                ;;
            *)
                echo -e "${RED}无效输入，请重试${NC}"
                sleep 1
                ;;
        esac
    done
}

# 服务选择菜单
service_menu() {
    local services=("iccs" "iccs-dist" "anm" "anm-dist" "aic")
    local names=("iccs服务" "iccs前端" "ANM服务" "ANM前端" "AIC服务")

    while true; do
        clear
        echo -e "${YELLOW}请选择要更新的服务:${NC}"
        for i in "${!services[@]}"; do
            echo -e "$(($i+1)). ${names[$i]}"
        done
        echo -e "0. 返回"
        print_divider
        read -p "请输入选项(1-${#services[@]},0): " choice

        [[ "$choice" == "0" ]] && return 1

        if [[ "$choice" =~ ^[1-${#services[@]}]$ ]]; then
            version_menu "service" "${services[$((choice-1))]}"
            return
        else
            echo -e "${RED}无效选择，请重试${NC}"
            sleep 1
        fi
    done
}

# 主更新菜单
update() {
    while true; do
        clear
        print_divider
        echo -e "${YELLOW}1. 整机全量更新${NC}"
        echo -e "${YELLOW}2. 指定服务更新${NC}"
        echo -e "${YELLOW}0. 返回主菜单${NC}"
        print_divider
        read -p "请选择更新类型(1-2,0): " choice

        case $choice in
            1)
                version_menu "full"
                ;;
            2)
                service_menu
                ;;
            0)
                return
                ;;
            *)
                echo -e "${RED}无效选项，请重试${NC}"
                sleep 1
                ;;
        esac
    done
}

# 备份功能
backup() {
    log_msg "INFO" "开始备份流程"
    echo -e "${GREEN}正在准备备份...${NC}"

    # 创建备份目录
    local backup_time=$(date "+%Y%m%d%H%M%S")
    local backup_dir="${BACKUP_DIR}/full-${backup_time}"
    local sql_dir="${backup_dir}/sql"
    local images_dir="${backup_dir}/images"

    mkdir -p "$sql_dir" "$images_dir" || {
        log_msg "ERROR" "无法创建备份目录"
        echo -e "${RED}无法创建备份目录${NC}"
        exit 1
    }

    # 1. 备份servicedata
    log_msg "INFO" "备份servicedata目录"
    echo -e "${BLUE}正在备份servicedata目录...${NC}"
    cp -r "$SERVICE_DATA_DIR" "$backup_dir" || {
        log_msg "ERROR" "servicedata备份失败"
        echo -e "${RED}servicedata备份失败${NC}"
        exit 1
    }

    # 2. 备份mysql数据库
    log_msg "INFO" "备份mysql数据库"
    echo -e "${BLUE}正在备份mysql数据库...${NC}"
    docker exec -i mysql sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "show databases"' | \
    grep -Ev "Database|information_schema|performance_schema|mysql" | \
    while read dbname; do
        docker exec -i mysql sh -c "mysqldump -uroot -p\$MYSQL_ROOT_PASSWORD $dbname" > "${sql_dir}/${dbname}.sql" || {
            log_msg "ERROR" "数据库${dbname}备份失败"
            echo -e "${RED}数据库${dbname}备份失败${NC}"
        }
    done

    # 3. 备份docker镜像
    log_msg "INFO" "备份docker镜像"
    echo -e "${BLUE}正在备份docker镜像...${NC}"
    docker images --format "{{.Repository}}:{{.Tag}}" | grep -v "<none>" | \
    while read image; do
        local imagename=$(echo "$image" | awk -F'/' '{print $NF}' | sed 's/:/_/')
        docker save "$image" | gzip > "${images_dir}/${imagename}.tar.gz" || {
            log_msg "ERROR" "镜像${image}备份失败"
            echo -e "${RED}镜像${image}备份失败${NC}"
        }
    done

    # 4. 打包备份
    log_msg "INFO" "打包备份文件"
    echo -e "${BLUE}正在打包备份文件...${NC}"
    tar -czf "${backup_dir}.tar.gz" -C "$BACKUP_DIR" "full-${backup_time}" && {
        rm -rf "$backup_dir"
        log_msg "INFO" "备份完成，保存到${backup_dir}.tar.gz"
        echo -e "${GREEN}备份完成，保存到${backup_dir}.tar.gz${NC}"
    } || {
        log_msg "ERROR" "备份打包失败"
        echo -e "${RED}备份打包失败${NC}"
        exit 1
    }
}

# 卸载功能
uninstall() {
    if ! confirm_action "卸载"; then
        return 1
    fi
    log_msg "INFO" "开始卸载流程"

    # 获取设备型号
    local device_model=$(get_device_info | grep "设备型号" | cut -d' ' -f4)
    [ -z "$device_model" ] && exit 1

# 获取设备配置并正确处理带空格的配置项
    log_msg "DEBUG" "获取设备配置..." "1"
    local config_str=$(get_device_config "$device_model") || exit 1
    log_msg "DEBUG" "原始配置字符串: $config_str" "1"

    # 使用mapfile正确处理带空格的配置项
    local config=()
    mapfile -t config <<< "$(echo "$config_str" | tr ' ' '\n')"
    log_msg "DEBUG" "解析后的配置数组: ${config[*]}" "1"

    # 解析配置 - 精确匹配指定格式
    local aic_model=""
    local transfer_targets=()
    local service_targets=()
    local parse_error=0

    # 收集所有配置项
    for item in "${config[@]}"; do
        case "$item" in
            aic_model=*)
                aic_model="${item#aic_model=}"
                log_msg "DEBUG" "找到aic_model配置: $aic_model" "1"
                ;;
            transfer_targets=*)
                # 使用eval正确处理带引号的字符串
                eval "targets=(${item#transfer_targets=})"
                log_msg "DEBUG" "找到transfer_targets配置: ${targets[*]}" "1"
                for target in "${targets[@]}"; do
                    if [[ "$target" =~ ^[a-zA-Z0-9]+@[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:/data/$ ]]; then
                        transfer_targets+=("$target")
                        log_msg "DEBUG" "添加transfer_target: $target" "1"
                    else
                        log_msg "WARN" "无效的transfer_target格式: $target (应为'用户名@ip:/data/')"
                        parse_error=1
                    fi
                done
                ;;
            service_targets=*)
                # 使用eval正确处理带引号的字符串
                eval "targets=(${item#service_targets=})"
                log_msg "DEBUG" "找到service_targets配置: ${targets[*]}" "1"
                for target in "${targets[@]}"; do
                    if [[ "$target" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[a-zA-Z0-9]+$ ]] || [[ "$target" == "localhost:"* ]]; then
                        service_targets+=("$target")
                        log_msg "DEBUG" "添加service_target: $target" "1"
                    else
                        log_msg "WARN" "无效的service_target格式: $target (应为'ip:模式'或'localhost:模式')"
                        parse_error=1
                    fi
                done
                ;;
            *)
                # 忽略其他配置项的警告，只记录错误
                if [[ "$item" != znkj@* && "$item" != linaro@* && ! "$item" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]]; then
                    log_msg "WARN" "未知配置项: $item"
                    parse_error=1
                fi
                ;;
        esac
    done

    # 检查必要配置
    if [ $parse_error -ne 0 ]; then
        log_msg "ERROR" "配置解析失败，设备型号可能不受支持"
        echo -e "${RED}配置解析失败，设备型号可能不受支持${NC}"
        echo -e "${YELLOW}按回车键退出...${NC}"
        read
        exit 1
    fi

    # 检查必要配置
    if [ -z "$service_targets" ]; then
        log_msg "ERROR" "无法获取服务目标配置"
        echo -e "${RED}无法获取服务目标配置${NC}"
        exit 1
    fi

    # 在所有设备上执行删除命令
    log_msg "INFO" "开始在所有设备上删除服务"
    for target in "${service_targets[@]}"; do
        local ip=${target%:*}
        log_msg "INFO" "在${ip}上执行删除命令"
        if [ "$ip" == "localhost" ]; then
            "${SERVICE_DATA_DIR}/install/delimg.sh" a || {
                log_msg "ERROR" "本地删除服务失败"
                #return 1
            }
        else
            remote_exec "$ip" "${SERVICE_DATA_DIR}/install/delimg.sh a" || {
                log_msg "ERROR" "在${ip}上删除服务失败"
                #return 1
            }
        fi
        log_msg "INFO" "在${ip}上删除服务完成"
    done

    log_msg "INFO" "卸载流程完成"
    echo -e "${GREEN}卸载完成${NC}"
}

# 显示菜单
show_menu() {
    echo -e "${YELLOW}1. 安装${NC}"
    echo -e "${YELLOW}2. 更新${NC}"
    echo -e "${YELLOW}3. 备份${NC}"
    echo -e "${YELLOW}4. 卸载${NC}"
}

# 主逻辑
if [ $# -eq 0 ]; then
    # 无参数模式 - 交互式菜单
    while true; do
        clear
        TERM=linux toilet -f standard -F metal ZhongNan
        print_divider
        get_device_info
        print_divider
        show_menu
        print_divider
        read -p "请输入选项编号(1-4)或q退出: " choice

        case $choice in
            "1"|"安装"|"install")
                install
                break
                ;;
            "2"|"更新"|"update")
                update
                break
                ;;
            "3"|"备份"|"backup")
                backup
                break
                ;;
            "4"|"卸载"|"uninstall")
                uninstall
                break
                ;;
            "q"|"Q"|"quit"|"退出"|"exit")
                echo -e "${YELLOW}退出菜单${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}无效选项，请重新输入${NC}"
                sleep 1
                continue
                ;;
        esac

        #read -p "按Enter键返回菜单..."
    done
else
    # 带参数模式
    case $1 in
        "安装"|"1"|"install")
            install
            break
            ;;
        "更新"|"2"|"update")
            update
            break
            ;;
        "备份"|"3"|"backup")
            backup
            break
            ;;
        "卸载"|"4"|"uninstall")
            uninstall
            break
            ;;
        *)
            echo -e "${RED}无效参数${NC}"
            exit 1
            ;;
    esac
fi
