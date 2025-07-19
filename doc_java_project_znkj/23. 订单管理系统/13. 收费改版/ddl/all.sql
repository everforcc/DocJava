CREATE TABLE `zn_intent_order`
(
    `id`               bigint NOT NULL COMMENT '意向订单主键ID',
    `city_partner`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '城市合伙人',
    `partner_region`   varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '合伙人地区',
    `agent_region`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '代理商地区',
    `agent_name`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '代理商姓名',
    `agent_phone`      varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '代理商电话',
    `agent_code`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '代理商编号',
    `order_time`       datetime                                                      DEFAULT NULL COMMENT '下单时间',
    `type`             int    NOT NULL                                               DEFAULT '1' COMMENT '类别: 1.出售类, 2.租赁类',
    `shipping_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收货地址',
    `remark`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    `create_id`        bigint                                                        DEFAULT NULL COMMENT '创建人id',
    `create_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT '' COMMENT '创建人',
    `create_time`      datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_id`        bigint                                                        DEFAULT NULL COMMENT '更新人id',
    `update_by`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT '' COMMENT '更新人',
    `update_time`      datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `del_flag`         tinyint(1)                                                    DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='意向订单表';



CREATE TABLE `zn_intent_order_product`
(
    `id`            bigint NOT NULL COMMENT '意向单产品表主键ID',
    `order_id`      bigint NOT NULL COMMENT '关联的意向订单ID',
    `product_model` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '产品型号',
    `quantity`      int                                                           DEFAULT NULL COMMENT '数量',
    `remark`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    `create_id`     bigint                                                        DEFAULT NULL COMMENT '创建人id',
    `create_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT '' COMMENT '创建人',
    `create_time`   datetime                                                      DEFAULT NULL COMMENT '创建时间',
    `update_id`     bigint                                                        DEFAULT NULL COMMENT '更新人id',
    `update_by`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT '' COMMENT '更新人',
    `update_time`   datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `del_flag`      tinyint(1)                                                    DEFAULT '0' COMMENT '删除标记（0代表存在 2代表删除）',
    PRIMARY KEY (`id`),
    KEY `order_id` (`order_id`),
    CONSTRAINT `zn_intent_order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `zn_intent_order` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='意向单产品表';







