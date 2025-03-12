select * from znkj_applicant e where e.mobile = '15738573601';
select * from znkj_dealer e where e.mobile = '15738573601';

select * from znkj_applicant e
where e.location_code = '130300';
select * from znkj_dealer e
where e.location_code = '130300';


DELETE from znkj_applicant e where e.mobile = '15738573602';
DELETE from znkj_dealer e where e.mobile = '15738573602';

update znkj_applicant set mobile = '15738573602' where mobile = '15738573601';
update znkj_dealer set mobile = '15738573602' where mobile = '15738573601';


-- 17347342250
select * from znkj_dealer e where e.mobile = '17347342250';

select e.bank_num,e.* from znkj_dealer e where e.mobile = '17665222565';

select e.bank_num,e.* from znkj_dealer e where e.location_code = '411502';
