
-- ��Ա��Ϣ
select * from mt_user t where t.STATUS != 'D' AND t.GROUP_ID IN ( 1 );

-- ��¼�˺Ź����Ļ�Աid
-- admin�û� 16
select e.staff_id,e.* from t_account e
where e.acct_id = 2;
select e.staff_id,e.* from t_account e
where e.staff_id = 16;

-- 52
select e.USER_ID,e.* from mt_staff e
where e.ID = 16;

-- ������ϵ
-- t_account.staff_id = mt_staff.id
-- mt_staff.USER_ID = mt_user.id
-- mt_cart.USER_ID = mt_user.id

-- �˺� shouyin
-- �Ƿ�Ա��
select e.IS_STAFF,e.ID,e.* from mt_user e
where e.ID = 57;
select e.id,e.* from mt_staff e
where e.USER_ID = 57;
select * from t_account e
where e.staff_id = 21;
select * from mt_cart e
where e.USER_ID = 57;
-- order by e.CREATE_TIME desc

select e.USER_ID,e.* from mt_cart e;

-- ������� goodIds�������
-- ����� userid�����л�������û���������л�������Ա
-- ������������л���������ѯ
select * from mt_user e where e.ID = 56;

select e.MERCHANT_ID, e.* from mt_user e
where e.MERCHANT_ID = 1;