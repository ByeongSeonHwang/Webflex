package com.webflex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webflex.service.AdminNoticeService;
import com.webflex.vo.HelpNoticeVO;

@Controller
public class AdminNoticeController {

	@Autowired
	AdminNoticeService adminNoticeService;
	
	//관리자 게시판
		@RequestMapping("/admin_board")
		public String admin_board() {
			return "./admin/admin_board";
		}
		//관리자 게시판 목록 보기
		@RequestMapping(value="/admin_board", method = RequestMethod.GET)
		public ModelAndView admin_board(@ModelAttribute HelpNoticeVO h,
				Model listM, HttpServletRequest request, HttpServletResponse response) throws Exception {
			int page=1;//쪽번호
			int limit=10;//한페이지에 보여지는 목록개수
			
			if(request.getParameter("page") != null) {
				//get으로 전달된 쪽번호가 있는 경우 실행=>board_list?page=쪽번호
				page=Integer.parseInt(request.getParameter("page"));//전달받은 페이지
				//번호(쪽번호)를 정수숫자로 바꿔서 저장시킴
			}
			int listcount = this.adminNoticeService.getListCount(h); //전체 레코드 개수
			
			h.setStartrow((page-1)*10+1);//시작행번호
			h.setEndrow(h.getStartrow()+limit-1);//끝행번호
			
			List<HelpNoticeVO> hlist = this.adminNoticeService.selectBoardList(h); //목록
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
	        listH.setViewName("./admin/admin_board");//뷰페이지 폴더
			
			
			return listH;
		}
		
		//관리자 공지사항 삽입
		
		   @RequestMapping("/admin_board_insert")
		   public String noticeInsert() {
		      return "./admin/admin_board_insert";
		   }

		   @RequestMapping("/admin_board_insert_ok")
		   public String noticeInsert(HelpNoticeVO vo,HttpSession session) {
			   String nick = (String)session.getAttribute("nick");
			   vo.setNotice_writer(nick);
		      this.adminNoticeService.noticeInsert(vo);
		      return "redirect:./admin_board";
		   }
		   
		   //공지사항 내용 보기
		   @RequestMapping("/admin_notice_view")
		   public String noticeContent(int notice_no, Model model) {
			   System.out.println(notice_no);
			   HelpNoticeVO vo = adminNoticeService.noticeContent(notice_no);
			   model.addAttribute("notice", vo);
			   return "./admin/admin_notice_view";
		   }
			
		   //공지사항 수정
		@RequestMapping("/admin_board_edit")
		public String editContent(HelpNoticeVO vo, Model model) {
			
			   HelpNoticeVO Nvo = adminNoticeService.noticeContent(vo.getNotice_no());
			   model.addAttribute("notice", Nvo);
			return "./admin/admin_board_edit";
		}
		//공지사항 수정완료
		@RequestMapping("/admin_board_edit_ok")
		public ModelAndView editContentOk(Model model, HelpNoticeVO noticeVO) {
		
			adminNoticeService.editContent(noticeVO);

			ModelAndView mv = new ModelAndView();
			
			mv.addObject("message", "완료");
			mv.setViewName("redirect:./admin_board");
					
			return mv;
		}
		//공지사항 삭제
		@RequestMapping("/admin_board_delete")
		public ModelAndView deleteContent(@RequestParam("notice_no") int notice_no) throws Exception{
			this.adminNoticeService.deleteContent(notice_no);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:./admin_board");
			return mv;
		}
		
		//공지사항 검색
		@RequestMapping("/admin_notice_search")
		public ModelAndView notice_search(@RequestParam("search") String search) {
			ModelAndView mv = new ModelAndView();
			List<HelpNoticeVO> notice = this.adminNoticeService.search(search.trim());
			mv.addObject("list", notice);
			mv.setViewName("./admin/admin_board");
			return mv;
		}

}
