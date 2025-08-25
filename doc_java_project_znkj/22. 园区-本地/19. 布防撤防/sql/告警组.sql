
ALTER TABLE zn_rearm_group_temp ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE zn_rearm_group_temp ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE zn_rearm_group_temp ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE zn_rearm_group_temp ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE zn_rearm_group_temp ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE zn_rearm_group_temp ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE zn_rearm_group_temp ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE zn_rearm_group_temp ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE zn_rearm_group_temp ADD     del_flag      tinyint(1)   null comment '删除标记';

