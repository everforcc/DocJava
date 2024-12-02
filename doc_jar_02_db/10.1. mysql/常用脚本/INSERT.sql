-- 1. 普通插入

-- insert into tbl(filed) select * from tbl2
INSERT INTO cc_websitedata(parentid)
SELECT e.id FROM cc_websitetag e WHERE e.id = '1';

-- 1.1 全插入
INSERT INTO `oneforall`.`cc_website`
( `id`, `webroot`, `webname`, `softtype`, `webtype`, `username`, `password`, `phone`, `email`, `cookie`, `safequestion`,
 `discription`, `vip`, `encrypt`, `createtime`, `updatetime`, `effect`, `status`)
VALUES
( 'id', 'webroot', 'webname', 'softtype', 'webtype', 'username', 'password', 'phone', 'email', 'cookie', 'safequestion',
 'discription', 'vip', 'encrypt', 'createtime', 'updatetime', 'effect', 'status');

-- 1.2 全插入,也可以不用 字段名
INSERT INTO `oneforall`.`cc_website` VALUES
( 'id', 'webroot', 'webname', 'softtype', 'webtype', 'username', 'password', 'phone', 'email', 'cookie', 'safequestion',
  'discription', 'vip', 'encrypt', 'createtime', 'updatetime', 'effect', 'status');


-- 2. 插入多条

INSERT INTO `oneforall`.`cc_website` VALUES
( 'id', 'webroot', 'webname', 'softtype', 'webtype', 'username', 'password', 'phone', 'email', 'cookie', 'safequestion',
  'discription', 'vip', 'encrypt', 'createtime', 'updatetime', 'effect', 'status'),
( 'id', 'webroot', 'webname', 'softtype', 'webtype', 'username', 'password', 'phone', 'email', 'cookie', 'safequestion',
  'discription', 'vip', 'encrypt', 'createtime', 'updatetime', 'effect', 'status')
;

-- 3. insert select * from

-- 3.1 单个
INSERT INTO `oneforall`.`cc_website` (`webroot`,`webname`)
SELECT '1','2' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cc_website e WHERE e.`id` = '3' )
-- 3.2 多个
-- 拼接太长的话，会有内存耗尽风险
INSERT INTO `oneforall`.`cc_website` (`webroot`,`webname`)
SELECT '1','2' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cc_website e WHERE e.`id` = '3' )
UNION
SELECT '1','2' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cc_website e WHERE e.`id` = '3' )
UNION
SELECT '3','4' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cc_website e WHERE e.`id` = '3' );

-- 4. not exists

INSERT INTO table2 (c1,c2,c3...)
select val1,val2,val3... from dual where not exists(select * from table2 where c1 = 'val1')
