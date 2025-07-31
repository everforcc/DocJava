select * from zn_pay_order zpo
where zpo.id = 1147311306764853248;

-- corporationjob_mky
select * from sys_user su
where (su.remark like 'corporation_%' or su.remark like 'corporajob_%' ) and su.del_flag = 0;

select count(*) from sys_user su
where su.remark like 'corporation_%' ;

select count(*) from sys_user su
where su.remark like 'corporajob_%' ;

-- 重复数据问题
-- 1148352427666317312
-- 1148353882078978048
select zcd.order_id,count(1) from zn_coin_detail zcd
group by  zcd.order_id;
-- 除了id其他数值全一样
select * from zn_coin_detail zcd
where zcd.order_id in ( 1148388727010238464);

select * from zn_pay_order zpo
where zpo.id in ( 1148388727010238464);
