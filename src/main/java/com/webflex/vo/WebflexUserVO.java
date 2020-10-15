package com.webflex.vo;

import java.sql.Date;

import lombok.Data;

//create table wf_user(
//		email varchar2(200),
//		password varchar2(80) not null,
//		name varchar2(20),
//		nick varchar2(50),
//		year int,
//		month int,
//		day int,
//		mop varchar2(50) default '미결제' constraint mop_check check(mop in('네이버페이','미결제')),
//		category1 varchar2(20),
//		category2 varchar2(20),
//		category3 varchar2(20),
//		payment number(5) default 0,
//		joindate date,
//		constraint wf_user_pk primary key (email, nick)
//	);

@Data
public class WebflexUserVO {
	private String email;
	private String password;
	private String name;
	private String nick;
	private int year;
	private int month;
	private int day;
	private String phone;
	private String category;
	private int payment;
	private String mop;
	private int pass_no;
	private String joindate;
	private Date paydate;
	private String authority;
	private int dmaccount;
}











