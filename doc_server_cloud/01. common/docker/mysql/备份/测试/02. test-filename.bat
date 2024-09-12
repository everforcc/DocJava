DATE=$(date +%Y-%m-%d_%H:%M:%S)
FILE="${BACKUP_DIR}/${DATE}.sql"

echo "Backup completed at $(date)" >> $FILE