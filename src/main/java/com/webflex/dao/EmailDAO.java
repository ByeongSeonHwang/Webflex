package com.webflex.dao;

public interface EmailDAO {

	int checkSignup(String id);

	int checkNick(String nick);

	String checkPassword(String id);

}
