SELECT id,
       minimum_purchase_quantity,
       product_name,
       product_status,
       up_status,
       category_id,
       category_name,
       series_id,
       series_name,
       kind_id,
       kind_name,
       product_img,
       product_price,
       product_size,
       product_weight,
       product_unit,
       up_time,
       stock_quantity,
       product_desc,
       product_config_json,
       record_json,
       type,
       prepayment,
       annual_fee,
       product_introduction,
       create_id,
       create_by,
       create_time,
       update_id,
       update_by,
       update_time,
       remark,
       del_flag
FROM znkj_product
WHERE del_flag = 0
  AND (type = 1)
ORDER BY create_time DESC
LIMIT 10;

select * from znkj_product ;