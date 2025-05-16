
echo "Replication status after test:"
for MASTER in master1 master2 master3; do
  echo "Status for channel $MASTER:"
  docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL '$MASTER'\G" | grep "Replica_.*_Running"
done


docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL 'master1'\G" | grep "Replica_.*_Running";
docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL 'master2'\G" | grep "Replica_.*_Running";
docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL 'master3'\G" | grep "Replica_.*_Running";

docker stop mysql-slave mysql-master1 mysql-master2 mysql-master3
docker rm -f mysql-slave mysql-master1 mysql-master2 mysql-master3
