package com.webflex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webflex.service.AdminBoardService;
import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.WfBoardVO;

@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService adminBoardService;
		
	//사용자 게시판 목록
	@RequestMapping("/admin_board_user")
	public ModelAndView boardUser(@ModelAttribute WfBoardVO Wvo,
			Model listM, HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		int page=1;//쪽번호
		int limit=10;//한페이지에 보여지는 목록개수
		
		if(request.getParameter("page") != null) {
			//get으로 전달된 쪽번호가 있는 경우 실행=>board_list?page=쪽번호
			page=Integer.parseInt(request.getParameter("page"));//전달받은 페이지
			//번호(쪽번호)를 정수숫자로 바꿔서 저장시킴
		}
		int listcount = this.adminBoardService.getListCount(Wvo); //전체 레코드 개수
		
		Wvo.setStartrow((page-1)*10+1);//시작행번호
		Wvo.setEndrow(Wvo.getStartrow()+limit-1);//끝행번호
		
		List<WfBoardVO> hlist = this.adminBoardService.getBoardUser(Wvo); //목록
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
		listH.addObject("list",hlist);//board 키이름에 값 저장
		listH.addObject("page",page);
		listH.addObject("startpage",startpage);
		listH.addObject("endpage",endpage);
		listH.addObject("maxpage",maxpage);
        listH.addObject("listcount",listcount);
        listH.setViewName("./admin/admin_board_user");//뷰페이지 폴더
		
		
		return listH;
	}
	//사용자 게시판 내용
	@RequestMapping("/admin_board_user_view")
	 public String boardUserCont(int board_no, Model model) {

		   WfBoardVO bvo = adminBoardService.boardUserContent(board_no);
		   model.addAttribute("board", bvo);
		   return "./admin/admin_board_user_view";
	   }
	//사용자 게시판 삭제
	@RequestMapping("/admin_board_user_delete")
	public ModelAndView boardUserDelete(@RequestParam("board_no") int board_no) throws Exception{
		this.adminBoardService.boardUserDelete(board_no);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:./admin_board_user");
		return mv;
	}
	
	//게시판 검색
	@RequestMapping("/admin_board_search")
	public ModelAndView board_search(@RequestParam("search") String search) {
		ModelAndView mv = new ModelAndView("./admin/admin_board_user");
		List<WfBoardVO> list = this.adminBoardService.boardSearch(search.trim());
		mv.addObject("list", list);
		return mv;
	}

}
