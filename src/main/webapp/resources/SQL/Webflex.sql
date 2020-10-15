-- Webflex.sql

create table wf_user(
	email varchar2(200) primary key,
	password varchar2(80) not null,
	name varchar2(50),
	nick varchar2(50) unique,
	year int,
	month int,
	day int,
	phone varchar2(30) not null,
	category varchar2(200),
	payment number(5) default 0,
	mop varchar2(50) default '미결제' constraint mop_check check(mop in('카카오페이','미결제')),
	pass_no number(38) references wf_pass(pass_no),
	joindate date,
	paydate date,
	authority varchar(20) default 'user' constraint aut_check check(authority in('user','admin')),
	DmAccount number(1) default 1
);

drop table wf_user

insert into wf_user(email,password,name,nick,phone,payment,joindate,authority)
values ('admin@webflex1.com','admin123','관리자','스파이더','0312272520',1,sysdate,'admin');



insert into wf_user(email,password,name,nick,phone,payment,joindate,authority)
values ('hbs0703@naver.com','gqt256254','황병선','황닉닉1','0312272520',1,sysdate,'user');



update wf_user set payment=1 where payment=101

update wf_user set dmaccount = 0 where email = 'hbs0706@naver.com';

select * from wf_user;
delete from wf_user cascade;
drop table wf_user;



























