-- 1. ��Ա
-- show create table mt_user;
select * from mt_user;

-- 2. �޸�������������
ALTER TABLE `mt_user` MODIFY `ID` bigint NOT NULL COMMENT '��ԱID';

-- 3. �����ֶ�
ALTER TABLE `mt_user` ADD `up_flag` int DEFAULT '0' COMMENT '0 δ�ϴ� 1 �ϴ��� 2 ���ϴ�';
ALTER TABLE `mt_user` ADD `up_count` int DEFAULT '0' COMMENT '�ϴ�����';
ALTER TABLE `mt_user` ADD `up_msg` varchar(255) DEFAULT NULL COMMENT '�ϴ���Ϣ';
ALTER TABLE `mt_user` ADD `up_id` varchar(255) DEFAULT NULL COMMENT '�ϴ�ID';
ALTER TABLE `mt_user` ADD `zn_device_sn_var` varchar(255) DEFAULT NULL COMMENT '�豸���';
ALTER TABLE `mt_user` ADD `remark` varchar(100) DEFAULT NULL COMMENT '��ע';
ALTER TABLE `mt_user` ADD `del_flag` tinyint DEFAULT '0' COMMENT 'ɾ����ʶ';
ALTER TABLE `mt_user` ADD `create_id` BIGINT(20) DEFAULT NULL COMMENT '������ID';
ALTER TABLE `mt_user` ADD  `create_by` VARCHAR(50) DEFAULT NULL COMMENT '������';
ALTER TABLE `mt_user` ADD  `update_id` BIGINT(20) DEFAULT NULL COMMENT '������ID';
ALTER TABLE `mt_user` ADD  `update_by` VARCHAR(50) DEFAULT NULL COMMENT '������';
ALTER TABLE `mt_user` ADD  `create_dept` BIGINT(20) DEFAULT NULL COMMENT '�����߲���';