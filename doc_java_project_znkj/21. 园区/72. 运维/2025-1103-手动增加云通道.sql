
-- <data-source source="LOCAL" name="znkj-园区云端-https://prod-znyd.zgzhongnan.com" uuid="b4d9510d-669c-4872-921a-662b2bd8502d"><database-info product="MySQL" version="8.0.31" jdbc-version="4.2" driver-name="MySQL Connector/J" driver-version="mysql-connector-j-8.2.0 (Revision: 06a1f724497fd81c6a659131fda822c9e5085b6c)" dbms="MYSQL" exact-version="8.0.31" exact-driver-version="8.2"><extra-name-characters>#@</extra-name-characters><identifier-quote-string>`</identifier-quote-string></database-info><case-sensitivity plain-identifiers="lower" quoted-identifiers="lower"/><driver-ref>mysql.8</driver-ref><synchronize>true</synchronize><jdbc-driver>com.mysql.cj.jdbc.Driver</jdbc-driver><jdbc-url>jdbc:mysql://prod-znyd.zgzhongnan.com:3306</jdbc-url><secret-storage>master_key</secret-storage><user-name>root</user-name><schema-mapping><introspection-scope><node kind="schema"><name qname="@"/><name qname="smart_park"/></node></introspection-scope></schema-mapping><working-dir>$ProjectFileDir$</working-dir></data-source>

select count(*)
from zn_channel e
where e.zn_device_sn_var = 'Z101BA80AJ100002';

select distinct e.channel_type
from zn_channel e
where e.zn_device_sn_var = 'Z101BA80AJ100002';

select *
from zn_channel e
where e.zn_device_sn_var = 'Z101BA80AJ100002';

-- 时代御府
-- 时代御府 Z101BA80AJ100002
-- 高可·名门世家 Z101BA80AJ100001
-- 2,3,4,5,6,7,9
UPDATE smart_park.zn_channel
SET last_day = '2026-10-15 20:53:43'
WHERE zn_device_sn_var = 'Z101BA80AJ100001' and channel_type in (1,2,3,4,5,6,7,9);


