-- auto-generated definition
create table mt_confirm_log
(
    ID               int								comment '����ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '�豸���',
    CODE             varchar(32)    default ''        not null comment '����',
    AMOUNT           decimal(10, 2) default 0.00      null comment '�������',
    COUPON_ID        int            default 0         null comment '��ȯID',
    USER_COUPON_ID   int            default 0         not null comment '�û�ȯID',
    ORDER_ID         int            default 0         null comment '����ID',
    CREATE_TIME      datetime                         null comment '����ʱ��',
    UPDATE_TIME      datetime                         null comment '����ʱ��',
    USER_ID          int            default 0         not null comment '��ȯ�����û�ID',
    OPERATOR_USER_ID int                              null comment '�������û�ID',
    MERCHANT_ID      int            default 0         null comment '�̻�ID',
    STORE_ID         int            default 0         not null comment '��������ID',
    STATUS           varchar(1)                       not null comment '״̬��A����������D������ʹ��',
    CANCEL_TIME      datetime                         null comment '����ʱ��',
    OPERATOR         varchar(30)                      null comment '��������',
    OPERATOR_FROM    varchar(30)    default 'mt_user' null comment '������Դuser_id��Ӧ��t_account ���� mt_user',
    REMARK           varchar(500)   default ''        null comment '��ע��Ϣ'
)
    comment '������¼��' charset = utf8mb3;

