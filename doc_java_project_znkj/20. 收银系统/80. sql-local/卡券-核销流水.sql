-- ��ȯ������ˮ������ʱ�䵹������
select e.CREATE_TIME, e.USER_COUPON_ID, e.ORDER_ID as '����ID', e.*
from mt_confirm_log e
order by e.CREATE_TIME desc;

-- ͳ�ƺ�������
select count(e.ORDER_ID), e.ORDER_ID from mt_confirm_log e
group by e.ORDER_ID;

-- ��ѯ����Ķ���
select e.PAY_STATUS, e.COUPON_ID, e.*
from mt_order e
where e.ID = 180;
