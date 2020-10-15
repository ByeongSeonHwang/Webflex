package com.webflex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.webflex.service.HelpService;
import com.webflex.vo.HelpNoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private HelpService helpService;
	
	@RequestMapping("/help_notice")
	public ModelAndView help_notice(@ModelAttribute HelpNoticeVO h, Model listM, HttpServletRequest request,
			HttpServletResponse response) {

		
		int page=1;//쪽번호
		int limit=10;//한페이지에 보여지는 목록개수
		
		if(request.getParameter("page") != null) {
			//get으로 전달된 쪽번호가 있는 경우 실행=>board_list?page=쪽번호
			page=Integer.parseInt(request.getParameter("page"));//전달받은 페이지
			//번호(쪽번호)를 정수숫자로 바꿔서 저장시킴
		}
		int listcount = this.helpService.getListCount(h); //전체 레코드 개수
		
		h.setStartrow((page-1)*10+1);//시작행번호
		h.setEndrow(h.getStartrow()+limit-1);//끝행번호
		
		List<HelpNoticeVO> hlist = this.helpService.getGongjiList(h); //목록
		//총페이지수
		listM.addAttribute("hlist", hlist);
		listM.addAttribute("listcount", listcount);
		
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView listH = new ModelAndView();
		listH.addObject("hlist",hlist);//hlist 키이름에 값 저장
		listH.addObject("page",page);
		listH.addObject("startpage",startpage);
		listH.addObject("endpage",endpage);
		listH.addObject("maxpage",maxpage);
        listH.addObject("listcount",listcount);
        listH.setViewName("./help/help_notice");//뷰페이지 폴더
        
		return listH;
	}
	
	@RequestMapping("/help_notice_cont")
	public String help_notice_cont(@RequestParam("notice_no") int notice_no, HttpServletRequest request) {
		
		HelpNoticeVO notice = this.helpService.getCont(notice_no);
		request.setAttribute("notice", notice);
		
		helpService.upHit(notice_no);
		return "./help/help_notice_cont";
	}
	
	@RequestMapping("/help_FAQ")
	public String help_faq() {
		return "./help/help_FAQ";
	}
	
	@RequestMapping("/help_news")
	public String newsTest() {
		
		return "./help/help_news";
	}
	
	@RequestMapping("/help_news/news1")
	public String news1() {
		return "./help/help_news1";
	}
	
	@RequestMapping("/help_news/news2")
	public String news2() {
		return "./help/help_news2";
	}
	
	@RequestMapping("/help_news/news3")
	public String news3() {
		return "./help/help_news3";
	}
	
}
