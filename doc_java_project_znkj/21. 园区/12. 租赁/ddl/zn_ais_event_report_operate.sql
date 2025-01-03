-- del
-- ���˲������


-- ͬ����
select * from zn_ais_event_report e ;
-- show create table zn_ais_event_report;
-- ������
# select * from zn_ais_event_report_operate;
# drop table zn_ais_event_report_operate;
--
insert into zn_ais_event_report_operate(id, zn_device_sn_var, group_name, report_type, report_content_json, report_camera_json, report_algorithm_json, report_algorithm_camera_json, report_user_json, statistics_interval, statistics_time_json, remark, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag, up_flag, up_count, up_msg, up_id)
select id, zn_device_sn_var, group_name, report_type, report_content_json, report_camera_json, report_algorithm_json, report_algorithm_camera_json, report_user_json, statistics_interval, statistics_time_json, remark, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag, up_flag, up_count, up_msg, up_id from zn_ais_event_report;


-- auto-generated definition
CREATE TABLE `zn_ais_event_report_operate`
(
    `id`                           bigint(20) NOT NULL COMMENT '�������',
    `zn_device_sn_var`             varchar(255) DEFAULT NULL COMMENT '�豸���',
    `group_name`                   varchar(255) DEFAULT NULL COMMENT '�澯������',
    `report_type`                  tinyint(1)   DEFAULT NULL COMMENT '�ϱ����ͣ�0�¼��澯��1ͳ���ϱ���',
    `report_content_json`          json         DEFAULT NULL COMMENT '�ϱ�����json��',
    `report_camera_json`           json         DEFAULT NULL COMMENT '�ϱ�ѡ������json��',
    `report_algorithm_json`        json         DEFAULT NULL COMMENT '�ϱ�ѡ����㷨json��',
    `report_algorithm_camera_json` varchar(255) DEFAULT NULL COMMENT '�ϱ�ѡ����㷨�����json��[{"algorithmId":"123123","cameraId":[123,111]}]',
    `report_user_json`             json         DEFAULT NULL COMMENT '�ϱ���Աjson��[{"userId":1,"userName":"����Ա"}]',
    `statistics_interval`          int(11)      DEFAULT NULL COMMENT 'ͳ���ϱ������x�����ϱ�һ�Σ�',
    `statistics_time_json`         json         DEFAULT NULL COMMENT 'ͳ���ϱ�ʱ��',
    `remark`                       varchar(255) DEFAULT NULL COMMENT '��ע',
    `create_id`                    bigint(20)   DEFAULT NULL COMMENT '������ID',
    `create_by`                    varchar(64)  DEFAULT '' COMMENT '������',
    `create_time`                  datetime     DEFAULT NULL COMMENT '����ʱ��',
    `create_dept`                  bigint(20)   DEFAULT NULL COMMENT '��������',
    `update_id`                    bigint(20)   DEFAULT NULL COMMENT '������ID',
    `update_by`                    varchar(64)  DEFAULT '' COMMENT '������',
    `update_time`                  datetime     DEFAULT NULL COMMENT '����ʱ��',
    `del_flag`                     tinyint(1)   DEFAULT '0' COMMENT 'ɾ����־��0������� 1����ɾ����',
    `up_flag`                      int(11)      DEFAULT '0' COMMENT '0 δ�ϴ� 1 �ϴ��� 2 ���ϴ�',
    `up_count`                     int(11)      DEFAULT '0' COMMENT '�ϴ�����',
    `up_msg`                       varchar(255) DEFAULT NULL COMMENT '�ϴ���Ϣ',
    `up_id`                        varchar(200) DEFAULT NULL COMMENT '�ϴ�ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
    comment '�¼���Ϣ�ϱ������������';


