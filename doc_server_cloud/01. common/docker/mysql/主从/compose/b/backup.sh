#!/bin/bash

BACKUP_DIR="/mnt/cc/mysql/backup"

# 调整为按月的目录
# 目录 年/月
YEAR=$(date +%Y)
MONTH=$(date +%m)
# 文件名
DATE=$(date +%Y-%m-%d_%H:%M:%S)
# 创建子级目录
mkdir -p ${BACKUP_DIR}/${YEAR}/${MONTH}
FILE="${BACKUP_DIR}/${YEAR}/${MONTH}/${DATE}.sql"
FILELOG="${BACKUP_DIR}/${YEAR}/${MONTH}/${DATE}.log"

echo "Backup start     at $(date)" >> $FILELOG
docker exec mysql57back  /bin/bash -c 'mysqldump -h localhost -P 3306 -u root -pccdevback --databases oneforall' > $FILE
echo "Backup completed at $(date)" >> $FILELOG