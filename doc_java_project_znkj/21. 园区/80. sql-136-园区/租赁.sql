
-- 1. ������еľ�����
select su.* from sys_user su
left join sys_user_role sur on su.user_id= sur.user_id
where sur.role_id = 3;
-- ��ɫ
select * from sys_user_role sur
where sur.role_id = 3;
select * from sys_role;

-- �����̱�
select su.user_id,su.* from sys_user su ;
select su.nick_name,zdl.dealer_id,zdl.* from zn_device_lease zdl
left join sys_user su on zdl.dealer_id = su.user_id;

-- 2. ���������µ�����sn
-- ����δ����
-- group_id
select e.group_id,e.zn_device_sn_var,e.dealer_id,e.contact_person '��ϵ��',e.phone '�ֻ���',e.* from zn_device_lease e;
select e.* from zn_device_lease e;
-- �Ѽ���
-- select e.* from zn_device_sn e;
-- select * from sys_user e ;

-- 3. �¼�������Ա��
-- ʹ��sn�����
-- ,zeps.group_id
select zeps.* from zn_event_process_staff zeps ;

select zeps.* from zn_event_process_staff zeps
order by rand();

-- �Ƴ��豸sn
select zepsg.* from zn_event_process_staff_group zepsg ;
-- select * from zn_device_lease;

-- 4. �¼���
select zaedd.* from zn_ais_event_data_details_operate zaedd
where zaedd.process_id = 1;

update zn_ais_event_data_details_operate
set status = 0,
    create_time=now()
where id in (1,2,3,4,5,6,7,8,9,10,11,12,13);

-- zn_ais_event_data_details_operate
--
-- select zed.algorithm_id,zed.* from zn_event_data zed;
-- copy ��
-- select zedo.algorithm_id,zedo.* from zn_event_data_operate zedo;

-- �豸�������
-- select zdl.dealer_id,zdl.* from zn_device_lease zdl ;
-- select zdlr.* from zn_device_lease_record zdlr ;

select * from zn_event_process_rule e ;
select 60*24 from dual;

-- ��������
-- dealer_id
-- 123456789 �ɵ�
-- ��Ա
-- 987654321 ����
-- ��Ա

-- zn_ais_camera
select e.* from zn_machine_camera e
where e.id in (1869664776612081666);
