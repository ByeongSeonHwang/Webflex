package com.webflex.vo;

import lombok.Data;

/*
 * create table movie_comment(
movie_id int primary key,
sun varchar2(200),
dragon varchar2(200),
fire varchar2(200),
joy varchar2(200),
stone varchar2(200)
);
 */
@Data
public class CommentVO {
 private int movie_id;
 private String sun;
 private String dragon;
 private String joy;
 private String stone;
 private String fire;
 
 
 
}
