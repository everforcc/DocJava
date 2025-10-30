~~~
12:15:43.155 [http-nio-9201-exec-9] INFO  c.r.s.c.l.LKLResConfig - [preHandle,20] - path: /lkl/open/ec/apply
12:15:43.155 [http-nio-9201-exec-9] INFO  c.l.l.s.a.LklApiValidator - [validate,85] - RequestBody：{"ecApplyId":1034077126100475904,"ecName":"特约商户支付服务合作协议V4.1(20250116更新)+分账结算授权委托书","ecNo":"QY20251024450551809","ecStatus":"COMPLETED","orderNo":"4d0c92bf4c2d40ec844f8cea86bb4e24","orgId":986557,"version":"1.0"}
12:15:43.155 [http-nio-9201-exec-9] INFO  c.l.l.s.a.LklApiValidator - [validate,86] - Authorization：LKLAPI-SHA256withRSA timestamp="1761279342",nonce_str="BrwvYDAwNpQL",signature="YAlHXaIeNJ3vnUAKDaz9bz8tQZWIMvoyH0brhwAr+6OAQuQtthOoIWAO2w4kb3SehWDDLAfCEzTIf88ffidcJXcuhUQ5od6cLjaGNaUYpTP3MIMI1FIRo6scZgId4T/IXneF64TW/Q3uDUCxQQ5uUIbNHC9gvEu2DjAvy/XdVaZrOZCBcIMN+Ih9Zgec0KamwUibms0qW+dsJT1sTvl3yz9qB6qWyNF9K1B3mFlu2e/O27nT9Jb2mqC8BFtl7GAZr+M7gYaa2O9LH/YNKZvtBz2QERQUNMyH+yH5OwIX3NKTOLX1W/ur+ekLbeeKHpHn4xFRCVXoITY0Mj6aq/BJ+A=="
12:15:43.156 [http-nio-9201-exec-9] INFO  c.r.s.c.l.LKLResConfig - [messageHandle,31] - 验签成功,请求body: {"ecApplyId":1034077126100475904,"ecName":"特约商户支付服务合作协议V4.1(20250116更新)+分账结算授权委托书","ecNo":"QY20251024450551809","ecStatus":"COMPLETED","orderNo":"4d0c92bf4c2d40ec844f8cea86bb4e24","orgId":986557,"version":"1.0"}
12:15:43.161 [http-nio-9201-exec-9] INFO  c.r.s.c.l.ZnLKLOpenController - [ecApply,45] - 拉卡拉 响应结果：V3MmsOpenApiEcApplyCallbackResponse(version=1.0, orgId=986557, orderNo=4d0c92bf4c2d40ec844f8cea86bb4e24, ecApplyId=1034077126100475904, ecNo=QY20251024450551809, ecName=特约商户支付服务合作协议V4.1(20250116更新)+分账结算授权委托书, ecStatus=COMPLETED)
~~~

~~~json
{
  "ecApplyId": 1034077126100475904,
  "ecName": "特约商户支付服务合作协议V4.1(20250116更新)+分账结算授权委托书",
  "ecNo": "QY20251024450551809",
  "ecStatus": "COMPLETED",
  "orderNo": "4d0c92bf4c2d40ec844f8cea86bb4e24",
  "orgId": 986557,
  "version": "1.0"
}
~~~

### 进件结果
~~~
12:54:03.112 [http-nio-9201-exec-1] INFO  c.r.s.s.i.LKLServiceImpl - [merchantEncry,245] - 拉卡拉 新增商户进件响应结果：LKLCommonResponse(code=000000, msg=SUCCESS, respTime=null, respData={"merchant_no":"144162882","state":"1","status":"WAIT_AUDI"})
12:54:03.115 [http-nio-9201-exec-1] INFO  c.r.s.s.i.LKLServiceImpl - [merchantEncry,247] - 商户进件结果: V3TkbsMerchantEncryResponse(merchantNo=144162882, status=WAIT_AUDI, state=1)
~~~


