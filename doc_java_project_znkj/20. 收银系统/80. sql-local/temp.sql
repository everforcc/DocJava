select * from mt_balance e
order by e.ID desc;
select * from mt_goods ;
-- WEIGHT             decimal(10, 2)          default 0.00      null comment '����',
select * from mt_stock_item e
where e.;

select e.role_ids,e.* from t_account e;
select * from t_account_duty e
where e.acct_id = 14;

select * from t_duty_source e
where e.source_id = 125;

select * from t_source e
where e.source_name like '%����%' ;

update t_source e set e.status = 'A'
where e.parent_id = 125;
update t_source e set e.source_name = '����̨'
where e.source_id = 125;

select * from t_duty e;

select e.* from t_account e;


select distinct t.source_id from t_duty_source t left join t_account_duty d
                                                           on t.duty_id = d.duty_id
where d.acct_id = 14;


-- ����
select e.PAY_AMOUNT,e.AMOUNT,e.CREATE_TIME,e.PAY_TYPE,e.USER_ID,e.* from mt_order e
order by e.CREATE_TIME desc;

-- ��������Ϣ
SELECT * FROM mt_balance e
order by e.CREATE_TIME desc;

-- ��Ա���
select e.BALANCE,e.* from mt_user e
where e.ID = 69;
