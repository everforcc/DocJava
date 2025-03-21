-- all
select e.device_ids,e.* from zn_channel e
where e.channel_type = 1
order by e.create_time desc;
-- LW03AF140031
select e.device_ids,e.* from zn_channel e
where e.channel_type = 1 and e.zn_device_sn_var = 'LW03AF140031'
order by e.create_time desc;

SELECT * FROM zn_channel
WHERE zn_device_sn_var = 'LW03AF140031'
  AND channel_type = 1
  AND del_flag = 0
ORDER BY id DESC, create_time DESC LIMIT 2147483647;
