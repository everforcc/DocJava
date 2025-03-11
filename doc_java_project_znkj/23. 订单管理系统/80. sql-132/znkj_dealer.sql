
select * from znkj_dealer e ;

SELECT u.user_id, u.dept_id, u.nick_name, u.user_name, u.email, u.avatar, u.phonenumber, u.sex, u.status, u.del_flag, u.login_ip, u.login_date, u.create_by, u.create_time, u.remark, d.dept_name, d.leader
FROM sys_user u LEFT JOIN sys_dept d ON u.dept_id = d.dept_id WHERE (u.del_flag = '0' AND u.user_name LIKE '%%1%') ORDER BY create_time DESC LIMIT 10;
select *
FROM sys_user u
where u.user_name LIKE '%%1%';


