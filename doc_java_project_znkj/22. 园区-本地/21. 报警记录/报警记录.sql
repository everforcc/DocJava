-- 创建设备报警信息表，用于记录设备的异常报警及状态变更
CREATE TABLE device_alerts (
    -- 主键ID，自动递增，唯一标识每条报警记录
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '报警记录ID',

    -- 设备名称，如“设备6787”，不能为空
    device_name VARCHAR(255) NOT NULL COMMENT '设备名称',

    -- 设备编号/序列号，如“LZ22366566”，用于唯一标识物理设备
    device_code VARCHAR(255) NOT NULL COMMENT '设备编号',

    -- 报警发生时间，精确到秒，不能为空
    alert_time DATETIME NOT NULL COMMENT '报警时间',

    -- 设备类型，如“CPU”、“风扇”、“内存”等
    device_type VARCHAR(255) NOT NULL COMMENT '设备类型',

    -- 报警时的状态描述，如“故障”、“离线”、“温度过高”
    status VARCHAR(255) NOT NULL COMMENT '报警状态',

    -- 当前最新状态，用于追踪设备恢复情况，如“正常”、“已修复”
    current_status VARCHAR(255) NOT NULL COMMENT '当前状态',

    -- 可选：创建时间，默认为当前时间
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',

    -- 可选：更新时间，记录状态变更时间
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间'

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备报警信息表';