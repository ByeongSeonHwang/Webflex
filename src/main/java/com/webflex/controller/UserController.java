package com.webflex.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webflex.service.PassService;
import com.webflex.service.WebflexUserService;
import com.webflex.service.WfBoardService;
import com.webflex.service.WfReplyService;
import com.webflex.sts.NaverLoginBO;
import com.webflex.vo.ChangeVO;
import com.webflex.vo.PassVO;
import com.webflex.vo.WebflexUserVO;

@Controller
public class UserController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	private WfReplyService wfReplyService;
	@Autowired
	private WfBoardService wfBoardSerivce;
	@Autowired
	private WebflexUserService webflexUserService;
	@Autowired
	private PassService passService;
	//	@RequestMapping("join_ok_first")
	//	public String join_ok_first(@RequestParam("email") String email, Model m) {
	//		m.addAttribute("email", email);
	//		return "redirect:/join2";
	//	}

//-------------------------------------------------------------------------------------------------------------------------------------------------------	

	//회원가입
	@RequestMapping("/join2")
	public String join2(@ModelAttribute("result") String apiResult, RedirectAttributes rttr, Model m) throws IOException {
		JSONParser parser = new JSONParser();
		Object obj = null;
		try { 
			obj = parser.parse(apiResult); 
		} catch (ParseException e) { 
			e.printStackTrace(); 
		} 
		JSONObject jsonobj = (JSONObject) obj;
		JSONObject response = (JSONObject) jsonobj.get("response"); 
		String nName = (String) response.get("name"); 
		String nEmail = (String) response.get("email");
		String nBirthday = (String) response.get("birthday"); 
		String nPassword = (String) response.get("id");
		
		StringTokenizer token = new StringTokenizer(nBirthday, "-");
		String month = token.nextToken();
		String day = token.nextToken();
		
		m.addAttribute("name", nName);
		m.addAttribute("email", nEmail);
		m.addAttribute("password", nPassword);
		m.addAttribute("birthday", nBirthday);
		m.addAttribute("month", month);
		m.addAttribute("day", day);
		m.addAttribute("msg", "new_user");
		return "./webflex/join2";
	}

	//회원가입창(업그레이드)
	@RequestMapping("/ex_join")
	public String ex_join() {
		return "./webflex/ex_join";
	}

	//회원가입 완료
	@RequestMapping("/join_ok")
	public String join_ok(
			@ModelAttribute WebflexUserVO vo, HttpServletRequest request, RedirectAttributes rttr)
					throws IOException {
		String fEmail = this.webflexUserService.findEmail(vo.getEmail());
		int cNick = this.webflexUserService.nickCount(vo.getNick());
		if(vo.getName() != null) {	
			if(fEmail != null) {
				rttr.addFlashAttribute("msg", "overlap");
				return "redirect:/login";
			}else if(cNick >0){
				rttr.addFlashAttribute("msg", "nick_over");
				return "redirect:/login";
			}else {
				this.webflexUserService.addUser(vo);
				request.setAttribute("msg", "SUCCESS");
			}
		}else {
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/login";
		}
		return "./webflex/join_ok";
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------	
	
//-------------------------------------------------------------------------------------------------------------------------------------------------------	
	//카테고리 페이지
	@RequestMapping("/category_add")
	public String category() {
		return "./mypage/category";
	}
	
	//카테고리 수정, 추가
	@PostMapping("/category_commit")
	public String category_post(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		String email = (String)session.getAttribute("id");
		if(request.getParameterValues("category") != null) {
			String[] category = request.getParameterValues("category");
			StringBuilder sb = new StringBuilder(category.length);
			for(int k = 0; k <category.length; k++) {
				if(k < category.length - 1) {
					sb.append(category[k]+",");
				}else {
						sb.append(category[k]);
				}
			}
			String cate = sb.toString();
			WebflexUserVO user = new WebflexUserVO();
			user.setEmail(email);
			user.setCategory(cate);
			this.webflexUserService.categoryUpdate(user);
		}else {
			System.out.println("null값 넘어옴!");
		}	
		rttr.addFlashAttribute("msg", "category");
		return "redirect:/mypage";
	}
	
	@RequestMapping("/category_del")
	public String category_del(HttpSession session, RedirectAttributes rttr) {
		String email = (String)session.getAttribute("id");
		this.webflexUserService.categoryDel(email);
		rttr.addFlashAttribute("msg", "category");
		return "redirect:/mypage";
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	
	

//-------------------------------------------------------------------------------------------------------------------------------------------------------	
	//로그인
	@RequestMapping("/login")
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		//네이버 
		model.addAttribute("url", naverAuthUrl);
		/* 생성한 인증 URL을 View로 전달 */
		return "./webflex/login";
	}

	//로그인 로직
	@RequestMapping("/login_check")
	public String login_check(String email, String password,
			RedirectAttributes rttr, HttpSession session) {

		String checkEmail = this.webflexUserService.findEmail(email);
		String checkPassword = this.webflexUserService.getUserPw(email);

		if(checkEmail != null) {
			if(checkPassword.trim().equals(password)) {
				session.setAttribute("id", email);
				session.setAttribute("payment", this.webflexUserService.payCheck(email));
				session.setAttribute("nick", (String)this.webflexUserService.getNick(email));
				session.setAttribute("authority", (String)this.webflexUserService.getAuthority(email));
				session.setAttribute("tiket", this.webflexUserService.userInfo(email).getPass_no());
				session.setMaxInactiveInterval(-1);
			}else {
				rttr.addFlashAttribute("msg", "Inconsistent_pw");
				return "redirect:/login";
			}
		}else {
			rttr.addFlashAttribute("msg", "login_failed");	
			return "redirect:/login";
		}
		return "redirect:/main";
	}
	
	//네이버 로그인 로직
	@RequestMapping("/naver_login_check")
	public String naver_login_check(@ModelAttribute("email") String email, @ModelAttribute("password") String password,
			RedirectAttributes rttr, HttpSession session) {
		
		String checkEmail = this.webflexUserService.findEmail(email);
		String checkPassword = this.webflexUserService.getUserPw(email);
		
		if(checkEmail != null) {
			if(checkPassword.trim().equals(password)) {
				session.setAttribute("id", email);
				session.setAttribute("payment", this.webflexUserService.payCheck(email));
				session.setAttribute("nick", (String)this.webflexUserService.getNick(email));
				session.setAttribute("authority", (String)this.webflexUserService.getAuthority(email));
				session.setMaxInactiveInterval(-1);
			}else {
				rttr.addFlashAttribute("msg", "naver_pw");
				return "redirect:/login";
			}
		}else {
			rttr.addFlashAttribute("msg", "login_failed");	
			return "redirect:/login";
		}
		return "redirect:/main";
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------	

//-------------------------------------------------------------------------------------------------------------------------------------------------------	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("msg", "logout");
		return "redirect:/login";
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------	

//-------------------------------------------------------------------------------------------------------------------------------------------------------	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, HttpServletRequest request) {
		String email = (String)session.getAttribute("id");
		if(email != null) {
			WebflexUserVO user = this.webflexUserService.userInfo(email);
			PassVO pass = this.passService.passInfo(user.getPass_no());
			request.setAttribute("pass", pass);
			request.setAttribute("user", user);
			Date payDate = this.webflexUserService.getPayEndDate(email);
			request.setAttribute("paydate", payDate);
			System.out.println(payDate);
		}
		return "./mypage/mypage";
	}


	//비밀번호 변경 페이지
	@GetMapping("/password_edit")
	public String password_edit() {
		return "./mypage/password_edit";
	}

	//비밀번호 변경 완료
	@RequestMapping(value = "/password_edit_check")
	public String password_edit_check(
			HttpSession session,@RequestParam("new_password") String password,
			RedirectAttributes rttr,@RequestParam("password") String pw) {
		String id = (String)session.getAttribute("id");
		String checkPw = this.webflexUserService.getUserPw(id);
		if(checkPw.trim().equals(pw.trim())) {
			WebflexUserVO user = new WebflexUserVO();
			user.setPassword(password);
			user.setEmail(id);
			this.webflexUserService.passwordEdit(user);
			rttr.addFlashAttribute("msg", "password_edit");
			return "redirect:/mypage";	
		}else {
			rttr.addFlashAttribute("msg", "overlap");
			return "redirect:/password_edit";
		}
	}

	//닉네임 변경창
	@GetMapping("/nick_change")
	public String nick_change(HttpSession session, HttpServletRequest request) {
		String id = (String)session.getAttribute("id");
		WebflexUserVO user = this.webflexUserService.userInfo(id);
		String nick = user.getNick();
		request.setAttribute("nick", nick);
		return "./mypage/nick_change";
	}

	//닉네임 변경
	@ResponseBody
	@RequestMapping(value = "/nick_change_ok", method = {RequestMethod.POST})
	public ResponseEntity<String> nickChangeOk(@RequestParam("password") String password,
			@RequestParam("nick") String nick, HttpSession session){
		ResponseEntity<String> entity = null;
		
		String email = (String)session.getAttribute("id");
		String checkPw = this.webflexUserService.getUserPw(email);
		int nickCount = this.webflexUserService.nickCount(nick);
		
		ChangeVO change = new ChangeVO();
		
		change.setEmail(email);
		change.setNick(nick);
		
		if(nickCount > 0) {
			entity = new ResponseEntity<>("overlap", HttpStatus.OK);
		}else {
			if(checkPw.trim().equals(password.trim())) {
				this.webflexUserService.changeNick(change);
				entity = new ResponseEntity<>("OK",HttpStatus.OK);
				session.setAttribute("nick", this.webflexUserService.getNick(email));
			}else {
				entity = new ResponseEntity<>("FAIL",HttpStatus.OK);
			}
		}
		
		return entity;
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------	

//-------------------------------------------------------------------------------------------------------------------------------------------------------	
	//비밀번호 찾기
	@RequestMapping("/email_find")
	public String email() {
		return "./webflex/email";
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------	

	
	
	@RequestMapping("/success")
	public String success() {
		return "./mypage/success";
	}
	
	//회원탈퇴 뷰 페이지
	@RequestMapping("/sign_out")
	public String sign_out() {
		return "./mypage/sign_out";
	}

	//회원탈퇴
	@ResponseBody
	@RequestMapping("/sign_out_ok")
	public ResponseEntity<String> sign_out_ok(@RequestParam("password") String password, HttpSession session) {
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("id");
		String checkPw = this.webflexUserService.getUserPw(email);
		try {
			if(checkPw.trim().equals(password.trim())) {
				entity = new ResponseEntity<>("OK",HttpStatus.OK);
				this.webflexUserService.signOut(email);
			}else {
				entity = new ResponseEntity<>("FAIL",HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<>("ERROR",HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	


}






