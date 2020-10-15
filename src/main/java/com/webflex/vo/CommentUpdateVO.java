package com.webflex.vo;

import lombok.Data;


public class CommentUpdateVO {
	private int movie_id;
	private String name;
	private String movie_comment;
	
	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMovie_comment() {
		return movie_comment;
	}

	public void setMovie_comment(String movie_comment) {
		this.movie_comment = movie_comment;
	}

	@Override
	public String toString() {
		return "CommentUpdateVO [movie_id=" + movie_id + ", name=" + name + ", movie_comment=" + movie_comment + "]";
	}
	
	
}
