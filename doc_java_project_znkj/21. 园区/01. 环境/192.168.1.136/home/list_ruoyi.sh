#!/bin/bash

# 这个脚本用于列出将要被清理的ruoyi目录，而不实际删除它们
# 用于验证清理脚本的正确性

echo "即将列出所有以ruoyi20开头的目录:"
echo "=========================================="

# 查找并列出所有以ruoyi20开头的目录
find /home/smartparkcloud-docker -type d -name "ruoyi20*" | while read dir; do
    echo "待删除目录: $dir"
done

echo "=========================================="
echo "以上是所有将被清理的目录列表"