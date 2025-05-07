# MySQL 多源复制 + 冲突规避 模板

## ? 项目说明

该模板实现：
- 一个主库接收两个从库的写入（反向多源复制）
- 使用 GTID + 自增偏移避免冲突
- 支持多个从库同时写入相同表

## ?? 技术栈

- MySQL 8.0
- Docker Compose
- GTID 复制
- 自增 ID 分配策略：offset=1/2，increment=2

## ? 快速开始

### 1. 安装依赖

确保你已安装：

- [Docker](https://www.docker.com/)
- [Docker Compose v1.x 或 v2.x](https://docs.docker.com/compose/install/)

### 2. 启动服务

