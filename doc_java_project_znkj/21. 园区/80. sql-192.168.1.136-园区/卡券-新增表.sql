
-- ����
SELECT e.del_flag,e.status,e.* FROM zn_cashier_adver e;
-- �Ż�ȯ��
SELECT e.del_flag,e.status,e.* FROM zn_cashier_card e ORDER BY e.id DESC;
-- �Ż�ȯ�͵��̹�����
SELECT e.* FROM zn_cashier_card_store e ORDER BY e.id DESC;

-- ͬ����
-- �û���
SELECT * FROM mt_user ;
SELECT * FROM mt_store ;
SELECT * FROM mt_user_coupon ;
SELECT * FROM mt_coupon ;
SELECT * FROM mt_confirm_log ;
