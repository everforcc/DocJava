-- zn_sensor_gateway.sql
show create table zn_sensor_gateway;
ALTER TABLE `zn_sensor_gateway`
    ADD dm_Id bigint null comment '物模型id';

show create table zn_sensor;
ALTER TABLE `zn_sensor`
    ADD dm_Id bigint null comment '物模型id';