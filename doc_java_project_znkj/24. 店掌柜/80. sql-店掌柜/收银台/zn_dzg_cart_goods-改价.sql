
-- ������Ʒ����ļ�
-- ���ﳵ�����ĸ���Ʒ
-- 111111111 111111112 233456789
-- ���� 1 1 2
-- �۸� 3 3 5
-- �ֿۺ� 3 3 5 = 11
-- �ļ� 10 Ԫ 3����Ʒ

-- ���ս���۸�Ϊ
-- 3����Ʒ 10Ԫ

SELECT *
FROM zn_dzg_product e
WHERE e.name like '%����%';

-- ��Ա��
select * from zn_dzg_card_member e ;
-- ��Ա����Ʒ
select * from zn_dzg_card_member_product e ;


-- ���ﳵ
select * from zn_dzg_cart_goods e
where e.cart_id = 1897214504005689346;




