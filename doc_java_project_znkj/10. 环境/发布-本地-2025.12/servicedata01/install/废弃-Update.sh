#!/bin/bash

# 全局变量定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 路径配置
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
SERVICE_DATA_DIR="/data/servicedata"
BACKUP_DIR="/data/backup"
DOWNLOAD_URL="http://download.zgzhongnan.com/s/RXDKwh"

# 日志函数
log_msg() {
    local level=$1
    local message=$2
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    case $level in
        "INFO") echo -e "${BLUE}[${timestamp}] INFO: ${message}${NC}" ;;
        "WARN") echo -e "${YELLOW}[${timestamp}] WARN: ${message}${NC}" ;;
        "ERROR") echo -e "${RED}[${timestamp}] ERROR: ${message}${NC}" ;;
        *) echo -e "[${timestamp}] ${level}: ${message}" ;;
    esac
}

# 智能目录合并函数
smart_merge_dirs() {
    local src_dir="$1"
    local dest_dir="$2"
    local backup_dir="$3"
    local work_dir=$(mktemp -d)

    log_msg "INFO" "开始智能目录合并: $src_dir -> $dest_dir"
    log_msg "INFO" "工作目录: $work_dir"

    # 1. 创建备份
    sudo rsync -a --checksum "$dest_dir" "$backup_dir" || {
        log_msg "ERROR" "创建备份失败"
        rm -rf "$work_dir"
        return 1
    }

    # 2. 处理不同类型文件
    while IFS= read -r -d '' file; do
        local rel_path="${file#$src_dir/}"
        local dest_file="$dest_dir/$rel_path"
        local file_type=$(file -b --mime-type "$file" | cut -d/ -f1)

        # 确保目标目录存在
        sudo mkdir -p "$(dirname "$dest_file")" || {
            log_msg "ERROR" "创建目录失败: $(dirname "$dest_file")"
            continue
        }

    # 处理新文件
    if [ ! -e "$dest_file" ]; then
        sudo rsync -a --checksum "$file" "$dest_file" && \
        log_msg "INFO" "新增文件: $rel_path"
        continue
    fi

    # 配置文件差异合并 - 只处理特定目录和文件
    if [[ "$rel_path" =~ ^(config/|db/|nvr/).*\.(yml|yaml|conf|cfg|ini|env|properties)$ ]] ||
       [[ "$rel_path" == "install/.env" ]]; then
        merge_config_file "$file" "$dest_file" "$backup_dir/$rel_path" "$rel_path"
    # JSON文件特殊处理
    elif [[ "$file" =~ \.json$ ]] && command -v jq &>/dev/null; then
        merge_json_file "$file" "$dest_file" "$rel_path"
    # 其他文件直接覆盖
    else
        sudo rsync -a --checksum "$file" "$dest_file" && \
        log_msg "INFO" "更新文件: $rel_path"
    fi
    done < <(find "$src_dir" -type f -print0)

    rm -rf "$work_dir"
    log_msg "INFO" "目录合并完成"
    return 0
}

# 配置文件合并
merge_config_file() {
    local src_file="$1"
    local dest_file="$2"
    local backup_file="$3"
    local rel_path="$4"

    # 比较文件内容是否相同
    if cmp -s "$src_file" "$dest_file"; then
        log_msg "INFO" "配置文件无差异: $rel_path"
        return 0
    fi

    log_msg "INFO" "合并配置文件: $rel_path"

    # 解析备份文件中的用户修改
    declare -A user_config
    while IFS='=' read -r key value; do
        [[ -n "$key" ]] && user_config["$key"]="$value"
    done < <(grep -E '^[^#]*=' "$backup_file")

    # 生成合并后的文件
    local temp_file=$(mktemp)
    while IFS= read -r line; do
        if [[ "$line" =~ ^([^#=[:space:]]+)[[:space:]]*=[[:space:]]*(.*)$ ]]; then
            local key="${BASH_REMATCH[1]}"
            if [[ -n "${user_config[$key]}" ]]; then
                echo "$key=${user_config[$key]}"
            else
                echo "$line"
            fi
        else
            echo "$line"
        fi
    done < "$src_file" > "$temp_file"

    # 替换原文件
    sudo mv "$temp_file" "$dest_file" || {
        log_msg "ERROR" "替换配置文件失败: $rel_path"
        return 1
    }
}

# JSON文件合并 (需要jq)
merge_json_file() {
    local src_file="$1"
    local dest_file="$2"
    local rel_path="$3"

    if ! cmp -s "$src_file" "$dest_file"; then
        log_msg "INFO" "合并JSON文件: $rel_path"
        local temp_file=$(mktemp)
        jq -s '.[0] * .[1]' "$dest_file" "$src_file" > "$temp_file" && \
        sudo mv "$temp_file" "$dest_file" || {
            log_msg "WARN" "JSON合并失败，保留原文件: $rel_path"
            sudo rsync -a --checksum "$src_file" "$dest_file"
        }
    else
        log_msg "INFO" "JSON文件无差异: $rel_path"
    fi
}

# 更新操作
update_files() {
    log_msg "INFO" "开始文件更新"

    # 创建临时目录
    local temp_dir
    temp_dir=$(mktemp -d) || {
        log_msg "ERROR" "无法创建临时目录"
        return 1
    }

    # 下载更新包
    if ! wget -qO - "$DOWNLOAD_URL" | tar -xzf - -C "$temp_dir"; then
        log_msg "ERROR" "下载或解压更新包失败"
        rm -rf "$temp_dir"
        return 1
    fi

    # 创建备份目录
    local backup_dir="${BACKUP_DIR}/update_backup_$(date +%Y%m%d%H%M%S)"
    mkdir -p "$backup_dir" || {
        log_msg "ERROR" "无法创建备份目录"
        rm -rf "$temp_dir"
        return 1
    }

    # 执行智能合并
    log_msg "INFO" "开始合并配置文件: config/, db/, nvr/ 和 install/.env"
    if ! smart_merge_dirs "${temp_dir}" "$SERVICE_DATA_DIR" "$backup_dir"; then
        log_msg "ERROR" "文件合并失败"
        rm -rf "$temp_dir"
        return 1
    fi

    # 删除源目录并用临时目录替代
    log_msg "INFO" "开始替换源目录"
    if ! sudo rm -rf "$SERVICE_DATA_DIR" || ! sudo mv "${temp_dir}" "$SERVICE_DATA_DIR"; then
        log_msg "ERROR" "替换源目录失败"
        rm -rf "$temp_dir"
        return 1
    fi

    log_msg "INFO" "文件更新完成，源目录已替换"
    return 0
}

# 主执行逻辑
if [ "$(basename "$0")" == "Update.sh" ]; then
    update_files
fi
