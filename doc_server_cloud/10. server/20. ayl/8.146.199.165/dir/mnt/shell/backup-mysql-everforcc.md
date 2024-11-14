- backup-mysql-everforcc.sh

~~~shell
#!/bin/bash

BACKUP_DIR="/mnt/everforcc/mysql/backup"

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
docker exec mysql-8.0  /bin/bash -c 'mysqldump -h localhost -P 3306 -u root -pc.c.5664 --databases hkzkcrcc nacosconfig oneforall rycloud' > $FILE
echo "Backup completed at $(date)" >> $FILELOG
~~~