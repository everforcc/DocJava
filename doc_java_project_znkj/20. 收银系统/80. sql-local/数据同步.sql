select e.up_flag,e.* from mt_user e where e.up_flag = 2;

select e.up_flag,e.* from mt_user e where e.up_flag != 2;

select e.up_flag,e.up_count,e.* from mt_user e where e.up_flag = 0

and e.up_count<5;

select e.up_flag,e.* from mt_user e where e.up_flag is null;

update mt_user set up_flag = 0,del_flag = 0,up_count = 0
where  up_count is null; -- up_flag is null and
