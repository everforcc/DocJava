-- del
-- ���˲������


select * from zn_event_data e ;
show create table zn_event_data;

-- ����Ǩ��
# drop table zn_event_data_operate;
# select * from zn_event_data_operate e ;
insert into zn_event_data_operate (id, zn_device_sn_var, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_num, model_type, event_address, event_info, image_path, videl_path, core_id, status, deal_back_type, process_id, process_name, process_time, process_price, process_voice, process_text, mistake_flag, transparent, deal_user_ids, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id)
select id, zn_device_sn_var, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_num, model_type, event_address, event_info, image_path, videl_path, core_id, status, deal_back_type, process_id, process_name, process_time, process_price, process_voice, process_text, mistake_flag, transparent, deal_user_ids, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id from zn_event_data;


-- �����ű�
CREATE TABLE `zn_event_data_operate`
(
    `id`               bigint(20)   NOT NULL COMMENT '����',
    `zn_device_sn_var` varchar(255) NOT NULL COMMENT '�豸���',
    `algorithm_id`     bigint(20)   DEFAULT NULL COMMENT '�㷨���',
    `algorithm_name`   varchar(255) DEFAULT NULL COMMENT '�㷨����',
    `camera_id`        bigint(20)   DEFAULT NULL COMMENT '������',
    `event_begin_end`  tinyint(1)   DEFAULT NULL COMMENT '�¼���ʼ������ʶ��1��ʼ��2������',
    `position_x`       varchar(32)  DEFAULT NULL COMMENT '����λ��X����',
    `position_y`       varchar(32)  DEFAULT NULL COMMENT '����λ��Y����',
    `position_w`       varchar(32)  DEFAULT NULL COMMENT 'Ŀ�����ؿ�',
    `position_h`       varchar(32)  DEFAULT NULL COMMENT 'Ŀ�����ظ�',
    `probability`      varchar(64)  DEFAULT NULL COMMENT '����',
    `object_num`       int(11)      DEFAULT NULL COMMENT 'Ŀ������',
    `model_type`       tinyint(1)   DEFAULT NULL COMMENT 'ģ������',
    `event_address`    varchar(200) DEFAULT NULL COMMENT '�¼��ص�',
    `event_info`       text COMMENT '�¼�����',
    `image_path`       text COMMENT 'ͼƬ�ļ���ַ',
    `videl_path`       varchar(500) DEFAULT NULL COMMENT '��Ƶ�ļ���ַ',
    `core_id`          bigint(20)   DEFAULT NULL COMMENT '���ı��',
    `status`           tinyint(1)   DEFAULT NULL COMMENT '�¼�״̬��0�����á�1�����С�2�Ѵ��ã�',
    `deal_back_type`   char(1)      DEFAULT '0' COMMENT '���û�ִ��ʽ��0���֡�1ͼƬ��2����',
    `process_id`       bigint(20)   DEFAULT NULL COMMENT '�����˱��',
    `process_name`     varchar(64)  DEFAULT NULL COMMENT '����������',
    `process_time`     datetime     DEFAULT NULL COMMENT '����ʱ��',
    `process_price`    varchar(255) DEFAULT NULL COMMENT '����ͼƬ',
    `process_voice`    text COMMENT '��������',
    `process_text`     varchar(255) DEFAULT NULL COMMENT '����',
    `mistake_flag`     tinyint(1)   DEFAULT NULL COMMENT '�󱨱�ǣ�0��ȷ�¼���1���¼���',
    `transparent`      text COMMENT '͸���ֶ�',
    `deal_user_ids`    text COMMENT '�ɴ�����ID�����ŷָ���',
    `create_time`      datetime     DEFAULT NULL COMMENT '���ʱ��',
    `del_flag`         tinyint(1)   DEFAULT NULL COMMENT 'ɾ�����',
    `create_id`        bigint(20)   DEFAULT NULL COMMENT '������id',
    `create_by`        varchar(32)  DEFAULT NULL COMMENT '������',
    `create_dept`      bigint(20)   DEFAULT NULL COMMENT '��������',
    `update_id`        bigint(20)   DEFAULT NULL COMMENT '������id',
    `update_by`        varchar(32)  DEFAULT NULL COMMENT '������',
    `update_time`      datetime     DEFAULT NULL COMMENT '����ʱ��',
    `remark`           varchar(500) DEFAULT NULL COMMENT '��ע',
    `up_flag`          int(11)      DEFAULT NULL COMMENT '0δ�ϴ���1�ϴ��С�2���ϴ�',
    `up_count`         int(11)      DEFAULT NULL COMMENT '�ϴ�����',
    `up_msg`           varchar(255) DEFAULT NULL COMMENT '�ϴ���Ϣ',
    `up_id`            varchar(255) DEFAULT NULL COMMENT '�ϴ�ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='�澯�¼���';