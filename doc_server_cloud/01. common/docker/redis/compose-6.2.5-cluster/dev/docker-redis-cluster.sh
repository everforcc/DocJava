# 构件容器
docker-compose -f docker-redis-cluster.yml up -d --build
# 构件集群
docker exec -it redis5201 redis-cli -p 5201 -a ccdev --cluster create 10.250.250.21:5201 10.250.250.21:5202 10.250.250.21:5203 10.250.250.21:5204 10.250.250.21:5205 10.250.250.21:5206 --cluster-replicas 1
