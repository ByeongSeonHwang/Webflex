package com.webflex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webflex.service.WebflexUserService;
import com.webflex.service.WfReplyService;
import com.webflex.vo.WfReplyVO;

@RestController
@RequestMapping("/board")
public class ReplyController {

	@Autowired
	private WfReplyService wfReplyService;
	
	@Autowired
	private WebflexUserService wfUserService;
	
	//댓글달기
	@RequestMapping(value = "/replies", method = {RequestMethod.POST})
	public ResponseEntity<String> reply_insert(@RequestBody WfReplyVO reply, HttpSession session){
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("id");
		String nick = this.wfUserService.getNick(email);
		reply.setReply_writer(nick);
		reply.setEmail(email);
		try {
			this.wfReplyService.replyInsert(reply);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	//게시물 번호에 해당하는 댓글 목록
	@RequestMapping(value = "/all/{board_no}", method = {RequestMethod.GET})
	public ResponseEntity<List<WfReplyVO>> reply_list(@PathVariable("board_no") int bno){
		ResponseEntity<List<WfReplyVO>> entity = null;
		try {
			List<WfReplyVO> list = this.wfReplyService.replyList(bno);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	//게시물 삭제
	@RequestMapping(value = "/replies/del/{reply_no}", method = {RequestMethod.DELETE})
	public ResponseEntity<String> reply_del(@PathVariable("reply_no") int rno){
		ResponseEntity<String> entity = null;
		try {
			this.wfReplyService.onlyReplyDel(rno);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	//댓글 수정
	@RequestMapping(value = "/replies/edit", method = {RequestMethod.POST})
	public ResponseEntity<String> reply_edit(@RequestBody WfReplyVO reply){
		ResponseEntity<String> entity = null;
		try {
			this.wfReplyService.replyEdit(reply);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
