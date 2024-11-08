select e.REMARK,e.* from mt_order e
where e.ORDER_SN = '202411080952504848985';

select mo.REMARK,mo.* from mt_order mo
where mo.TYPE = 'recharge' and mo.PAY_TYPE = 'HUIFU';

select mb.DESCRIPTION,mb.* from mt_balance mb
    left join mt_order mo on mb.ORDER_SN = mo.ORDER_SN
where mo.TYPE = 'recharge' and mo.PAY_TYPE = 'HUIFU';