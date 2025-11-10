#!/bin/bash
# 记录删除操作到日志文件
echo "$(date): Cleaning ruoyi20 directories" | sudo tee -a /var/log/ruoyi_clean.log > /dev/null
sudo find /home -type d -name "ruoyi20*" -exec rm -rf {} + 2>/dev/null
echo "$(date): Cleanup completed" | sudo tee -a /var/log/ruoyi_clean.log > /dev/null