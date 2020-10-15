package com.webflex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.webflex.service.AdminUserService;
import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.WebflexUserVO;

@Controller

public class AdminUserController {

	@Autowired
	AdminUserService adminUserService;
	
	//사용자 회원 정보
	@RequestMapping(value="/admin_user")
	public ModelAndView userList(@ModelAttribute WebflexUserVO vo, Model listM, HttpServletRequest request,HttpServletResponse response) {
		int listcount = this.adminUserService.getListCount(vo);
		//사용자 회원 정보 가져오기
		
		List<WebflexUserVO> ulist = adminUserService.userList();
		
		ModelAndView listH = new ModelAndView();
		listH.addObject("ulist",ulist);//board 키이름에 값 저장
        listH.addObject("listcount",listcount);
		listH.setViewName("./admin/admin_user");
	
		return listH;
		
		
	}

	// 사용자 휴면계정 변환
	@ResponseBody
	@RequestMapping("/user_update")
	public ResponseEntity<String> deleteUser(@RequestParam("email") String email) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			System.out.println("성공");
			this.adminUserService.updateUser(email);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("실패");
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//휴면계정 복구
	@ResponseBody
	@RequestMapping("/dmaccount_user")
	public ResponseEntity<String> dmAccount(@RequestParam("email") String email) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			System.out.println("성공");
			this.adminUserService.dmaccountUser(email);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("실패");
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//유저검색
	@RequestMapping("/admin_user_search")
	public ModelAndView notice_search(@RequestParam("search") String search) {
		ModelAndView mv = new ModelAndView();
		List<WebflexUserVO> user = this.adminUserService.search(search.trim());
		mv.addObject("ulist", user);
		mv.setViewName("./admin/admin_user");
		return mv;
	}
	
}
