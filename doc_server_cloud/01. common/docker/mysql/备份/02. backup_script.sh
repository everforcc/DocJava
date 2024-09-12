# 导出的完整脚本，交给定时任务执行
#!/bin/bash
# 备份脚本
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
FILELOG="${BACKUP_DIR}/${YEAR}/${MONTH}/${DATE}.log"

echo "Backup start at $(date)" >> $FILELOG
# linux
mysqldump -h $DB_HOST -P $DB_PORT -u $DB_USERNAME -p$DB_PASSWORD --databases ${DATABASES[@]} > $FILE
# docker
# docker exec mysql-8.0  /bin/bash -c 'mysqldump -h localhost -P 3306 -u root -pccdevback --databases oneforall' > $FILE
# company
# docker exec mysql-8.0  /bin/bash -c 'mysqldump -h 121.89.198.243 -P 3306 -u devmaster -pdevmaster2024 --databases crccdev crccconfigdev' > $FILE
# everforcc
# docker exec mysql-8.0  /bin/bash -c 'mysqldump -h localhost -P 3306 -u root -pc.c.5664 --databases hkzkcrcc nacosconfig oneforall rycloud' > $FILE
echo "Backup completed at $(date)" >> $FILELOG