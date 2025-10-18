
-- 主表
-- 1. 类型
-- 2. 统计时间
-- 3. 相机类型
-- 4. 统计时间开始
-- 5. 统计时间结束
ALTER TABLE zn_rearm_group ADD type int null comment '类型 0 iot/算法 2 相机划线';
ALTER TABLE zn_rearm_group ADD count_period int null comment '（type=2）统计时间';
ALTER TABLE zn_rearm_group ADD camera_type int null comment '（type=2）相机类型 1 车辆 2 人员';
ALTER TABLE zn_rearm_group ADD time_start datetime null comment '统计时间开始';
ALTER TABLE zn_rearm_group ADD time_end datetime null comment '统计时间结束';

-- 关联表
-- 1. 增加相机id
-- 2. 更新注释
ALTER TABLE zn_rearm_group_device ADD device_id2 bigint null comment '（type=2）相机id';
--                                       device_type tinyint null comment '0,IOT 1,AI算法';
ALTER TABLE zn_rearm_group_device MODIFY device_type tinyint null comment '0,IOT 1,AI算法 2相机划线';

update zn_rearm_group set type = 0;

ALTER TABLE `zn_ais_algorithms_config`
    ADD COLUMN `road_rules_json` text NULL COMMENT '设置道路规则的描述' ;

-- auto-generated definition
create table zn_camera_line_event_num_metadata
(
    id          bigint                                 not null comment '主键'
        primary key,
    meta_data   json                                   null comment '原始数据',
    remark      varchar(255)                           null comment '备注',
    create_id   bigint                                 null comment '创建者ID',
    create_by   varchar(64) charset utf8mb4 default '' null comment '创建者',
    create_time datetime                               null comment '创建时间',
    create_dept bigint                                 null comment '创建部门',
    update_id   bigint                                 null comment '更新者ID',
    update_by   varchar(64) charset utf8mb4 default '' null comment '更新者',
    update_time datetime                               null comment '更新时间',
    del_flag    tinyint(1)                  default 0  null
)
    comment '相机划线原始数据表';

-- auto-generated definition
create table zn_camera_line_event_num_record
(
    id             bigint                                 not null
        primary key,
    camera_id      bigint                                 null comment '相机id',
    camera_line_id bigint                                 null comment '相机划线id',
    group_id       bigint                                 null comment '统计组id',
    flow           int                                    null comment '流量',
    alarm_time     datetime                               null comment '报警时间',
    remark         varchar(255)                           null comment '备注',
    create_id      bigint                                 null comment '创建者ID',
    create_by      varchar(64) charset utf8mb4 default '' null comment '创建者',
    create_time    datetime                               null comment '创建时间',
    create_dept    bigint                                 null comment '创建部门',
    update_id      bigint                                 null comment '更新者ID',
    update_by      varchar(64) charset utf8mb4 default '' null comment '更新者',
    update_time    datetime                               null comment '更新时间',
    del_flag       tinyint(1)                  default 0  null
)
    comment '相机划线数据表';


