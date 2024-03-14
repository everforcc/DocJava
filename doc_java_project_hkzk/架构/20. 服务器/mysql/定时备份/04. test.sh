BACKUP_DIR="/tmp"
YEAR=$(date +%Y)
MONTH=$(date +%m)
DATE=$(date +%Y-%m-%d_%H:%M:%S)
mkdir -p ${YEAR}/${MONTH}
FILE="${BACKUP_DIR}/${YEAR}/${MONTH}/${DATE}.sql"
echo "Backup completed at $(date)" >> $FILE