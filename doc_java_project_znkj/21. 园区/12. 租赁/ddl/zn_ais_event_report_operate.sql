-- del
-- 错了不用这个


-- 同步表
select * from zn_ais_event_report e ;
-- show create table zn_ais_event_report;
-- 操作表
# select * from zn_ais_event_report_operate;
# drop table zn_ais_event_report_operate;
--
insert into zn_ais_event_report_operate(id, zn_device_sn_var, group_name, report_type, report_content_json, report_camera_json, report_algorithm_json, report_algorithm_camera_json, report_user_json, statistics_interval, statistics_time_json, remark, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag, up_flag, up_count, up_msg, up_id)
select id, zn_device_sn_var, group_name, report_type, report_content_json, report_camera_json, report_algorithm_json, report_algorithm_camera_json, report_user_json, statistics_interval, statistics_time_json, remark, create_id, create_by, create_time, create_dept, update_id, update_by, update_time, del_flag, up_flag, up_count, up_msg, up_id from zn_ais_event_report;


-- auto-generated definition
CREATE TABLE `zn_ais_event_report_operate`
(
    `id`                           bigint(20) NOT NULL COMMENT '主键编号',
    `zn_device_sn_var`             varchar(255) DEFAULT NULL COMMENT '设备编号',
    `group_name`                   varchar(255) DEFAULT NULL COMMENT '告警组名称',
    `report_type`                  tinyint(1)   DEFAULT NULL COMMENT '上报类型（0事件告警，1统计上报）',
    `report_content_json`          json         DEFAULT NULL COMMENT '上报内容json串',
    `report_camera_json`           json         DEFAULT NULL COMMENT '上报选择的相机json串',
    `report_algorithm_json`        json         DEFAULT NULL COMMENT '上报选择的算法json串',
    `report_algorithm_camera_json` varchar(255) DEFAULT NULL COMMENT '上报选择的算法、相机json串[{"algorithmId":"123123","cameraId":[123,111]}]',
    `report_user_json`             json         DEFAULT NULL COMMENT '上报人员json串[{"userId":1,"userName":"管理员"}]',
    `statistics_interval`          int(11)      DEFAULT NULL COMMENT '统计上报间隔（x分钟上报一次）',
    `statistics_time_json`         json         DEFAULT NULL COMMENT '统计上报时间',
    `remark`                       varchar(255) DEFAULT NULL COMMENT '备注',
    `create_id`                    bigint(20)   DEFAULT NULL COMMENT '创建者ID',
    `create_by`                    varchar(64)  DEFAULT '' COMMENT '创建者',
    `create_time`                  datetime     DEFAULT NULL COMMENT '创建时间',
    `create_dept`                  bigint(20)   DEFAULT NULL COMMENT '创建部门',
    `update_id`                    bigint(20)   DEFAULT NULL COMMENT '更新者ID',
    `update_by`                    varchar(64)  DEFAULT '' COMMENT '更新者',
    `update_time`                  datetime     DEFAULT NULL COMMENT '更新时间',
    `del_flag`                     tinyint(1)   DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
    `up_flag`                      int(11)      DEFAULT '0' COMMENT '0 未上传 1 上传中 2 已上传',
    `up_count`                     int(11)      DEFAULT '0' COMMENT '上传次数',
    `up_msg`                       varchar(255) DEFAULT NULL COMMENT '上传信息',
    `up_id`                        varchar(200) DEFAULT NULL COMMENT '上传ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
    comment '事件信息上报具体操作对象';


