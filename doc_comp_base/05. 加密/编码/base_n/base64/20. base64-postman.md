<span  style="font-family: Simsun,serif; font-size: 17px; ">

### base64-postman

- 在postman中展示

### js

- 返回值

~~~json
{
  "code": 200,
  "msg": "data:image/jpg;base64,iVBOR"
}
~~~

- scripts

~~~js
// 将接口返回数据赋值处理
// var data = JSON.parse(responseBody);
var data = pm.response.json();
// html 模板字符
// 如果base64代码中已包含“data:image/jpg;base64,”，需要在base64代码前面加上，如下：
var template = `<html><img src="{{msg}}" /></html>`;

// 设置 visualizer 数据。传模板并解析对象。
pm.visualizer.set(template, data);
~~~

</span>