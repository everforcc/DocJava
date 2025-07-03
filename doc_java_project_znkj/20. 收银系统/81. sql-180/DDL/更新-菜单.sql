-- 桌码管理
update t_source set status = 'D'
where source_id = 193;

-- 积分管理
update t_source set status = 'D'
where source_id = 104;
update t_source set status = 'D'
where parent_id = 104;

-- 生成代码
update t_source set status = 'D'
where source_id = 187;


update t_account set merchant_id = 0,store_id = 0
where acct_id = 2;

-- 收银菜单
select * from t_source e
where e.source_name like '%收银%' ;
select e.status,e.* from t_source e
where e.source_id = 125;
select e.status,e.* from t_source e
where e.parent_id = 125;

update t_source e set e.status = 'D'
where e.parent_id = 125;
update t_source e set e.source_name = '收银台'
where e.source_id = 125;