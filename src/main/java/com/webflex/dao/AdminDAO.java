package com.webflex.dao;

import java.util.List;

import com.webflex.vo.CommentUpdateVO;
import com.webflex.vo.WebflexUserVO;

public interface AdminDAO {
	
	//로그인 아이디 찾기
	String findID(String email);

	String findPW(String email);
	
	//회원 가입 아이디 찾기
	String findId(String admin_id);

	List<WebflexUserVO> adminList();

	WebflexUserVO adminInfo(String email);

	int chageMovie_title(String movie_title);

	void commentUpdate(CommentUpdateVO vo);





}
