package com.webflex.vo;

import lombok.Data;

//--이용권
//create table wf_pass(
// pass_no number(38) primary key,
// pass_name char(50) unique,
// pass_price number(38) not null
//);

@Data
public class PassVO {

	private int pass_no;
	private String pass_name;
	private int pass_price;
	
}
