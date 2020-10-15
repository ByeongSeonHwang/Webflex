package com.webflex.vo;

import lombok.Data;

//create table wf_board(
//		 board_no number(38) primary key,
//		 board_title varchar2(100) not null,
//		 board_writer varchar2(50) not null,
//		 board_cont varchar2(4000) not null,
//		 board_path varchar2(200), 
//		 board_hit number(38),
//		 board_date date
//		);
@Data
public class WfBoardVO {
	private int board_no;
	private String email;
	private String board_title;
	private String board_writer;
	private String board_cont;
	private String board_path;
	private int board_hit;
	private String board_date;
	
	private int startrow;//시작행 번호
	private int endrow;//끝행번호
}
