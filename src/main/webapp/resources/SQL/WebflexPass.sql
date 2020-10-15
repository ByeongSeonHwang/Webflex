--이용권
create table wf_pass(
 pass_no number(38) primary key,
 pass_name char(50) unique,
 pass_price number(38) not null
);
select * from WF_PASS

delete from wf_pass;
drop table wf_pass;

insert into wf_pass values(100,'STANDARD',8900);
insert into wf_pass values(101,'PREMIUM',10900);

update wf_pass set pass_price = 12900 where pass_no = 101;