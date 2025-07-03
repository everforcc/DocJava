<span  style="font-family: Simsun,serif; font-size: 17px; ">

[TOC]

- zn_device_metadata
- 测试数据

### 设备注册

~~~json
{
  "deviceType": "iotCommon",
  "commands": "",
  "reports": "ccreport",
  "brandCode": "",
  "operateType": "mqtt",
  "deviceId": "ccdeviceId",
  "port": "",
  "ip": ""
}
~~~

~~~
- znkj/zn_odt/device/report/%s/%s/%s

- deviceType
- deviceId
- reports

- iotCommon
- ccdeviceId
- ccreport

znkj/zn_odt/device/report/iotCommon/ccdeviceId/ccreport
~~~

### 公共

- type
  - 设备类型
  - 1 遥控器
- textid
  - 3 报警
  - 1 布防

~~~json
{
  "did": 345347,
  "lang": 0,
  "name": "",
  "textid": 3,
  "time": "2025-05-09T21:25:35",
  "type": 1
}
~~~

</span>