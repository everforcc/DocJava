#!/bin/bash

docker-compose up -d ruoyi-mysql
sleep 5s
docker-compose up -d ruoyi-redis
sleep 5s
docker-compose up -d ruoyi-nacos
sleep 5s
docker-compose up -d ruoyi-gateway
docker-compose up -d ruoyi-auth
docker-compose up -d
