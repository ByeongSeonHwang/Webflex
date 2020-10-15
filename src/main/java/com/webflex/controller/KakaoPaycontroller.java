package com.webflex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webflex.service.KakaoPay;
import com.webflex.service.PassService;
import com.webflex.service.WebflexUserService;
import com.webflex.vo.PassVO;
import com.webflex.vo.WebflexUserVO;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPaycontroller {
	
	 	@Setter(onMethod_ = @Autowired)
	    private KakaoPay kakaopay;
	 	@Autowired
	 	private WebflexUserService webflexUserService;
	 	@Autowired
	 	private PassService passService;
	 
	    
	    
//	    @GetMapping("/kakaoPay")
//	    public void kakaoPayGet() {
//	        
//	    }
//	    
//	    @PostMapping("/kakaoPay")
//	    public String kakaoPay() {
//	        log.info("kakaoPay post............................................");
//	        
//	        return "redirect:" + kakaopay.kakaoPayReady();
//	    }
	    
	 	//결제 성공시 이동되는 매핑주소 
	    @GetMapping("/kakaoPaySuccess")
	    public String kakaoPaySuccess(
	    		@RequestParam("pg_token") String pg_token, Model model, @RequestParam("pass_no") int pass_no, HttpSession session) {
	        log.info("kakaoPaySuccess get............................................");
	        log.info("kakaoPaySuccess pg_token : " + pg_token);
	        
	        String email = (String)session.getAttribute("id");
	        WebflexUserVO user = new WebflexUserVO();
	        user.setMop("카카오페이");
	        user.setPass_no(pass_no);
	        user.setEmail(email);
	        this.webflexUserService.updatePayment(user);
	        session.setAttribute("payment", this.webflexUserService.payCheck(email));
	        
	        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, pass_no));
	        return "./mypage/payOK";
	    }
	    
	    //결제창
	    @GetMapping("/payment")
	    public String paymentGet(HttpServletRequest request) {
	    	List<PassVO> pass = this.passService.passList();
	    	request.setAttribute("pass", pass);
	    	return "./mypage/payment";
	    }
	    
	    //결제 진행 매핑주소
	    @PostMapping("/payment_check")
	    	public String paymentPost(@RequestParam("pass_no") int pass_no) {
		        log.info("kakaoPay post............................................");
		        
		        return "redirect:" + kakaopay.kakaoPayReady(pass_no);
	    }
	    

}
