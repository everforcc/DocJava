# znkj_app_banner 增加字段 banner_desc

select *
from znkj_app_banner;

ALTER TABLE `znkj_app_banner`
    ADD `banner_desc` text null comment '详情内容';