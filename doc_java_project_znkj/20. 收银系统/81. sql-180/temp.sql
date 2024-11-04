select e.merchant_id,e.store_id,e.acct_id,e.* from t_account e
where e.account_name = 'admin';
#
update t_account set merchant_id = 0,store_id = 0
where acct_id = 2;

SELECT e.status,e.* FROM `t_source` e
where e.source_name = '生成代码';

SELECT e.status,e.* FROM `t_source` e
where e.source_id = 188;

SELECT distinct e.merchant_id FROM `t_source` e
where e.source_id = 188;

update t_source set status = 'D'
where source_id = 187;


select * from t_account e;

select * from mt_merchant e;

select e.status,e.* from t_source e
where e.source_name like '%积分%';

-- 账号关联职工信息
select e.staff_id, e.* from t_account e
where e.acct_id = 14;

-- 不在账号下关联的员工
select e.* from t_account e
where e.account_status != -1 and e.staff_id != 0;

-- todo 新增的时候查询这个
select  * from  mt_staff ms
where ms.AUDITED_STATUS = 'A' and ms.STORE_ID = 0 and ms.MERCHANT_ID = 0
  and ms.id not in (
    select e.staff_id from t_account e
    where (e.account_status != -1 and e.staff_id != 0)
    ) or ms.ID = (select staff_id from t_account ta where ta.acct_id = 13999);
-- todo 查看的时候也要这个，查询自己和未添加的

select * from t_duty e where e.duty_name = '测试删除';
select *
from t_account_duty ad
    left join t_duty d on d.DUTY_ID = ad.DUTY_ID
where ad.DUTY_ID = 18 and d.status = 'A';

select *
from t_account_duty ad
where ad.duty_id = 18;

select * from t_account_duty where acct_id = 147;

select e.* from t_account e;

select * from t_account_duty ad left join t_duty d on d.DUTY_ID = ad.DUTY_ID
where ad.DUTY_ID = 21 and d.status = 'A';

select * from  mt_coupon_goods e
where e.COUPON_ID = 13 ;

select * from mt_coupon_goods e
where e.GOODS_ID = 681;

select * from mt_coupon_goods e
where e.COUPON_ID = 29;


select * from mt_staff e
where e.id in (34,35,36,37,38);

SELECT *
FROM mt_staff WHERE audited_status <> 'D' ORDER BY ID DESC LIMIT 10;


select * from mt_merchant e
where e.STATUS = 'A';

select * from mt_merchant t where t.STATUS = 'A' order by t.UPDATE_TIME desc limit 1 ;

select * from mt_user e
where e.MOBILE = 15136126776;

select * from mt_user t where t.MOBILE LIKE concat('%',15136126776,'%') AND t.status != 'D' AND t.MERCHANT_ID = 1;

select * from mt_coupon e
where e.STATUS = 'A' ;

select * from mt_store t
where t.STATUS = 'A' order by t.UPDATE_TIME desc limit 1;

select e.SPEC_IDS,e.* from mt_goods_sku e
where e.SKU_NO like '124247097326183%';
-- 124247097326183
-- 964-967
select * from mt_goods_spec e
where e.ID in (964, 967);

select ee.STATUS,ee.* from mt_user ee
where ee.MOBILE = '18424545445';

select ee.STATUS,ee.* from mt_user ee
where ee.NAME in ('赵雨', '8279535869038');
