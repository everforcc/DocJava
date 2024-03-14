#!/bin/bash

# MySQL连接信息
DB_HOST="localhost"
DB_PORT=3306
DB_USERNAME="your_username"
DB_PASSWORD="your_password"
DATABASES=(database1 database2)  # 指定要备份的数据库列表

BACKUP_DIR="/path/to/mysql-backup"  # 备份文件存放路径,需要通过 -v 映射到容器外部

# 调整为按月的目录
# 目录 年/月
YEAR=$(date +%Y)
MONTH=$(date +%m)
# 文件名
DATE=$(date +%Y-%m-%d_%H:%M:%S)
# 创建子级目录
mkdir -p BACKUP_DIR/${YEAR}/${MONTH}
FILE="${BACKUP_DIR}/${YEAR}/${MONTH}/${DATE}.sql"

mysqldump -h $DB_HOST -P $DB_PORT -u $DB_USERNAME -p$DB_PASSWORD --databases ${DATABASES[@]} > $FILE
echo "Backup completed at $(date)" >> $FILE