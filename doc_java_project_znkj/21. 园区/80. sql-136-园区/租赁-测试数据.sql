
-- ���ò�������Ϊ�ɲ�ѯ
update zn_ais_event_data_details_operate
set status = 0,
    create_time=now()
where id in (1,2,3,4,5,6,7,8,9,10,11,12,13);

select * from zn_event_process_staff e
where e.user_phone in
      ('11111111111', '11111111112', '11111111113',
                       '11111111114', '11111111115');

-- ��������
-- dealer_id
-- 123456789 �ɵ�
-- ��Ա
    -- 11111111111
    -- 11111111112
    -- 11111111113
-- 987654321 ����
-- ��Ա
    -- 11111111114
    -- 11111111115
