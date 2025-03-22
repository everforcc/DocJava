SELECT *
FROM zn_user
WHERE del_flag = 0
  AND (manager_flag = ? AND del_flag = ?)
ORDER BY update_time DESC;