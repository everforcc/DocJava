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