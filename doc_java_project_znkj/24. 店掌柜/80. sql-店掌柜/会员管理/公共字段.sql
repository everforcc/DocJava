
-- zn_dzg_member
ALTER TABLE `zn_dzg_member` ADD     remark     varchar(200)       null comment '��ע';
ALTER TABLE `zn_dzg_member` ADD     create_id     bigint       null comment '������id';
ALTER TABLE `zn_dzg_member` ADD     create_by     varchar(60)  null comment '������';
ALTER TABLE `zn_dzg_member` ADD     create_dept   bigint       null comment '��������';
ALTER TABLE `zn_dzg_member` ADD     create_time   datetime     null comment '����ʱ��';
ALTER TABLE `zn_dzg_member` ADD     update_id     bigint       null comment '������id';
ALTER TABLE `zn_dzg_member` ADD     update_by     varchar(60)  null comment '������';
ALTER TABLE `zn_dzg_member` ADD     update_time   datetime     null comment '����ʱ��';
ALTER TABLE `zn_dzg_member` ADD     del_flag      tinyint(1)   null comment 'ɾ�����';

-- zn_dzg_member_point
ALTER TABLE `zn_dzg_member_point` ADD     remark     varchar(200)       null comment '��ע';
ALTER TABLE `zn_dzg_member_point` ADD     create_id     bigint       null comment '������id';
ALTER TABLE `zn_dzg_member_point` ADD     create_by     varchar(60)  null comment '������';
ALTER TABLE `zn_dzg_member_point` ADD     create_dept   bigint       null comment '��������';
ALTER TABLE `zn_dzg_member_point` ADD     create_time   datetime     null comment '����ʱ��';
ALTER TABLE `zn_dzg_member_point` ADD     update_id     bigint       null comment '������id';
ALTER TABLE `zn_dzg_member_point` ADD     update_by     varchar(60)  null comment '������';
ALTER TABLE `zn_dzg_member_point` ADD     update_time   datetime     null comment '����ʱ��';
ALTER TABLE `zn_dzg_member_point` ADD     del_flag      tinyint(1)   null comment 'ɾ�����';

