-- del
-- 错了不用这个


select * from zn_event_data e ;
show create table zn_event_data;

-- 数据迁移
# drop table zn_event_data_operate;
# select * from zn_event_data_operate e ;
insert into zn_event_data_operate (id, zn_device_sn_var, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_num, model_type, event_address, event_info, image_path, videl_path, core_id, status, deal_back_type, process_id, process_name, process_time, process_price, process_voice, process_text, mistake_flag, transparent, deal_user_ids, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id)
select id, zn_device_sn_var, algorithm_id, algorithm_name, camera_id, event_begin_end, position_x, position_y, position_w, position_h, probability, object_num, model_type, event_address, event_info, image_path, videl_path, core_id, status, deal_back_type, process_id, process_name, process_time, process_price, process_voice, process_text, mistake_flag, transparent, deal_user_ids, create_time, del_flag, create_id, create_by, create_dept, update_id, update_by, update_time, remark, up_flag, up_count, up_msg, up_id from zn_event_data;


-- 创建脚本
CREATE TABLE `zn_event_data_operate`
(
    `id`               bigint(20)   NOT NULL COMMENT '主键',
    `zn_device_sn_var` varchar(255) NOT NULL COMMENT '设备编号',
    `algorithm_id`     bigint(20)   DEFAULT NULL COMMENT '算法编号',
    `algorithm_name`   varchar(255) DEFAULT NULL COMMENT '算法名称',
    `camera_id`        bigint(20)   DEFAULT NULL COMMENT '相机编号',
    `event_begin_end`  tinyint(1)   DEFAULT NULL COMMENT '事件开始结束标识（1开始，2结束）',
    `position_x`       varchar(32)  DEFAULT NULL COMMENT '像素位置X坐标',
    `position_y`       varchar(32)  DEFAULT NULL COMMENT '像素位置Y坐标',
    `position_w`       varchar(32)  DEFAULT NULL COMMENT '目标像素宽',
    `position_h`       varchar(32)  DEFAULT NULL COMMENT '目标像素高',
    `probability`      varchar(64)  DEFAULT NULL COMMENT '概率',
    `object_num`       int(11)      DEFAULT NULL COMMENT '目标数量',
    `model_type`       tinyint(1)   DEFAULT NULL COMMENT '模型类型',
    `event_address`    varchar(200) DEFAULT NULL COMMENT '事件地点',
    `event_info`       text COMMENT '事件详情',
    `image_path`       text COMMENT '图片文件地址',
    `videl_path`       varchar(500) DEFAULT NULL COMMENT '视频文件地址',
    `core_id`          bigint(20)   DEFAULT NULL COMMENT '核心编号',
    `status`           tinyint(1)   DEFAULT NULL COMMENT '事件状态（0待处置、1处置中、2已处置）',
    `deal_back_type`   char(1)      DEFAULT '0' COMMENT '处置回执方式：0文字、1图片、2语音',
    `process_id`       bigint(20)   DEFAULT NULL COMMENT '处理人编号',
    `process_name`     varchar(64)  DEFAULT NULL COMMENT '处理人名称',
    `process_time`     datetime     DEFAULT NULL COMMENT '处理时间',
    `process_price`    varchar(255) DEFAULT NULL COMMENT '处置图片',
    `process_voice`    text COMMENT '处置语音',
    `process_text`     varchar(255) DEFAULT NULL COMMENT '留言',
    `mistake_flag`     tinyint(1)   DEFAULT NULL COMMENT '误报标记（0正确事件，1误报事件）',
    `transparent`      text COMMENT '透传字段',
    `deal_user_ids`    text COMMENT '可处理人ID（逗号分隔）',
    `create_time`      datetime     DEFAULT NULL COMMENT '入库时间',
    `del_flag`         tinyint(1)   DEFAULT NULL COMMENT '删除标记',
    `create_id`        bigint(20)   DEFAULT NULL COMMENT '创建者id',
    `create_by`        varchar(32)  DEFAULT NULL COMMENT '创建者',
    `create_dept`      bigint(20)   DEFAULT NULL COMMENT '创建部门',
    `update_id`        bigint(20)   DEFAULT NULL COMMENT '更新者id',
    `update_by`        varchar(32)  DEFAULT NULL COMMENT '更新者',
    `update_time`      datetime     DEFAULT NULL COMMENT '更新时间',
    `remark`           varchar(500) DEFAULT NULL COMMENT '备注',
    `up_flag`          int(11)      DEFAULT NULL COMMENT '0未上传、1上传中、2已上传',
    `up_count`         int(11)      DEFAULT NULL COMMENT '上传次数',
    `up_msg`           varchar(255) DEFAULT NULL COMMENT '上传信息',
    `up_id`            varchar(255) DEFAULT NULL COMMENT '上传ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='告警事件表';