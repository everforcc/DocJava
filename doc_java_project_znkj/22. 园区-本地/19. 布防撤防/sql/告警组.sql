

ALTER TABLE zn_rearm_group_temp ADD up_flag                  int           null comment '0 未上传 1 上传中 2 已上传';
ALTER TABLE zn_rearm_group_temp ADD up_count                 int           null comment '上传次数';
ALTER TABLE zn_rearm_group_temp ADD up_msg                   varchar(255)  null comment '上传信息';
ALTER TABLE zn_rearm_group_temp ADD up_id                    varchar(255)  null comment '上传ID';