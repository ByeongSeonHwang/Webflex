package com.webflex.service;

import java.util.List;

import com.webflex.vo.CommentUpdateVO;
import com.webflex.vo.WebflexUserVO;

public interface AdminService {

	String findID(String email);

	String findPW(String email);

	String findId(String admin_id);

	List<WebflexUserVO> adminList();

	WebflexUserVO adminInfo(String email);


	int chageMovie_title(String movie_title);

	void commentUpdate(CommentUpdateVO vo);







}
