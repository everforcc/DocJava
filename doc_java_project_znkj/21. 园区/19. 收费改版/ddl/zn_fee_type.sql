INSERT INTO `zn_fee_type` (`code`, `name`, `remark`, `del_flag`) VALUES ('5-1', '超市', NULL, 0);
INSERT INTO `zn_fee_type` (`code`, `name`, `remark`, `del_flag`) VALUES ('5-2', '餐饮', NULL, 0);
INSERT INTO `zn_fee_type` (`code`, `name`, `remark`, `del_flag`) VALUES ('5-3', '收钱', NULL, 0);
INSERT INTO `zn_fee_type` (`code`, `name`, `remark`, `del_flag`) VALUES ('7-1', '积分充值', NULL, 0);
INSERT INTO `zn_fee_type` (`code`, `name`, `remark`, `del_flag`) VALUES ('7-2', '知识库续费', NULL, 0);
INSERT INTO `zn_fee_type` (`code`, `name`, `remark`, `del_flag`) VALUES ('8-1', '预存金豆', NULL, 0);
INSERT INTO `zn_fee_type` (`code`, `name`, `remark`, `del_flag`) VALUES ('9-1', '大模型充值', NULL, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-1', '门禁机', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-2', '车牌相机', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-3', '梯控', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-4', 'IOT设备', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-5', '能耗设备', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-7', '考勤管理', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-9', '音响设备', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-11', '摄像机直播', null, 0);
INSERT INTO `zn_fee_type` (code, name, remark, del_flag) VALUES ('10-12', 'AI事件', null, 0);
-- bug-9229
update zn_fee_type set name = '暖气费' where code = '1-6661';