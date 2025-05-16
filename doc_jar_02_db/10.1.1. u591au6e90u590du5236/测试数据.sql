-- test_sync
select count(*) from test_sync;


select * from test_sync
order by id desc
where id >= 1000 and id <2000
;
