-- �������Ӹ��ƽű�

-- 1. ��ѯ����״̬
show master status;

-- 2. �ӿ����ýű�
CHANGE MASTER TO MASTER_HOST='10.250.250.21', MASTER_PORT=3310,
MASTER_USER='hkzkdevrep', MASTER_PASSWORD='hkzkdevrep',
MASTER_LOG_FILE='mysql-bin.000003', MASTER_LOG_POS=154;

-- 3. ��������ͬ��
START SLAVE;
-- ֹͣ
stop slave;
-- ����
reset slave;

-- 4. �鿴�ӿ�״̬
show slave status\G;

-- 5. ��master�ڵ㿴 �û��������е��߳�
show processlist\G;