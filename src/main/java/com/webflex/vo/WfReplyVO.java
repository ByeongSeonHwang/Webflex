package com.webflex.vo;
//-- 댓글 테이블 wf_reply
//create table wf_reply(
// reply_no int primary key, -- 댓글번호
// board_no int references wf_board(board_no), -- 게시판번호(외래키)
// reply_writer varchar2(100) not null, -- 댓글 작성자
// reply_pw varchar2(50) not null,
// reply_cont varchar2(4000) not null, -- 댓글 내용
// reply_date date -- 댓글 작성일
//);

import lombok.Data;

@Data
public class WfReplyVO {

	private int reply_no;
	private int board_no;
	private String email;
	private String reply_writer;
	private String reply_cont;
	private String reply_date;
	
}
