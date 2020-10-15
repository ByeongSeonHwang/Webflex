--댓글테이블 설계

-- 댓글 테이블 wf_reply
create table wf_reply(
 reply_no int primary key, -- 댓글번호
 board_no int references wf_board(board_no) on delete cascade, -- 게시판번호(외래키)
 email varchar2(200) references wf_user(email) on delete cascade, --수정시 필요한 이메일
 reply_writer varchar2(100) not null, -- 댓글 작성자
 reply_cont varchar2(4000) not null, -- 댓글 내용
 reply_date date -- 댓글 작성일
);

-- 댓글 번호 시퀀스
create sequence wf_reply_no
start with 1
increment by 1
nocache;

select * from wf_reply;

drop table wf_reply;
drop sequence wf_reply_no;