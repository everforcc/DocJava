# znkj_app_banner �����ֶ� status

select *
from znkj_app_banner;

ALTER TABLE `znkj_app_banner`
    ADD status char collate utf8mb4_general_ci default '0' null comment '�˵�״̬��0���� 1ͣ�ã�';
