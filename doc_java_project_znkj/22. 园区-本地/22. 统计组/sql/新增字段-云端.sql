
-- 主表
-- 1. 类型
-- 2. 统计时间
-- 3. 相机类型
-- 4. 统计时间开始
-- 5. 统计时间结束
ALTER TABLE zn_rearm_group ADD type int null comment '类型 0 iot/算法 2 相机划线';
ALTER TABLE zn_rearm_group ADD count_period int null comment '（type=2）统计时间';
ALTER TABLE zn_rearm_group ADD camera_type int null comment '（type=2）相机类型 1 车辆 2 人员';
ALTER TABLE zn_rearm_group ADD time_start datetime null comment '统计时间开始';
ALTER TABLE zn_rearm_group ADD time_end datetime null comment '统计时间结束';

-- 关联表
-- 1. 增加相机id
-- 2. 更新注释
ALTER TABLE zn_rearm_group_device ADD device_id2 bigint null comment '（type=2）相机id';
--                                       device_type tinyint null comment '0,IOT 1,AI算法';
ALTER TABLE zn_rearm_group_device MODIFY device_type tinyint null comment '0,IOT 1,AI算法 2相机划线';

update zn_rearm_group set type = 0;

ALTER TABLE `zn_ais_algorithms_config`
    ADD COLUMN `road_rules_json` text NULL COMMENT '设置道路规则的描述' ;
