select *
from zn_rearm_group zrg
where zrg.switch_json IS NOT NULL
  AND JSON_CONTAINS(zrg.switch_json, '3');