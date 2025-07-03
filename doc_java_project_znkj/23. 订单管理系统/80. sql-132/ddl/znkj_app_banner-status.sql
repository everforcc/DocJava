# znkj_app_banner 增加字段 status

select *
from znkj_app_banner;

ALTER TABLE `znkj_app_banner`
    ADD status char collate utf8mb4_general_ci default '0' null comment '菜单状态（0正常 1停用）';
