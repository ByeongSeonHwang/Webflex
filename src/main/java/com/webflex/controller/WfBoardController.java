package com.webflex.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webflex.service.WebflexUserService;
import com.webflex.service.WfBoardService;
import com.webflex.service.WfReplyService;
import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.WfBoardVO;
import com.webflex.vo.WfReplyVO;

@Controller
public class WfBoardController {

	@Autowired
	private WfBoardService wfBoardService;
	
	@Autowired
	private WfReplyService wfReplySerivce;
	
	@Autowired
	private WebflexUserService wfUserSerivce;

	@RequestMapping("/board_write")
	public String boardView() {
		return "./help/board_write";
	}


	@ResponseBody
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	public Object uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		Map<String, Object> object = new HashMap<String, Object>();

		String fileRoot = "C:\\upload\\";   //저장될 외부 파일 경로

		String originalFileName = multipartFile.getOriginalFilename();   //오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));   //파일 확장자
		String savedFileName = UUID.randomUUID() + extension;   //저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);   

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);   //파일 저장
			System.out.println("파일 저장 성공");
			/*
			 * object.put("url",fileRoot); object.put("fileName", savedFileName);
			 */
			object.put("url","/summernoteImage/"+savedFileName);
			System.out.println("등록 성공");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);   //저장된 파일 삭제
			object.put("responseCode", "error");
			e.printStackTrace();
			System.out.println("에러발생");
		}
		return object;
	}

	@RequestMapping(value = "/board_insert", method = {RequestMethod.POST})
	public String board_insert(@RequestBody WfBoardVO wfBoard, HttpSession session) {
		String email = (String) session.getAttribute("id");
		String writer = this.wfUserSerivce.getNick(email);
		wfBoard.setBoard_writer(writer);
		wfBoard.setEmail(email);
		if(wfBoard.getBoard_path() == null) {
			this.wfBoardService.noImgInsertBoard(wfBoard);
		}else {
			this.wfBoardService.insertBoard(wfBoard);
		}
		return "redirect:/board_list";
	}


	//게시판 목록
	@RequestMapping("/board_list")
	public ModelAndView board_list(@ModelAttribute WfBoardVO b,
			Model listM, HttpServletRequest request, HttpServletResponse response) {
		int page=1;//쪽번호
		int limit=10;//한페이지에 보여지는 목록개수
		
		if(request.getParameter("page") != null) {
			//get으로 전달된 쪽번호가 있는 경우 실행=>board_list?page=쪽번호
			page=Integer.parseInt(request.getParameter("page"));//전달받은 페이지
			//번호(쪽번호)를 정수숫자로 바꿔서 저장시킴
		}
		int listcount = this.wfBoardService.getListCount(b); //전체 레코드 개수
		
		b.setStartrow((page-1)*10+1);//시작행번호
		b.setEndrow(b.getStartrow()+limit-1);//끝행번호
		
		List<WfBoardVO> hlist = this.wfBoardService.boardList(b); //목록
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
        listH.setViewName("./help/board_list");//뷰페이지 폴더
		return listH;
	}

	//게시판 내용
	@RequestMapping("/board_cont")
	public ModelAndView board_cont(@RequestParam("board_no") int board_no) {
		ModelAndView cm = new ModelAndView();
		WfBoardVO board = this.wfBoardService.board_find_no(board_no);
		int replyCnt = this.wfReplySerivce.replyCnt(board_no);
		this.wfBoardService.upHit(board_no);
		List<WfReplyVO> reply = this.wfReplySerivce.replyList(board_no);
		cm.addObject("reply_cnt", replyCnt);
		cm.addObject("board", board);
		cm.addObject("reply", reply);
		cm.setViewName("./help/board_cont");	
		return cm;
	}

	//게시판 수정폼
	@RequestMapping("/board_edit")
	public ModelAndView board_edit(@RequestParam("board_no") int board_no) {
		ModelAndView cm = new ModelAndView();
		WfBoardVO board = this.wfBoardService.board_find_no(board_no);
		cm.addObject("board", board);
		cm.setViewName("./help/board_edit");	
		return cm;
	}

	//게시판 수정
	@RequestMapping("/board_edit_ok")
	public ModelAndView board_edit_ok(@RequestBody WfBoardVO wfBoard,HttpSession session) {
		ModelAndView cm = new ModelAndView("redirect:/board_cont?board_no="+wfBoard.getBoard_no());
		wfBoard.setBoard_writer((String)session.getAttribute("nick"));
		if(wfBoard.getBoard_path() == null) {
			this.wfBoardService.noImgEditBoard(wfBoard);
		}else {
			this.wfBoardService.boardEdit(wfBoard);
		}
		return cm;
	}
	
	//게시판 삭제
	@RequestMapping("/board_del")
	public ModelAndView board_del(@RequestParam("board_no") int bno) {
		ModelAndView cm = new ModelAndView();
		this.wfBoardService.board_del(bno);
		cm.setViewName("redirect:/board_list");
		return cm;
	}


















}
