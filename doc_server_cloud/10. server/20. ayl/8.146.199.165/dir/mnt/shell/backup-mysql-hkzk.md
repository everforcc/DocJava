- backup-mysql-hkzk.sh

~~~shell
#!/bin/bash

BACKUP_DIR="/mnt/hkzk/mysql/backup"

# ����Ϊ���µ�Ŀ¼
# Ŀ¼ ��/��
YEAR=$(date +%Y)
MONTH=$(date +%m)
# �ļ���
DATE=$(date +%Y-%m-%d_%H:%M:%S)
# �����Ӽ�Ŀ¼
mkdir -p ${BACKUP_DIR}/${YEAR}/${MONTH}
FILE="${BACKUP_DIR}/${YEAR}/${MONTH}/${DATE}.sql"
FILELOG="${BACKUP_DIR}/${YEAR}/${MONTH}/${DATE}.log"

echo "Backup start     at $(date)" >> $FILELOG
docker exec mysql-8.0  /bin/bash -c 'mysqldump -h 121.89.198.243 -P 3306 -u devmaster -pdevmaster2024 --databases crccdev crccconfigdev' > $FILE
echo "Backup completed at $(date)" >> $FILELOG
~~~