-- VARCHAR(20) 修改为 100
ALTER TABLE t_account MODIFY account_name   varchar(100)  default '' not null comment '账户名称';