select * from zn_pay_order zpo
-- where zpo.order_type = 7 and zpo.id = 1133031466750582784
order by zpo.create_time desc ;

select e.pay_status,e.* from ai_knowledge_workspace_recharge e order by e.create_time desc ;

select * from zn_pay_order_record zpor
where zpor.req_seqId = 1132730275688751104
order by zpor.create_time desc ;


select * from zn_pay_order_record zpor
where zpor.goods_desc = '知识库续费'
order by zpor.create_time desc ;


select * from zn_pay_order_record zpor
where zpor.goods_desc = '知识库续费'
order by zpor.create_time desc ;