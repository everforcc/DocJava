# ���ݽű�����

# ��ѯ�û�û�е���Ȩ��
mysqldump -h localhost -P 3306 -u cceverfor -p5664c.c. --databases oneforall > /tmp/2024-03-14_22_26_00.sql
# ʹ��root�û������߶�ӦȨ�޵��û������߽������û����õ������ļ���
mysqldump -h localhost -P 3306 -u root -pc.c.5664 --databases oneforall > /tmp/2024-03-15_11_38_00.sql

# docker �ڲ�û��װ��ʱ���񣬶�ʱ���� ���������ܱ�������
# ������������д�� backup.sh �ű���
docker exec mysql-8.0  /bin/bash -c 'mysqldump -h localhost -P 3306 -u root -pc.c.5664 --databases oneforall' > /mnt/test_`date +%Y%m%d_%H_%M_%S`.sql