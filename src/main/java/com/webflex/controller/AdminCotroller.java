package com.webflex.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webflex.service.AdminService;
import com.webflex.vo.WebflexUserVO;

@Controller
public class AdminCotroller {

	@Autowired
	AdminService adminService;

	// 로그인 체크
	@RequestMapping("/admin_login_ok")
	public String check_login_ok(String email, String password, RedirectAttributes rttr, HttpSession session) {

		String checkID = this.adminService.findID(email);
		String checkPW = this.adminService.findPW(email);
		System.out.println(checkID);
		System.out.println(checkPW);
		if (checkID != null) {
			if (checkPW.trim().equals(password)) {
				WebflexUserVO user = this.adminService.adminInfo(email);
				session.setAttribute("id", email);
				session.setAttribute("nick", user.getNick());
				session.setAttribute("authority", user.getAuthority());
				session.setAttribute("payment", user.getPayment());
				System.out.println(user.getAuthority());
			} else {
				rttr.addFlashAttribute("msg", "Inconsistent_pw");
				return "redirect:/admin_login";
			}
		} else {
			rttr.addFlashAttribute("msg", "login_failed");
			return "redirect:/admin_login";
		}
		return "redirect:/admin";
	}

	// 로그인 창
	@RequestMapping("/admin_login")
	public String check_login() {
		return "/admin/admin_login";
	}

	// 로그아웃
	@RequestMapping("admin_logout")
	public String amdin_logout(HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		session.invalidate();// 로그아웃

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('관리자 로그아웃이 되었습니다');");
		out.println("location = '/login'");
		out.println("</script>");
		return null;
	}



	// 메인
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminList(Model model, HttpSession session) {

		//로그인 된 내 정보 가져오기
		String email = (String)session.getAttribute("id");
		WebflexUserVO user = this.adminService.adminInfo(email);
		model.addAttribute("adminInfo", user);
		// 관리자 전체목록 가져오기
		List<WebflexUserVO> list = adminService.adminList();
		model.addAttribute("list", list);
		return "./admin/admin";

	}



}