package com.webflex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.webflex.service.EmailService;
import com.webflex.service.WebflexUserService;

@RestController
public class CheckController {
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private WebflexUserService webflexUserService;
	
	//아이디 중복검사
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String checkSignup(HttpServletRequest request, Model model) { 
		String id = request.getParameter("id"); 
		int rowcount = emailService.checkSignup(id);
		return String.valueOf(rowcount); 
	}
	
	//닉네임 중복검사
	@RequestMapping(value = "/nick_check", method = RequestMethod.POST)
	public String checkNick(HttpServletRequest request, Model model) {
		String nick = request.getParameter("nick"); 
		int rowcount = emailService.checkNick(nick);
		return String.valueOf(rowcount);
	}
	
	//비밀번호 중복검사
	@RequestMapping(value ="/password_check", method = {RequestMethod.POST})
	public ResponseEntity<String> password_check(@RequestParam("password") String password, HttpSession session) {	
		ResponseEntity<String> check = null;	
		String id = (String)session.getAttribute("id");
		String check_pw = this.emailService.checkPassword(id);
		try {
			if(check_pw.trim().equals(password.trim())) {
				check = new ResponseEntity<String>("1",HttpStatus.OK);
			}else {
				check = new ResponseEntity<String>("0",HttpStatus.OK);
			}
		} catch (Exception e) {
			check = new ResponseEntity<String>("-1", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return check;
	}
	
	//이메일 보내기
	@RequestMapping(value = "/email_sender", method = {RequestMethod.POST})
	public ResponseEntity<String> email_sender(@RequestParam("email") String email,
			HttpSession session){
		ResponseEntity<String> check = null;
		
		String checkEmail = this.webflexUserService.findEmail(email);
		String key = "";
		if(checkEmail != null) {
			key = this.emailService.mailSendWithUserKey2(email);
			check = new ResponseEntity<String>(key,HttpStatus.OK);
			session.setAttribute("key", key);
		}else {
			check = new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		return check;
	}
	
	//인증번호 체크
	@RequestMapping(value = "/key_check", method = {RequestMethod.POST})
	public ResponseEntity<String> key_check(@RequestParam("key") String key, @RequestParam("id") String id
			,HttpSession session){
		ResponseEntity<String> result = null;
		String checkKey = (String)session.getAttribute("key");
		if(checkKey.trim().equals(key.trim())) {
			String pw = this.webflexUserService.getUserPw(id);
			result = new ResponseEntity<String>(pw,HttpStatus.OK);
			session.removeAttribute("key");
		}else {
			result = new ResponseEntity<String>("FAIL",HttpStatus.OK);
		}
		
		return result;
	}
	
	//비밀번호 검사
	@RequestMapping(value = "/pw_check", method = {RequestMethod.POST})
	public ResponseEntity<String> pw_check(@RequestParam("password") String password,HttpSession session){
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("id");
		String checkPw = this.webflexUserService.getUserPw(email);
		if(password.trim().equals(checkPw.trim())) {
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		}else {
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	

}










