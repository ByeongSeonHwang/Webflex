--寃뚯떆�뙋
create table wf_board(
 board_no number(38) primary key,
 email varchar2(200) references wf_user(email) on delete cascade,
 board_title varchar2(100) not null,
 board_writer varchar2(50) not null,
 board_cont varchar2(4000) not null,
 board_path varchar2(200), 
 board_hit number(38) default 0,
 board_date date
);

--寃뚯떆�뙋 踰덊샇
create sequence board_no_seq
start with 1
increment by 1
nocache;


