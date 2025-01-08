show create table zn_ais_event_data_details;
-- zn_ais_event_data_details_operate
select * from zn_ais_event_data_details_operate;

insert into zn_ais_event_data_details_operate(id, zn_device_sn_var, aim_event_data_detail_id, device_id, event_date_id, algorithm_config_id, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_id, object_num, model_type, event_address, event_info, image_path, video_path, core_id, status, process_id, process_name, process_time, process_picture, process_text, mistake_flag, transparent, event_status, event_obj, track_list, event_type, type_id, sub_objects, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id, picture_feature_image_path, target_object_list, detection_region)
select id, zn_device_sn_var, aim_event_data_detail_id, device_id, event_date_id, algorithm_config_id, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_id, object_num, model_type, event_address, event_info, image_path, video_path, core_id, status, process_id, process_name, process_time, process_picture, process_text, mistake_flag, transparent, event_status, event_obj, track_list, event_type, type_id, sub_objects, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id, picture_feature_image_path, target_object_list, detection_region from zn_ais_event_data_details;

CREATE TABLE `zn_ais_event_data_details_operate`
(
    `id`                         bigint(20) NOT NULL COMMENT '主键',
    `zn_device_sn_var`           varchar(255)  DEFAULT NULL COMMENT '设备编号',
    `aim_event_data_detail_id`   bigint(20)    DEFAULT NULL COMMENT 'aim事件详情编号',
    `device_id`                  bigint(20)    DEFAULT NULL COMMENT '设备编号',
    `event_date_id`              bigint(20)    DEFAULT NULL COMMENT '告警事件编号',
    `algorithm_config_id`        bigint(20)    DEFAULT NULL COMMENT '算法配置编号',
    `algorithm_id`               bigint(20)    DEFAULT NULL COMMENT '算法编号',
    `algorithm_name`             varchar(255)  DEFAULT NULL COMMENT '算法名称',
    `camera_id`                  bigint(20)    DEFAULT NULL COMMENT '相机编号',
    `event_begin_end`            tinyint(1)    DEFAULT '1' COMMENT '事件开始结束标识（1开始，2结束）',
    `position_x`                 varchar(32)   DEFAULT NULL COMMENT '像素位置X坐标',
    `position_y`                 varchar(32)   DEFAULT NULL COMMENT '像素位置Y坐标',
    `position_w`                 varchar(32)   DEFAULT NULL COMMENT '目标像素宽',
    `position_h`                 varchar(32)   DEFAULT NULL COMMENT '目标像素高',
    `probability`                varchar(64)   DEFAULT NULL COMMENT '概率',
    `object_id`                  varchar(64)   DEFAULT NULL COMMENT '目标id',
    `object_num`                 int(11)       DEFAULT NULL COMMENT '目标数量',
    `model_type`                 tinyint(1)    DEFAULT NULL COMMENT '模型类型',
    `event_address`              varchar(255)  DEFAULT NULL COMMENT '事件地点',
    `event_info`                 text COMMENT '事件详情',
    `image_path`                 varchar(500)  DEFAULT NULL COMMENT '图片文件地址',
    `video_path`                 varchar(500)  DEFAULT NULL COMMENT '视频文件地址',
    `core_id`                    bigint(20)    DEFAULT NULL COMMENT '核心编号',
    `status`                     tinyint(1)    DEFAULT NULL COMMENT '事件状态（0待处置、1处置中、2已处置、3已忽略）',
    `process_id`                 bigint(20)    DEFAULT NULL COMMENT '处理人编号',
    `process_name`               varchar(64)   DEFAULT NULL COMMENT '处理人名称',
    `process_time`               datetime      DEFAULT NULL COMMENT '处理时间',
    `process_picture`            varchar(255)  DEFAULT NULL COMMENT '处置图片',
    `process_text`               varchar(255)  DEFAULT NULL COMMENT '留言',
    `mistake_flag`               tinyint(1)    DEFAULT '0' COMMENT '误报标记（0正确事件，1误报事件）',
    `transparent`                text COMMENT '透传字段',
    `event_status`               tinyint(1)    DEFAULT NULL COMMENT '事件类型 -1 不报警 0 简单   2 状态变更：长时间报警突然不报警 5 阈值报警 6 阈值结束报警 7 阈值持续报警 8 简单目标报警 9 目标持续报警 10 目标消失报警  11 目标位移报警',
    `event_obj`                  json          DEFAULT NULL COMMENT '事件其他对象',
    `track_list`                 json          DEFAULT NULL COMMENT '目标模式下的跟踪框',
    `event_type`                 tinyint(1)    DEFAULT NULL COMMENT '事件类型 （1目标识别类，2特征检测类）',
    `type_id`                    tinyint(1)    DEFAULT NULL COMMENT '目标类型 {0:误检目标,1:车头,2:车尾,3:车侧,4:二轮车,5:三轮车,7:行人,8:人体,99:人脸} ',
    `sub_objects`                json          DEFAULT NULL COMMENT '人脸子目标',
    `create_time`                datetime      DEFAULT NULL COMMENT '入库时间',
    `del_flag`                   tinyint(1)    DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_id`                  bigint(20)    DEFAULT NULL COMMENT '创建者id',
    `create_by`                  varchar(32)   DEFAULT NULL COMMENT '创建者',
    `create_dept`                bigint(20)    DEFAULT NULL COMMENT '创建部门',
    `update_id`                  bigint(20)    DEFAULT NULL COMMENT '更新者id',
    `update_by`                  varchar(32)   DEFAULT NULL COMMENT '更新者',
    `update_time`                datetime      DEFAULT NULL COMMENT '更新时间',
    `remark`                     varchar(500)  DEFAULT NULL COMMENT '备注',
    `up_flag`                    int(11)       DEFAULT '0' COMMENT '0 未上传 1 上传中 2 已上传',
    `up_count`                   int(11)       DEFAULT '0' COMMENT '上传次数',
    `up_msg`                     varchar(255)  DEFAULT NULL COMMENT '上传信息',
    `up_id`                      varchar(255)  DEFAULT NULL COMMENT '上传ID',
    `picture_feature_image_path` varchar(500)  DEFAULT NULL COMMENT '人脸库图片',
    `target_object_list`         json          DEFAULT NULL COMMENT '目标集合',
    `detection_region`           varchar(2000) DEFAULT NULL COMMENT '检测区域',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `event_begin_end` (`event_begin_end`),
    KEY `algorithm_camera_cetime` (`algorithm_id`, `camera_id`, `create_time`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='告警事件详情表';

-- zn_device_sn_var       varchar(255) collate utf8mb4_unicode_ci null comment '设备编号',
-- zn_device_sn_var       varchar(255)                    DEFAULT NULL COMMENT '设备编号',
ALTER TABLE zn_ais_event_data_details_operate
MODIFY zn_device_sn_var       varchar(255) collate utf8mb4_unicode_ci null comment '设备编号';


