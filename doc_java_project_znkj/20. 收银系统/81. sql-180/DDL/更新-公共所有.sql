-- ��Ա
select e.STATUS,e.* from mt_user e
where e.STORE_ID = 0;
update mt_user set STATUS = 'D' WHERE STORE_ID = 0;

-- ��Ʒ
select e.STATUS,e.STORE_ID,e.* from mt_goods e
where e.STORE_ID = 0;
update mt_goods set STATUS = 'D' WHERE STORE_ID = 0;


-- �������
select e.STATUS,e.* from mt_stock e
where e.STORE_ID = 0;
update mt_stock set STATUS = 'D' WHERE STORE_ID = 0;
