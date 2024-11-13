-- auto-generated definition
create table mt_user_coupon
(
    ID               int								comment '����ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '�豸���',
    CODE        varchar(32)    default ''   not null comment '����',
    TYPE        char           default 'C'  not null comment 'ȯ���ͣ�C�Ż�ȯ��PԤ�濨��T���ο�',
    IMAGE       text                        null comment 'Ч��ͼ',
    GROUP_ID    int            default 0    not null comment 'ȯ��ID',
    COUPON_ID   int            default 0    not null comment 'ȯID',
    MOBILE      varchar(20)    default ''   null comment '�û��ֻ�����',
    USER_ID     int            default 0    null comment '�û�ID',
    MERCHANT_ID int            default 0    null comment '�̻�ID',
    STORE_ID    int            default 0    null comment 'ʹ�õ���ID',
    AMOUNT      decimal(10, 2) default 0.00 null comment '���',
    BALANCE     decimal(10, 2) default 0.00 null comment '���',
    STATUS      char           default '1'  not null comment '״̬��A��δʹ�ã�B����ʹ�ã�C���ѹ���; D����ɾ����E��δ��ȡ',
    USED_TIME   datetime                    null comment 'ʹ��ʱ��',
    CREATE_TIME datetime                    null comment '����ʱ��',
    UPDATE_TIME datetime                    null comment '����ʱ��',
    EXPIRE_TIME datetime                    null comment '����ʱ��',
    OPERATOR    varchar(30)    default ''   null comment '��������',
    UUID        varchar(50)    default ''   null comment '����UUID',
    ORDER_ID    int            default 0    null comment '����ID'
)
    comment '��Ա��ȯ��' charset = utf8mb3;

create index index_code
    on mt_user_coupon (CODE);

create index index_coupon_id
    on mt_user_coupon (COUPON_ID);

create index index_group_id
    on mt_user_coupon (GROUP_ID);

create index index_user_id
    on mt_user_coupon (USER_ID);

