-- 创建表
CREATE TABLE `t_t1` (
  `a` bigint NOT NULL AUTO_INCREMENT,
  `b` bigint DEFAULT NULL,
  `c` bigint DEFAULT NULL,
  `d` bigint DEFAULT NULL,
  `e` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='测试mysql innodb'

-- t1
select * from t_t1;

-- 创建联合索引
CREATE INDEX idx_t1_bcd ON t_t1(b,c,d);、
CREATE INDEX idx_t1_e ON t_t1(e);
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND c=1 AND d=1;
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND d=1;

-- 使用联合索引
select * from t_t1 where b=1 and c=1 and d=1;

-- 使用到索引
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND c=1 AND d=1;
-- Using index condition 索引下推
EXPLAIN SELECT * FROM t_t1 WHERE b=1 AND d=1;

-- 数据转换
-- 将字符都转为0
SELECT 'a' = 0;
SELECT 'b' = 1;
SELECT 'b' = 0;
-- 但是假如字符是数字的话，就转为相应的数字
SELECT '123' = 123;
-- 其实查的就是 a=0
SELECT * FROM t_t1 WHERE a = 'c';
