-- auto-generated definition
create table zn_upper
(
    id          bigint       not null comment 'ͬ������'
        primary key,
    t_name      varchar(255) not null comment '����',
    t_id        bigint       not null comment 'ID',
    t_count     bigint       not null comment '����',
    code        int          null comment '������',
    message     varchar(255) null comment '������Ϣ',
    create_id   bigint       null comment '������ID',
    create_by   varchar(50)  null comment '������',
    create_time datetime     null comment '����ʱ��',
    create_dept bigint       null comment '�����߲���',
    update_id   bigint       null comment '������ID',
    update_by   varchar(50)  null comment '������',
    update_time datetime     null comment '����ʱ��',
    del_flag    tinyint(1)   null comment 'ɾ����ʶ',
    remark      varchar(100) null comment '��ע'
)
    comment 'ͬ��';

