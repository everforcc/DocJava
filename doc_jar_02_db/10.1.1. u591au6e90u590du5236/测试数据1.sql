-- test_sync
select count(*) from test_sync
where id > 2000 order by id asc ;

select * from test_sync;

delete from test_sync;

-- 存储过程也会同步

DROP PROCEDURE IF EXISTS InsertTestData1;

DELIMITER $$
CREATE PROCEDURE InsertTestData1()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
            INSERT INTO test_sync(id,name) VALUES (i+100000,CONCAT('s1循环', i));
            SET i = i + 1;
        END WHILE;
END$$
DELIMITER ;

-- 执行存储过程
CALL InsertTestData1();