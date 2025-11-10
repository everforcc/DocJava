-- 待分账订单
select * from zn_pay_order_record e
where e.status = 1 and e.auth_type = 2
  and e.acct_split_info is not null
  and e.lkl_split_status is null ;

select * from zn_pay_order_record e
where e.status = 1 and e.auth_type = 2
  and e.acct_split_info is not null;
