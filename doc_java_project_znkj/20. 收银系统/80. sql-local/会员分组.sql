
select * from mt_user_group e
where e.NAME = 'Å®Ê¿×é';
select * from mt_user_group e
where e.PARENT_ID = 1;

--
select t.GROUP_ID,t.* from mt_user t where t.STATUS != 'D'
and t.GROUP_ID IN (1,2,6,7);