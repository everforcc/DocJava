<span  style="font-family: Simsun,serif; font-size: 17px; ">

### PublicAPPController

- 不同业务缓存可能会冲突

~~~
String code = sysSmsService.sendCode(phone.toString());
String code = sysSmsService.sendCode(phone.toString(), "test_");
~~~

</span>