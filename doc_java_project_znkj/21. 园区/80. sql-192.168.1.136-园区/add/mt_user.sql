-- auto-generated definition
create table mt_user
(
    ID               int								comment '����ID',
    sn      varchar(255) collate utf8mb4_unicode_ci null comment '�豸���',
    MOBILE      varchar(20)  default ''   null comment '�ֻ�����',
    GROUP_ID    int          default 0    null comment '����ID',
    USER_NO     varchar(30)  default ''   null comment '��Ա��',
    AVATAR      text                      null comment 'ͷ��',
    NAME        varchar(30)  default ''   null comment '�ƺ�',
    OPEN_ID     varchar(50)  default ''   null comment '΢��open_id',
    IDCARD      varchar(20)  default ''   null comment '֤������',
    GRADE_ID    varchar(10)  default '1'  null comment '�ȼ�ID',
    START_TIME  datetime                  null comment '��Ա��ʼʱ��',
    END_TIME    datetime                  null comment '��Ա����ʱ��',
    BALANCE     float(10, 2) default 0.00 null comment '���',
    POINT       int          default 0    null comment '����',
    SEX         int          default 1    null comment '�Ա� 1�У�0Ů',
    BIRTHDAY    varchar(20)  default ''   null comment '��������',
    CAR_NO      varchar(10)  default ''   null comment '���ƺ�',
    SOURCE      varchar(30)  default ''   null comment '��Դ����',
    PASSWORD    varchar(32)  default ''   null comment '����',
    SALT        varchar(4)   default ''   null comment 'salt',
    ADDRESS     varchar(100) default ''   null comment '��ַ',
    MERCHANT_ID int          default 0    null comment '�����̻�ID',
    STORE_ID    int          default 0    null comment '��������ID',
    IS_STAFF    char         default 'N'  null comment '�Ƿ�Ա��',
    CREATE_TIME datetime                  null comment '����ʱ��',
    UPDATE_TIME datetime                  null comment '����ʱ��',
    STATUS      char         default 'A'  null comment '״̬��A�����N�����ã�D��ɾ��',
    DESCRIPTION varchar(255) default ''   null comment '��ע��Ϣ',
    OPERATOR    varchar(30)  default ''   null comment '��������'
)
    comment '��Ա������Ϣ' charset = utf8mb3;

create index index_phone
    on mt_user (MOBILE);

