-- test_sync
select count(*) from test_sync;
delete from test_sync;

select * from test_sync;

DROP PROCEDURE IF EXISTS InsertTestData2;

DELIMITER $$
CREATE PROCEDURE InsertTestData2()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
            INSERT INTO test_sync(id,name) VALUES (i+200000,CONCAT('s2循环', i));
            SET i = i + 1;
        END WHILE;
END$$
DELIMITER ;

-- 执行存储过程
CALL InsertTestData2();