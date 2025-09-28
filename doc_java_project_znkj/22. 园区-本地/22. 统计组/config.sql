
select zaac.road_rules_json
from zn_ais_algorithms_config zaac ;

-- 同时提取 aId 和 bId
SELECT
    zaac.id,JSON_UNQUOTE(JSON_EXTRACT(rule_item, '$.aId')) AS aId,
    zaac.id,JSON_UNQUOTE(JSON_EXTRACT(rule_item, '$.bId')) AS bId
FROM zn_ais_algorithms_config zaac,
     JSON_TABLE(zaac.road_rules_json, '$[*]' COLUMNS (
         rule_item JSON PATH '$'
         )) AS rule_items;

-- 先提取所有 ID，再合并为一个字符串
SELECT
    GROUP_CONCAT(id_list.id SEPARATOR ',') AS all_ids
FROM (
         SELECT JSON_UNQUOTE(JSON_EXTRACT(rule_item, '$.aId')) AS id
         FROM zn_ais_algorithms_config zaac,
              JSON_TABLE(zaac.road_rules_json, '$[*]' COLUMNS (
                  rule_item JSON PATH '$'
                  )) AS rule_items
         UNION ALL
         SELECT JSON_UNQUOTE(JSON_EXTRACT(rule_item, '$.bId')) AS id
         FROM zn_ais_algorithms_config zaac,
              JSON_TABLE(zaac.road_rules_json, '$[*]' COLUMNS (
                  rule_item JSON PATH '$'
                  )) AS rule_items
     ) AS id_list
WHERE id_list.id IS NOT NULL;

