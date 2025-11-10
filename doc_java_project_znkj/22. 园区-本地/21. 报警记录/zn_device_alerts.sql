-- auto-generated definition
create table zn_device_alerts
(
    id              bigint auto_increment comment '报警记录ID'
        primary key,
    alert_type_code int                                    default 0  null comment '报警类型 1本机设备 2门禁机 3车牌相机 4梯控 5 lot 6能效管理7考勤8ip广播9摄像头 10ai事件',
    device_name     varchar(36)                                       null comment '设备名称',
    device_code     varchar(36)                                       null comment '设备编号',
    alert_time      datetime                                          null comment '报警时间',
    device_type     varchar(36)                                       null comment '设备类型',
    status          int                                    default 0  null comment '报警状态0正常1故障',
    current_status  int                                    default 0  null comment '当前状态0正常1故障',
    temp_status     int                                               null comment '临时状态0正常,故障后的检测次数，从1开始累加',
    is_read         int                                    default 0  null comment '0（未读），1（已读）',
    create_id       bigint                                            null comment '创建者ID',
    create_by       varchar(64) collate utf8mb4_general_ci default '' null comment '创建者',
    create_time     datetime                                          null comment '创建时间',
    create_dept     bigint                                            null comment '创建部门',
    update_id       bigint                                            null comment '更新者ID',
    update_by       varchar(64) collate utf8mb4_general_ci default '' null comment '更新者',
    update_time     datetime                                          null comment '更新时间',
    del_flag        tinyint(1)                             default 0  null comment '删除标志（0代表存在 1代表删除）',
    remark          varchar(255) collate utf8mb4_general_ci           null comment '备注'
)
    comment '设备报警信息表' charset = utf8mb4;

-- 为已存在的表添加联合索引
CREATE INDEX idx_alert_type_code_is_read_del_flag ON zn_device_alerts (alert_type_code, is_read, del_flag);
