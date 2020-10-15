package com.webflex.service;

public interface EmailService {

	int checkSignup(String id);

	int checkNick(String nick);

	String checkPassword(String id);
	
	public String mailSendWithUserKey2(String email);

}
