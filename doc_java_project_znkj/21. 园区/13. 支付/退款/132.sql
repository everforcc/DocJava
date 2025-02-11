
--  ¶©µ¥ 192.168.1.132 ÍË¿î
select e.hf_seq_id,e.trans_amt,e.create_by,e.req_date,e.* from znkj_huifu_info e
where e.req_date = '20250209'
order by e.create_time desc;
