package com.webflex.dao;

import java.util.List;

import com.webflex.vo.WebflexUserVO;

public interface AdminUserDAO {
	List<WebflexUserVO> userList();


	int getListCount(WebflexUserVO vo);

	List<WebflexUserVO> search(String search);


	void updateUser(String email);


	void dmaccountUser(String email);

}
