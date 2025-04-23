-- 3. 增加字段


ALTER TABLE `zn_dzg_user_protocol` ADD    remark           varchar(255)                            null comment '备注';
ALTER TABLE `zn_dzg_user_protocol` ADD    create_id        bigint                                  null comment '创建人id';
ALTER TABLE `zn_dzg_user_protocol` ADD    create_by        varchar(32)                             null comment '创建人';
ALTER TABLE `zn_dzg_user_protocol` ADD    create_time      datetime                                null comment '创建时间';
ALTER TABLE `zn_dzg_user_protocol` ADD    create_dept      bigint                                  null comment '创建部门';
ALTER TABLE `zn_dzg_user_protocol` ADD    update_id        bigint                                  null comment '更新人id';
ALTER TABLE `zn_dzg_user_protocol` ADD    update_by        varchar(32)                             null comment '更新人';
ALTER TABLE `zn_dzg_user_protocol` ADD    update_time      datetime                                null comment '更新时间';
ALTER TABLE `zn_dzg_user_protocol` ADD    del_flag         tinyint(1) default 0                    null comment '删除标志（0代表存在 2代表删除）';
