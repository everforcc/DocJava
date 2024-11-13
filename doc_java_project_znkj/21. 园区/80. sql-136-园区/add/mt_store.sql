-- auto-generated definition
create table mt_store
(
    ID               int								comment '����ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '�豸���',
    MERCHANT_ID        int unsigned   default '0'  null comment '�����̻�',
    NAME               varchar(50)    default ''   not null comment '��������',
    QR_CODE            varchar(255)   default ''   null comment '���̶�ά��',
    LOGO               text                        null comment '����LOGO',
    IS_DEFAULT         char           default 'N'  not null comment '�Ƿ�Ĭ��',
    CONTACT            varchar(30)    default ''   null comment '��ϵ������',
    WX_MCH_ID          varchar(30)    default ''   null comment '΢��֧���̻���',
    WX_API_V2          varchar(32)    default ''   null comment '΢��֧��APIv2��Կ',
    WX_CERT_PATH       varchar(255)   default ''   null comment '΢��֧��֤��',
    ALIPAY_APP_ID      varchar(100)   default ''   null comment '֧����appId',
    ALIPAY_PRIVATE_KEY text                        null comment '֧����Ӧ��˽Կ',
    ALIPAY_PUBLIC_KEY  text                        null comment '֧����Ӧ�ù�Կ',
    PHONE              varchar(20)    default ''   null comment '��ϵ�绰',
    ADDRESS            varchar(100)   default ''   null comment '��ַ',
    LATITUDE           varchar(30)    default ''   null comment '����',
    LONGITUDE          varchar(30)    default ''   null comment 'ά��',
    DISTANCE           decimal(10, 2) default 0.00 null comment '����',
    HOURS              varchar(255)   default ''   null comment 'Ӫҵʱ��',
    LICENSE            varchar(255)   default ''   null comment 'Ӫҵִ��',
    CREDIT_CODE        varchar(50)    default ''   null comment 'ͳһ���������',
    BANK_NAME          varchar(100)   default ''   null comment '��������',
    BANK_CARD_NAME     varchar(100)   default ''   null comment '���п��˻���',
    BANK_CARD_NO       varchar(100)   default ''   null comment '���п�����',
    DESCRIPTION        varchar(2000)  default ''   null comment '��ע��Ϣ',
    CREATE_TIME        datetime                    null comment '����ʱ��',
    UPDATE_TIME        datetime                    null comment '����ʱ��',
    STATUS             char           default 'A'  null comment '״̬��A����Ч/���ã�D����Ч',
    OPERATOR           varchar(30)    default ''   null comment '��������'
)
    comment '���̱�' charset = utf8mb3;

