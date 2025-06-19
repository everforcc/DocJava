select * from zn_user zu where zu.id in (
select distinct zaes.process_id from zn_ais_event_send zaes );

-- 1920723148966715394
-- 1921151346309324801
select zaes.* from zn_ais_event_send zaes
where zaes.process_id in ( 1921151346309324801,1920723148966715394);