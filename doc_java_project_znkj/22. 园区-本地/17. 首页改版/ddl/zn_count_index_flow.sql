# --
# ALTER TABLE zn_count_index_flow ADD     remark     varchar(200)       null comment '备注';
# ALTER TABLE zn_count_index_flow ADD     create_id     bigint       null comment '创建人id';
# ALTER TABLE zn_count_index_flow ADD     create_by     varchar(60)  null comment '创建人';
# ALTER TABLE zn_count_index_flow ADD     create_dept   bigint       null comment '创建部门';
# ALTER TABLE zn_count_index_flow ADD     create_time   datetime     null comment '创建时间';
# ALTER TABLE zn_count_index_flow ADD     update_id     bigint       null comment '更新人id';
# ALTER TABLE zn_count_index_flow ADD     update_by     varchar(60)  null comment '更新人';
# ALTER TABLE zn_count_index_flow ADD     update_time   datetime     null comment '更新时间';
# ALTER TABLE zn_count_index_flow ADD     del_flag      tinyint(1)   null comment '删除标记';
#
# -- 重新拉库里的数据
#
