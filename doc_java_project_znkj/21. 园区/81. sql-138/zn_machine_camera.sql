select e.create_time, e.update_time, e.id, e.up_flag, e.up_count, e.*
from zn_machine_camera e
where e.id in (1901623774063017986, 1902357442200915969)
  and e.zn_device_sn_var = 'ZL0123456788';