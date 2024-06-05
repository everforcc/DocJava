-- ������
CREATE TABLE `t_t1` (
  `a` bigint NOT NULL AUTO_INCREMENT,
  `b` bigint DEFAULT NULL,
  `c` bigint DEFAULT NULL,
  `d` bigint DEFAULT NULL,
  `e` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='����mysql innodb'

-- t1
select * from t_t1;

-- ������������
CREATE INDEX idx_t1_bcd ON t_t1(b,c,d);��
CREATE INDEX idx_t1_e ON t_t1(e);
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND c=1 AND d=1;
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND d=1;

-- ʹ����������
select * from t_t1 where b=1 and c=1 and d=1;

-- ʹ�õ�����
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND c=1 AND d=1;
-- Using index condition ��������
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND d=1;

-- ����ת��
-- ���ַ���תΪ0
SELECT 'a' = 0;
SELECT 'b' = 1;
SELECT 'b' = 0;
-- ���Ǽ����ַ������ֵĻ�����תΪ��Ӧ������
SELECT '123' = 123;
-- ��ʵ��ľ��� a=0
SELECT * FROM t_t1 WHERE a = 'c';
