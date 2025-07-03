<span  style="font-family: Simsun,serif; font-size: 17px; ">

[TOC]

- zn_device_metadata
- 测试数据

### 设备注册

~~~json
{
  "deviceType": "iotHumidnessTemperature",
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

- iotHumidnessTemperature
- ccdeviceId
- ccreport

znkj/zn_odt/device/report/iotHumidnessTemperature/ccdeviceId/ccreport
~~~

### 温度

~~~json
{
  "gw": {
    "gwid": "1E2259D76138A181",
    "gwpv": "1.1.0",
    "gwdv": "1.8.2-5382bfa5",
    "gwsq": 4,
    "gwifty": 0,
    "rxpk": [
      {
        "tmst": "137076166",
        "time": "1747215783",
        "chan": 0,
        "freq": 475500000,
        "foff": 3265,
        "rssi": -63,
        "lsnr": 10.5,
        "rfch": 0,
        "stat": 16,
        "modu": "LORA",
        "datr": "SF5",
        "codr": "4/5",
        "pksz": 18,
        "pkdt": "0330000809004234007B10040111052AA2D5",
        "ndty": 1
      }
    ]
  }
}
~~~

- 解析值
- 0330000809004234007B10040111052AA2D5
- 将上面的两个数字为一组，生成一个表格，表头是index

| index | value |
|-------|-------|
| 0     | 03    |
| 1     | 30    |
| 2     | 00    |
| 3     | 08    |
| 4     | 09    |
| 5     | 00    |
| 6     | 42    |
| 7     | 34    |
| 8     | 00    |
| 9     | 7B    |
| 10    | 10    |
| 11    | 04    |
| 12    | 01    |
| 13    | 11    |
| 14    | 05    |
| 15    | 2A    |
| 16    | A2    |
| 17    | D5    |

- 温度
- 12-13
- 0x0111 = 273
- 湿度
- 15
- 0x2A = 42

~~~
{"temperature":273,"humidness":42}
~~~

### 湿度

~~~
~~~

</span>