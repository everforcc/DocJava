-- 10000
SELECT * FROM `znkj_huifu_refund` e ;

SELECT * FROM `znkj_huifu_refund` e
WHERE e.`hf_seq_id` = '002900TOP3A250120193450P211ac13624600000'
;
-- 19
-- 10
-- 29
SELECT COUNT(*) FROM `znkj_huifu_refund` e
WHERE e.`bank_code` = '10000' AND e.`type`  = '¶©µ¥' ORDER BY e.`hf_seq_id` ;

SELECT * FROM `znkj_huifu_refund` e
WHERE e.`bank_code` = '10000' AND e.type != '¶©µ¥' ORDER BY e.`hf_seq_id` ;

-- GROUP_CONCAT(DISTINCT e.dict_name ORDER BY e.`dict_id` DESC SEPARATOR'\n\n')
SELECT GROUP_CONCAT(DISTINCT e.`hf_seq_id` SEPARATOR'\',\'') FROM `znkj_huifu_refund` e
WHERE e.`bank_code` = '10000' AND e.type != '¶©µ¥' ORDER BY e.`hf_seq_id` ;
