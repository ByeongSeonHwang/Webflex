package com.webflex.dao;


import java.sql.Date;

import com.webflex.vo.ChangeVO;
import com.webflex.vo.WebflexUserVO;

public interface WebflexUserDAO {

	void addUser(WebflexUserVO vo);

	String findEmail(String email);

	String getUserPw(String email);

	int payCheck(String email);

	WebflexUserVO userInfo(String email);

	void updatePayment(WebflexUserVO user);

	void passwordEdit(WebflexUserVO user);

	String getNick(String email);

	void changeNick(ChangeVO change);

	int nickCount(String nick);

	void categoryUpdate(WebflexUserVO user);

	void categoryDel(String email);

	String getAuthority(String email);

	Date getPayEndDate(String email);

	void signOut(String email);

	String getCategory(String email);

}
