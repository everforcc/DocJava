-- 商品
SELECT e.LOGO, e.IMAGES, e.CREATE_TIME, e.*
FROM mt_goods e
ORDER BY e.CREATE_TIME DESC;

-- 商品
SELECT e.LOGO, e.IMAGES, e.CREATE_TIME, e.*
FROM mt_goods e
where e.TYPE = 'service'
ORDER BY e.CREATE_TIME DESC;

select * from mt_order e
where e.ORDER_SN = '202410281506557754072';

select e.PAY_TIME,e.* from mt_order e
order by e.CREATE_TIME desc;

select e.LOGO,e.IMAGES,e.CREATE_TIME,e.UPDATE_TIME,e.* from mt_goods e
order by e.UPDATE_TIME desc;

select * from t_action_log e
where e.ID = 2497;