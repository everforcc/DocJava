UPDATE MT_USER T
SET up_flag=0,up_count=0,
    T.MOBILE = '15648527913',
    up_flag=1
WHERE T.ID = 1858711585212219394;

select e.MOBILE,E.up_flag,e.* from mt_user e
where e.ID = 1858711585212219394
order by e.id desc;