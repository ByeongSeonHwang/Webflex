package com.webflex.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.webflex.dao.EmailDAO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private EmailDAO emailDao;
	@Autowired
	private JavaMailSender mailSender;
	
	private String init() {//랜덤 키 값 생성 메소드
	      Random ran = new Random();
	      StringBuffer sb = new StringBuffer();
	      int num = 0;

	      do {
	         num = ran.nextInt(75) + 48;
	         if ((num >= 48 && num <= 57)) {//영문 대소문자 숫자 범위
	            sb.append((char) num);//String 문자열 증가
	         } else {
	            continue;
	         }

	      } while (sb.length() < size);//StringBuffer길이 만큼만 반복
	      return sb.toString();
	   }

	   // user_key의 대소문자 구분 및 길이 조건
	   private int size;

	   public String getKey(int size) {
	      this.size = size;//길이
	      return init();
	   }

	@Override
	public int checkSignup(String id) {
		return this.emailDao.checkSignup(id);
	}

	@Override
	public int checkNick(String nick) {
		return this.emailDao.checkNick(nick);
	}

	@Override
	public String checkPassword(String id) {
		return this.emailDao.checkPassword(id);
	}

	@Override
	public String mailSendWithUserKey2(String email) {
		String key = getKey(8);//대소문자 구분 유무 및 길이 설정

		System.out.println(email);

		MimeMessage mail = mailSender.createMimeMessage(); 
		String htmlStr = "<h2>안녕하세요 WF : SpiderMan 입니다!</h2><br><br>" 
				+ "<h3>" + email + "님</h3>" + "<p>인증번호는  : " 
				+ key+"입니다. </p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";//이메일 본문 내용
		try {
			mail.setSubject("[본인인증] WF : WEBFLEX 인증메일입니다", "utf-8");//이메일 제목
			mail.setText(htmlStr, "utf-8", "html");//이메일 본문내용 및 설정
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);//이메일 보내기
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return key;
	}

}
