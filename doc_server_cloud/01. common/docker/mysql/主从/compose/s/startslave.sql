-- �������Ӹ��ƽű�

-- 1. ��ѯ����״̬
show master status;

-- 2. �ӿ����ýű�
CHANGE MASTER TO MASTER_HOST='ip', MASTER_PORT=3310,
MASTER_USER='username', MASTER_PASSWORD='password',
MASTER_LOG_FILE='bin-log.000003', MASTER_LOG_POS=157;

-- 3. ��������ͬ��
START SLAVE;
-- ֹͣ
stop slave;
-- ����
reset slave;

-- 4. �鿴�ӿ�״̬
show slave status;
