
-- 1. 单个字段

-- 2. 多个字段 in

SELECT * FROM cc_website e WHERE (e.`id`,e.`webroot`,e.`webname`) IN
(
(SELECT '1','https://www.baidu.com/','百度' FROM DUAL),
(SELECT '2','testdocker','网站名' FROM DUAL)
)
;

-- 3. in 多个 使用 or 拼接
-- 好像和2没啥区别,但是in不能超过1000，这样or可以超过
SELECT * FROM cc_website e WHERE
(e.`id`,e.`webroot`,e.`webname`) IN
((SELECT '1','https://www.baidu.com/','百度' FROM DUAL))
or
(e.`id`,e.`webroot`,e.`webname`) IN
((SELECT '100','https://www.pandavpnpro.com/zh-cn/','pandavpnpro' FROM DUAL)
);
