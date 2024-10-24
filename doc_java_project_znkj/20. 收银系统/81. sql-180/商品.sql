-- 商品
SELECT e.LOGO, e.IMAGES, e.CREATE_TIME, e.*
FROM mt_goods e
ORDER BY e.CREATE_TIME DESC;

-- 商品
SELECT e.LOGO, e.IMAGES, e.CREATE_TIME, e.*
FROM mt_goods e
where e.TYPE = 'service'
ORDER BY e.CREATE_TIME DESC;
