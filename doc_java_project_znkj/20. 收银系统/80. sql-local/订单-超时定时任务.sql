
-- ��֧������
SELECT e.STATUS,e.REMARK, e.CREATE_TIME, e.COUPON_ID, e.*
FROM mt_order e
where e.STATUS = 'A';
-- update mt_order e set e.STATUS = 'I' where e.STATUS = 'A';
-- ���Զ�ʱ���� 180
SELECT e.STATUS,e.COUPON_ID,e.REMARK, e.CREATE_TIME, e.COUPON_ID, e.*
FROM mt_order e
where e.ID = 180;

-- ������¼
select e.COUPON_ID,e.STATUS,e.* from mt_confirm_log e
where e.ORDER_ID = 180;
-- ��ȯ��
select e.STATUS,e.* from mt_coupon_goods e
where e.COUPON_ID = 6;

-- ��ѯ�����ŵĿ�ȯ
select * from mt_coupon e ;
SELECT t.COUPON_ID,t.STATUS,t.* FROM mt_user_coupon t
where t.COUPON_ID = 6;
-- ��ѯ�����ݵ��û��Ľű�
SELECT t.COUPON_ID,t.STATUS,t.* FROM mt_user_coupon t
WHERE t.id = 166;
      (t.COUPON_ID = '' AND t.STATUS = 'A');
-- or
--
select e.STATUS,e.COUPON_ID,e.USER_ID,e.* from mt_order e
where
        e.COUPON_ID != ''
      e.STATUS = 'A'
and      e.COUPON_ID != '';

 and     e.STATUS = 'A';

--
SELECT e.STATUS,e.* FROM MT_ORDER E
where e.ID = 172;

select e.ORDER_ID,e.STATUS,e.* from mt_confirm_log e
where e.ORDER_ID = 172;
