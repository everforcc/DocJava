#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 加载.env配置文件
load_env_config() {
    local env_file="${SCRIPT_DIR}/.env"
    if [ -f "$env_file" ]; then
        # 读取并导出.env文件中的变量（彻底过滤注释和无效行）
        export $(sed '/^#/d;/^$/d;s/#.*//' "$env_file" | grep -E '^[^=]+=' | xargs --)
        log_msg "INFO" "已加载.env配置文件"
    else
        log_msg "WARN" ".env配置文件不存在，将使用默认值或命令行参数"
    fi
}

# 路径配置
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
CONFIG_DIR="${SCRIPT_DIR}/../config"
NVR_DIR="${SCRIPT_DIR}/../nvr"
LOG_DIR="${SCRIPT_DIR}/logs"
MAX_LOG_FILES=3  # 默认保留的日志文件数量
LOG_FILE="${LOG_DIR}/set-config-$(date "+%Y-%m-%d_%H:%M:%S").log"

# 日志函数
log_msg() {
    local level=$1
    local message=$2
    local timestamp
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

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

    echo "[${timestamp}][${level}] ${message}" >> "$LOG_FILE"
}

# 检查并创建日志目录
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR" || {
        echo -e "${RED}无法创建日志目录 ${LOG_DIR}${NC}"
        exit 1
    }
    chmod 755 "$LOG_DIR"
else
    # 清理旧日志文件，保留最新的MAX_LOG_FILES个
    log_files_count=$(ls -1t "$LOG_DIR"/set-config-*.log 2>/dev/null | wc -l)
    if [ "$log_files_count" -gt "$MAX_LOG_FILES" ]; then
        ls -1t "$LOG_DIR"/set-config-*.log | tail -n +$(($MAX_LOG_FILES + 1)) | xargs rm -f --
        log_msg "INFO" "已清理旧日志文件，保留最新的${MAX_LOG_FILES}个日志"
    fi
fi

# 获取设备IP地址
get_device_ips() {
    local ips=()
    local interfaces=()
    mapfile -t interfaces < <(ip -o link show | awk -F': ' '{print $2}')

    for intf in "${interfaces[@]}"; do
        # 排除回环接口和docker0接口
        if [ "$intf" != "lo" ] && [ "$intf" != "docker0" ]; then
            ip_addr=$(ip -o -4 addr show "$intf" | awk '{print $4}' | cut -d'/' -f1)
            if [ -n "$ip_addr" ]; then
                ips+=("$ip_addr")
            fi
        fi
    done

    echo "${ips[@]}"
}

# 修改iccs.yml配置文件
modify_iccs_config() {
    local cloud_ip=$1
    local iccs_file="${CONFIG_DIR}/iccs.yml"

    if [ -z "$cloud_ip" ]; then
        # 尝试从.env文件读取cloudURL
        if [ -n "$cloudURL" ]; then
            cloud_ip="$cloudURL"
            log_msg "INFO" "从.env文件读取到iccs云端服务器地址: ${cloud_ip}"
        else
            log_msg "ERROR" "未指定iccs云端服务器地址且.env文件中未配置cloudURL"
            return 1
        fi
    fi

    if [ ! -f "$iccs_file" ]; then
        log_msg "ERROR" "配置文件 ${iccs_file} 不存在"
        return 1
    fi

    # 备份原文件
    cp "$iccs_file" "${iccs_file}.bak"

    # 替换IP地址
    sed -i \
        -e "s|cloudMqtts: tcp://[^:]*:|cloudMqtts: tcp://${cloud_ip}:|" \
        -e "s|cloudaddr: [^/]*/|cloudaddr: ${cloud_ip}/|" \
        -e "s|cloudMqtt: tcp://[^:]*:|cloudMqtt: tcp://${cloud_ip}:|" \
        "$iccs_file"

    log_msg "INFO" "已设置 iccs 云端服务器地址为 ${cloud_ip}"
    echo -e "${GREEN}已成功更新iccs配置${NC}"
}

# 修改anm.yml配置文件
modify_anm_config() {
    local device_model=$1
    local has_nvr=$2
    local need_auth=$3
    local anm_file="${CONFIG_DIR}/anm.yml"

    if [ ! -f "$anm_file" ]; then
        log_msg "ERROR" "配置文件 ${anm_file} 不存在"
        return 1
    fi

    # 备份原文件
    cp "$anm_file" "${anm_file}.bak"

    # 设置isMain值
    local is_main="false"
    case $device_model in
        2c2s|3c|5c) is_main="true" ;;
    esac

    # 设置initCamera值
    if [ -z "$has_nvr" ]; then
        if [ -n "$initCamera" ]; then
            has_nvr="$initCamera"
            log_msg "INFO" "从.env文件读取到NVR配置: ${has_nvr}"
        else
            has_nvr="true" # 默认值
            log_msg "WARN" "未指定NVR配置且.env文件中未配置initCamera，使用默认值: ${has_nvr}"
        fi
    fi

    # 设置Authorization值
    if [ -z "$need_auth" ]; then
        if [ -n "$anmAuth" ]; then
            need_auth="$anmAuth"
            log_msg "INFO" "从.env文件读取到ANM授权配置: ${need_auth}"
        else
            need_auth="false" # 默认值
            log_msg "WARN" "未指定ANM授权配置且.env文件中未配置anmAuth，使用默认值: ${need_auth}"
        fi
    fi

    # 更新配置文件
    sed -i \
        -e "s|isMain: .*|isMain: ${is_main}|" \
        -e "s|initCamera: .*|initCamera: ${has_nvr}|" \
        -e "s|Authorization: .*|Authorization: ${need_auth}|" \
        "$anm_file"

    log_msg "INFO" "已更新 ANM 配置: 是否多核心=${is_main}, 是否有NVR=${has_nvr}, 是否需要授权=${need_auth}"
    echo -e "${GREEN}已成功更新ANM配置${NC}"
}

# 修改aic.env配置文件
modify_aic_config() {
    local aic_file="${CONFIG_DIR}/aic.env"
    local ips=()
    mapfile -t ips < <(get_device_ips)

    if [ ! -f "$aic_file" ]; then
        log_msg "ERROR" "配置文件 ${aic_file} 不存在"
        return 1
    fi

    # 备份原文件
    cp "$aic_file" "${aic_file}.bak"

    # 确定IP地址
    local target_ip="127.0.0.1"
    local aic_num="1"

    for ip in "${ips[@]}"; do
        if [[ $ip =~ ^192\.168\.110\. ]]; then
            target_ip="192.168.110.1"
            aic_num=$(echo "$ip" | cut -d'.' -f4)
            break
        elif [[ $ip =~ ^192\.168\.120\. ]]; then
            target_ip="192.168.120.1"
            aic_num=$(( $(echo "$ip" | cut -d'.' -f4) + 4 ))
            break
        fi
    done

    # 更新配置文件
    sed -i \
        -e "s|DATABASE_URI=\"mysql+pymysql://root:znkj123456@[^/]*/|DATABASE_URI=\"mysql+pymysql://root:znkj123456@${target_ip}/|" \
        -e "s|MYSQL_FACE_HOST=\"[^\"]*\"|MYSQL_FACE_HOST=\"${target_ip}\"|" \
        -e "s|REDIS_HOST=\"[^\"]*\"|REDIS_HOST=\"${target_ip}\"|" \
        -e "s|MQTT_SERVER_IP=\"[^\"]*\"|MQTT_SERVER_IP=\"${target_ip}\"|" \
        -e "s|MQTT_CLIENT_ID=\"znaic-mqtt-[0-9]*\"|MQTT_CLIENT_ID=\"znaic-mqtt-${aic_num}\"|" \
        -e "s|/zn_aic[0-9]*?|/zn_aic${aic_num}?|" \
        "$aic_file"

    log_msg "INFO" "已更新 AIC 配置: 数据库地址 ${target_ip}, AIC编号 ${aic_num}"
    echo -e "${GREEN}已成功更新AIC配置${NC}"
}

# 修改nvr配置文件
modify_nvr_config() {
    local nvr_file=$1
    local ips=()
    mapfile -t ips < <(get_device_ips)

    if [ ! -f "$nvr_file" ]; then
        log_msg "ERROR" "配置文件 ${nvr_file} 不存在"
        return 1
    fi

    # 备份原文件
    cp "$nvr_file" "${nvr_file}.bak"

    # 确定IP地址和编号
    local target_ip="192.168.100.1"
    local nvr_num="1"

    for ip in "${ips[@]}"; do
        if [[ $ip =~ ^192\.168\.100\. ]]; then
            target_ip="$ip"
            nvr_num=$(echo "$ip" | cut -d'.' -f4)
            break
        fi
    done

    # 更新配置文件
    sed -i \
        -e "s|url=root:znkj123456@([^/]*)/|url=root:znkj123456@(${target_ip}:3306)/|" \
        -e "s|mqtt_server_ip=[^$]*|mqtt_server_ip=${target_ip}|" \
        -e "s|mqtt_client_id=nvr_mqtt_[^$]*|mqtt_client_id=nvr_mqtt_${target_ip}|" \
        -e "s|/znkjnvr[0-9]*?|/znkjnvr${nvr_num}?|" \
        "$nvr_file"

    local config_name
    config_name=$(basename "$nvr_file" | cut -d'.' -f1)
    log_msg "INFO" "已更新 nvr-${config_name} 配置: 数据库地址 ${target_ip}, NVR编号 ${nvr_num}"
    echo -e "${GREEN}已成功更新nvr-${config_name}配置${NC}"
}

# 修改nginx-iccs.conf配置文件
modify_nginx_conf() {
    local cloud_ip=$1
    local iccs_conf_file="${SCRIPT_DIR}/../nginx/iccs/conf.d/iccs.conf"

    if [ -z "$cloud_ip" ]; then
        # 尝试从.env文件读取cloudURL
        if [ -n "$cloudURL" ]; then
            cloud_ip="$cloudURL"
            log_msg "INFO" "从.env文件读取到cloudURL地址: ${cloud_ip}"
        else
            log_msg "ERROR" "未指定cloudURL地址且.env文件中未配置cloudURL"
            return 1
        fi
    fi

    if [ ! -f "$iccs_conf_file" ]; then
        log_msg "ERROR" "配置文件 ${iccs_conf_file} 不存在"
        return 1
    fi

    # 备份原文件
    cp "$iccs_conf_file" "${iccs_conf_file}.bak"

    # 更新配置文件
    sed -i -E \
        -e "s|(upstream ai-server \{[\s]*server )[^:]*:[0-9]*;|\1${cloud_ip}:9400;|" \
        -e "s|(upstream sys-server \{[\s]*server )[^:]*:[0-9]*;|\1${cloud_ip}:80;|" \
        "$iccs_conf_file"

    log_msg "INFO" "已设置 ai-server 地址为 ${cloud_ip}:9400"
    log_msg "INFO" "已设置 sys-server 地址为 ${cloud_ip}:80"
    echo -e "${GREEN}已成功更新nginx-iccs.conf配置${NC}"
}

# 主函数
main() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${YELLOW}开始配置文件中...${NC}"

    # 加载.env配置文件
    load_env_config

    # 解析参数
    local cloud_ip=""
    local has_nvr=""
    local need_auth=""

    while [[ $# -gt 0 ]]; do
        case $1 in
            --cloud-ip)
                cloud_ip=$2
                shift 2
                ;;
            --has-nvr)
                has_nvr=$2
                shift 2
                ;;
            --need-auth)
                need_auth=$2
                shift 2
                ;;
            *)
                shift
                ;;
        esac
    done

    # 获取设备型号
    local device_model=""
    if [ -f "/proc/device-tree/model" ]; then
        device_model=$(tr -d '\0' < /proc/device-tree/model)
    elif [ -f "/proc/cpuinfo" ]; then
        device_model=$(awk -F': ' '/model name/{print $2; exit}' /proc/cpuinfo)
    else
        log_msg "ERROR" "无法获取设备型号，退出"
        exit 1
    fi

    # 执行各配置文件的修改
    modify_iccs_config "$cloud_ip"
    modify_anm_config "$device_model" "$has_nvr" "$need_auth"
    modify_aic_config
    modify_nginx_conf "$cloud_ip"

    # 处理NVR配置文件
    for nvr_config in "${NVR_DIR}/rk.ini" "${NVR_DIR}/a1.ini" "${NVR_DIR}/a2.ini"; do
        if [ -f "$nvr_config" ]; then
            modify_nvr_config "$nvr_config"
        else
            log_msg "WARN" "NVR配置文件 ${nvr_config} 不存在，跳过"
        fi
    done

    echo -e "${BLUE}========================================${NC}"
    echo -e "${GREEN}配置文件修改完成${NC}"
    echo -e "详细日志请查看: ${LOG_FILE}"
}

main "$@"
