<span  style="font-family: Simsun,serif; font-size: 17px; ">

### aiot

- 中间地图
    - 查询列表增加
        - [x] 绑定设备数量
        - [ ] 是否有待处理事件
            - 有
            - 无
            - 刚发生不需要处理
- AI事件列表
    - /system/alotPage/list/lotEquipment
    - [ ] 接口返回增加mqtt的id
    - 增加个接口，掉后台，返回id，如果为空就是没有，如果部位空，那就显示
- mqtt订阅的信息
- 直播
    - rtsp
    - [ ] http://192.168.0.30/SmartScreen?code=3
    - [ ] http://192.168.0.30/prod-api/system/machineCamera/getLiveVideo/1927632423402663937
- [ ] 处理事件功能待定
- [ ] 关联广播，IP音响

### topic

- ['znkj/largeScreen/door/alarm', 'znkj/largeScreen/sensor/alarm', 'znkj/largeScreen/humidness/alarm', 'znkj/largeScreen/temperature/alarm', 'znkj/largeScreen/IoT/alarm']
- ['znkj/largeScreen/aisAlgorithms/alarm']

### plateId

- 关联关系
- mq.plate_id
- zn_cockpit_pilot_plate_device.plate_id = 
- zn_cockpit_pilot_plate_device.deviceId = zn_sensor_gateway.id
- zn_sensor_gateway.id = zn_sensor.sensor_gateway_id

</span>