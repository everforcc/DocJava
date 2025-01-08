show create table zn_ais_event_data_details;
-- zn_ais_event_data_details_operate
select * from zn_ais_event_data_details_operate;

insert into zn_ais_event_data_details_operate(id, zn_device_sn_var, aim_event_data_detail_id, device_id, event_date_id, algorithm_config_id, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_id, object_num, model_type, event_address, event_info, image_path, video_path, core_id, status, process_id, process_name, process_time, process_picture, process_text, mistake_flag, transparent, event_status, event_obj, track_list, event_type, type_id, sub_objects, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id, picture_feature_image_path, target_object_list, detection_region)
select id, zn_device_sn_var, aim_event_data_detail_id, device_id, event_date_id, algorithm_config_id, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_id, object_num, model_type, event_address, event_info, image_path, video_path, core_id, status, process_id, process_name, process_time, process_picture, process_text, mistake_flag, transparent, event_status, event_obj, track_list, event_type, type_id, sub_objects, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id, picture_feature_image_path, target_object_list, detection_region from zn_ais_event_data_details;

CREATE TABLE `zn_ais_event_data_details_operate`
(
    `id`                         bigint(20) NOT NULL COMMENT '����',
    `zn_device_sn_var`           varchar(255)  DEFAULT NULL COMMENT '�豸���',
    `aim_event_data_detail_id`   bigint(20)    DEFAULT NULL COMMENT 'aim�¼�������',
    `device_id`                  bigint(20)    DEFAULT NULL COMMENT '�豸���',
    `event_date_id`              bigint(20)    DEFAULT NULL COMMENT '�澯�¼����',
    `algorithm_config_id`        bigint(20)    DEFAULT NULL COMMENT '�㷨���ñ��',
    `algorithm_id`               bigint(20)    DEFAULT NULL COMMENT '�㷨���',
    `algorithm_name`             varchar(255)  DEFAULT NULL COMMENT '�㷨����',
    `camera_id`                  bigint(20)    DEFAULT NULL COMMENT '������',
    `event_begin_end`            tinyint(1)    DEFAULT '1' COMMENT '�¼���ʼ������ʶ��1��ʼ��2������',
    `position_x`                 varchar(32)   DEFAULT NULL COMMENT '����λ��X����',
    `position_y`                 varchar(32)   DEFAULT NULL COMMENT '����λ��Y����',
    `position_w`                 varchar(32)   DEFAULT NULL COMMENT 'Ŀ�����ؿ�',
    `position_h`                 varchar(32)   DEFAULT NULL COMMENT 'Ŀ�����ظ�',
    `probability`                varchar(64)   DEFAULT NULL COMMENT '����',
    `object_id`                  varchar(64)   DEFAULT NULL COMMENT 'Ŀ��id',
    `object_num`                 int(11)       DEFAULT NULL COMMENT 'Ŀ������',
    `model_type`                 tinyint(1)    DEFAULT NULL COMMENT 'ģ������',
    `event_address`              varchar(255)  DEFAULT NULL COMMENT '�¼��ص�',
    `event_info`                 text COMMENT '�¼�����',
    `image_path`                 varchar(500)  DEFAULT NULL COMMENT 'ͼƬ�ļ���ַ',
    `video_path`                 varchar(500)  DEFAULT NULL COMMENT '��Ƶ�ļ���ַ',
    `core_id`                    bigint(20)    DEFAULT NULL COMMENT '���ı��',
    `status`                     tinyint(1)    DEFAULT NULL COMMENT '�¼�״̬��0�����á�1�����С�2�Ѵ��á�3�Ѻ��ԣ�',
    `process_id`                 bigint(20)    DEFAULT NULL COMMENT '�����˱��',
    `process_name`               varchar(64)   DEFAULT NULL COMMENT '����������',
    `process_time`               datetime      DEFAULT NULL COMMENT '����ʱ��',
    `process_picture`            varchar(255)  DEFAULT NULL COMMENT '����ͼƬ',
    `process_text`               varchar(255)  DEFAULT NULL COMMENT '����',
    `mistake_flag`               tinyint(1)    DEFAULT '0' COMMENT '�󱨱�ǣ�0��ȷ�¼���1���¼���',
    `transparent`                text COMMENT '͸���ֶ�',
    `event_status`               tinyint(1)    DEFAULT NULL COMMENT '�¼����� -1 ������ 0 ��   2 ״̬�������ʱ�䱨��ͻȻ������ 5 ��ֵ���� 6 ��ֵ�������� 7 ��ֵ�������� 8 ��Ŀ�걨�� 9 Ŀ��������� 10 Ŀ����ʧ����  11 Ŀ��λ�Ʊ���',
    `event_obj`                  json          DEFAULT NULL COMMENT '�¼���������',
    `track_list`                 json          DEFAULT NULL COMMENT 'Ŀ��ģʽ�µĸ��ٿ�',
    `event_type`                 tinyint(1)    DEFAULT NULL COMMENT '�¼����� ��1Ŀ��ʶ���࣬2��������ࣩ',
    `type_id`                    tinyint(1)    DEFAULT NULL COMMENT 'Ŀ������ {0:���Ŀ��,1:��ͷ,2:��β,3:����,4:���ֳ�,5:���ֳ�,7:����,8:����,99:����} ',
    `sub_objects`                json          DEFAULT NULL COMMENT '������Ŀ��',
    `create_time`                datetime      DEFAULT NULL COMMENT '���ʱ��',
    `del_flag`                   tinyint(1)    DEFAULT '0' COMMENT 'ɾ����־��0������� 2����ɾ����',
    `create_id`                  bigint(20)    DEFAULT NULL COMMENT '������id',
    `create_by`                  varchar(32)   DEFAULT NULL COMMENT '������',
    `create_dept`                bigint(20)    DEFAULT NULL COMMENT '��������',
    `update_id`                  bigint(20)    DEFAULT NULL COMMENT '������id',
    `update_by`                  varchar(32)   DEFAULT NULL COMMENT '������',
    `update_time`                datetime      DEFAULT NULL COMMENT '����ʱ��',
    `remark`                     varchar(500)  DEFAULT NULL COMMENT '��ע',
    `up_flag`                    int(11)       DEFAULT '0' COMMENT '0 δ�ϴ� 1 �ϴ��� 2 ���ϴ�',
    `up_count`                   int(11)       DEFAULT '0' COMMENT '�ϴ�����',
    `up_msg`                     varchar(255)  DEFAULT NULL COMMENT '�ϴ���Ϣ',
    `up_id`                      varchar(255)  DEFAULT NULL COMMENT '�ϴ�ID',
    `picture_feature_image_path` varchar(500)  DEFAULT NULL COMMENT '������ͼƬ',
    `target_object_list`         json          DEFAULT NULL COMMENT 'Ŀ�꼯��',
    `detection_region`           varchar(2000) DEFAULT NULL COMMENT '�������',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `event_begin_end` (`event_begin_end`),
    KEY `algorithm_camera_cetime` (`algorithm_id`, `camera_id`, `create_time`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='�澯�¼������';

-- zn_device_sn_var       varchar(255) collate utf8mb4_unicode_ci null comment '�豸���',
-- zn_device_sn_var       varchar(255)                    DEFAULT NULL COMMENT '�豸���',
ALTER TABLE zn_ais_event_data_details_operate
MODIFY zn_device_sn_var       varchar(255) collate utf8mb4_unicode_ci null comment '�豸���';


