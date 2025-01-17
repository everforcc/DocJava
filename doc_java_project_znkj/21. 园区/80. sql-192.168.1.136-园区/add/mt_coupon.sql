-- auto-generated definition
create table mt_coupon
(
    ID               int								comment '����ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '�豸���',
    MERCHANT_ID  int            default 0         null comment '�̻�ID',
    STORE_ID     int            default 0         null comment '����ID',
    GROUP_ID     int            default 0         not null comment 'ȯ��ID',
    TYPE         char           default 'C'       null comment 'ȯ���ͣ�C�Ż�ȯ��PԤ�濨��T���ο�',
    NAME         varchar(100)   default ''        not null comment 'ȯ����',
    IS_GIVE      tinyint(1)     default 0         null comment '�Ƿ�����ת��',
    GRADE_IDS    varchar(100)   default ''        null comment '���û�Ա�ȼ�',
    POINT        int            default 0         null comment '��ÿ�ȯ�����Ļ���',
    APPLY_GOODS  varchar(20)    default ''        null comment '������Ʒ��allGoods��parkGoods',
    RECEIVE_CODE varchar(32)    default ''        null comment '��ȡ��',
    USE_FOR      varchar(30)    default ''        null comment 'ʹ��ר��',
    EXPIRE_TYPE  varchar(30)    default ''        null comment '��������',
    EXPIRE_TIME  int            default 0         null comment '��Ч�ڣ���λ����',
    BEGIN_TIME   datetime                         null comment '��ʼ��Ч��',
    END_TIME     datetime                         null comment '������Ч��',
    AMOUNT       decimal(10, 2) default 0.00      null comment '���',
    SEND_WAY     varchar(20)    default 'backend' null comment '���ŷ�ʽ',
    SEND_NUM     int unsigned   default '1'       null comment 'ÿ�η�������',
    TOTAL        int            default 0         null comment '��������',
    LIMIT_NUM    int            default 1         null comment 'ÿ��ӵ����������',
    EXCEPT_TIME  varchar(500)   default ''        null comment '���������ڣ����Ÿ�������ĩ��weekend��������2019-01-02_2019-02-09',
    STORE_IDS    varchar(100)   default ''        null comment '��������ID,���Ÿ���',
    DESCRIPTION  varchar(2000)  default ''        null comment '������Ϣ',
    IMAGE        varchar(100)   default ''        null comment 'Ч��ͼƬ',
    REMARKS      varchar(1000)  default ''        null comment '��̨��ע',
    IN_RULE      varchar(1000)  default ''        null comment '��ȡȯ�Ĺ���',
    OUT_RULE     varchar(1000)  default ''        null comment '����ȯ�Ĺ���',
    CREATE_TIME  datetime                         null comment '����ʱ��',
    UPDATE_TIME  datetime                         null comment '����ʱ��',
    OPERATOR     varchar(30)    default ''        null comment '��������',
    STATUS       char           default 'A'       null comment 'A��������D��ɾ��'
)
    comment '��ȯ��Ϣ��' charset = utf8mb3;

