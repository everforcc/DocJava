
-- zn_dzg_member
ALTER TABLE `zn_dzg_member` ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE `zn_dzg_member` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_member` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_member` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_member` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_member` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_member` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_member` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_member` ADD     del_flag      tinyint(1)   null comment '删除标记';

-- zn_dzg_member_point
ALTER TABLE `zn_dzg_member_point` ADD     remark     varchar(200)       null comment '备注';
ALTER TABLE `zn_dzg_member_point` ADD     create_id     bigint       null comment '创建人id';
ALTER TABLE `zn_dzg_member_point` ADD     create_by     varchar(60)  null comment '创建人';
ALTER TABLE `zn_dzg_member_point` ADD     create_dept   bigint       null comment '创建部门';
ALTER TABLE `zn_dzg_member_point` ADD     create_time   datetime     null comment '创建时间';
ALTER TABLE `zn_dzg_member_point` ADD     update_id     bigint       null comment '更新人id';
ALTER TABLE `zn_dzg_member_point` ADD     update_by     varchar(60)  null comment '更新人';
ALTER TABLE `zn_dzg_member_point` ADD     update_time   datetime     null comment '更新时间';
ALTER TABLE `zn_dzg_member_point` ADD     del_flag      tinyint(1)   null comment '删除标记';

