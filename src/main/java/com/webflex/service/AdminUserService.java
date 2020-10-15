package com.webflex.service;

import java.util.List;

import com.webflex.vo.WebflexUserVO;

public interface AdminUserService {
	


	List<WebflexUserVO> userList();



	int getListCount(WebflexUserVO vo);


	List<WebflexUserVO> search(String search);


	void updateUser(String email);



	void dmaccountUser(String email);


}
