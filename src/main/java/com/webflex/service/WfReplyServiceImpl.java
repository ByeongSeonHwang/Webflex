package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.WfReplyDAO;
import com.webflex.vo.WfReplyVO;

@Service
public class WfReplyServiceImpl implements WfReplyService {

	@Autowired
	private WfReplyDAO wfReplyDao;

	@Override
	public void replyInsert(WfReplyVO reply) {
		this.wfReplyDao.replyInsert(reply);
	}

	@Override
	public List<WfReplyVO> replyList(int bno) {
		return this.wfReplyDao.replyList(bno);
	}

	@Override
	public void replyDel(int bno) {
		this.wfReplyDao.replyDel(bno);
	}

	@Override
	public int replyCnt(int board_no) {
		return this.wfReplyDao.replyCnt(board_no);
	}

	@Override
	public void onlyReplyDel(int rno) {
		this.wfReplyDao.onlyReplyDel(rno);
	}

	@Override
	public void replyEdit(WfReplyVO reply) {
		this.wfReplyDao.replyEdit(reply);
	}
	
}
