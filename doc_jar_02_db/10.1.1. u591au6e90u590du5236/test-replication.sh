#!/bin/bash

# u6d4bu8bd5u6bcfu4e2au4e3bu5e93u7684u5199u5165u64cdu4f5c

# u68c0u67e5u590du5236u72b6u6001
echo "Checking replication status before test..."
for MASTER in master1 master2 master3; do
  echo "Status for channel $MASTER:"
  docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL '$MASTER'\G" | grep "Slave_.*_Running"
done

# u4e3bu5e93u4e00u5199u5165u6570u636e
echo "Inserting data from master1..."
docker exec mysql-master1 mysql -uroot -proot -e "INSERT INTO db_test_sync.test_sync (name) VALUES ('master1-test-data');"

# u4e3bu5e93u4e8cu5199u5165u6570u636e
echo "Inserting data from master2..."
docker exec mysql-master2 mysql -uroot -proot -e "INSERT INTO db_test_sync.test_sync (name) VALUES ('master2-test-data');"

# u4e3bu5e93u4e09u5199u5165u6570u636e
echo "Inserting data from master3..."
docker exec mysql-master3 mysql -uroot -proot -e "INSERT INTO db_test_sync.test_sync (name) VALUES ('master3-test-data');"

# u7b49u5f85u590du5236u5b8cu6210
echo "Waiting for replication to complete..."
sleep 10

# u67e5u770bu6240u6709u4e3bu5e93u7684u6570u636e
for MASTER in master1 master2 master3; do
  echo "Data in $MASTER:"
  docker exec mysql-$MASTER mysql -uroot -proot -e "SELECT * FROM db_test_sync.test_sync;"
done

# u67e5u770bu4eceu5e93u7684u6570u636e
echo "Data in slave after replication:"
docker exec mysql-slave mysql -uroot -proot -e "SELECT * FROM db_test_sync.test_sync;"

# u68c0u67e5u590du5236u72b6u6001
echo "Replication status after test:"
for MASTER in master1 master2 master3; do
  echo "Status for channel $MASTER:"
  docker exec mysql-slave mysql -uroot -proot -e "SHOW REPLICA STATUS FOR CHANNEL '$MASTER'\G" | grep "Slave_.*_Running"
done 