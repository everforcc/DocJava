
--
-- zn_index_menu 首页展示菜单
-- 首页页面索引
-- index(1-6) 1 人员 2 电梯 3 车辆 4 收入 5 图片 6 文字
-- content (5 当选文字的时候显示这个)
-- pic (6 当选图片的时候显示这个，看看是否显示全路径)
-- 红点逻辑
-- lastSearchDate1 (最后一次搜索时间 1 人员)
-- lastSearchDate2 (最后一次搜索时间 2 电梯)
-- carFeeShow3 (车辆通行，是否展示出入场数和停车收入项)

# ALTER TABLE zn_index_menu ADD     remark     varchar(200)       null comment '备注';
# ALTER TABLE zn_index_menu ADD     create_id     bigint       null comment '创建人id';
# ALTER TABLE zn_index_menu ADD     create_by     varchar(60)  null comment '创建人';
# ALTER TABLE zn_index_menu ADD     create_dept   bigint       null comment '创建部门';
# ALTER TABLE zn_index_menu ADD     create_time   datetime     null comment '创建时间';
# ALTER TABLE zn_index_menu ADD     update_id     bigint       null comment '更新人id';
# ALTER TABLE zn_index_menu ADD     update_by     varchar(60)  null comment '更新人';
# ALTER TABLE zn_index_menu ADD     update_time   datetime     null comment '更新时间';
# ALTER TABLE zn_index_menu ADD     del_flag      tinyint(1)   null comment '删除标记';

-- copy一条初始化数据

-- auto-generated definition
create table zn_index_menu
(
    id                 bigint            not null comment '主键'
        primary key,
    index_page         tinyint           null comment '1 人员 2 电梯 3 车辆 4 收入 5 图片 6 文字',
    content            varchar(128)      null comment '5 当选文字的时候显示这个',
    pic                varchar(512)      null comment '6 当选图片的时候显示这个',
    last_search_count1 int               null comment '统计重点人员',
    last_search_count2 int               null comment ' 2 统计重点电梯',
    last_search_count3 int               null comment '3 统计重点车辆',
    car_fee_show3      tinyint           null comment '车辆通行，是否展示出入场数和停车收入项 0 否 1 是',
    rest               tinyint default 0 null comment '重置标志',
    remark             varchar(200)      null comment '备注',
    create_id          bigint            null comment '创建人id',
    create_by          varchar(60)       null comment '创建人',
    create_dept        bigint            null comment '创建部门',
    create_time        datetime          null comment '创建时间',
    update_id          bigint            null comment '更新人id',
    update_by          varchar(60)       null comment '更新人',
    update_time        datetime          null comment '更新时间',
    del_flag           tinyint(1)        null comment '删除标记'
)
    comment '首页展示菜单';

INSERT INTO zn_index_menu
    (id, index_page, content, pic, last_search_count1, last_search_count2, last_search_count3, car_fee_show3,
     remark, create_id, create_by, create_dept, create_time, update_id, update_by, update_time, del_flag)
    VALUES
           (1, 1, '中南科技', '', 0, 0, 0, 0, null, null, null, null, null, null, null, null, 0);

