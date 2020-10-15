package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.webflex.dao.WfBoardDAO;
import com.webflex.dao.WfReplyDAO;
import com.webflex.vo.WfBoardVO;

@Service
public class WfBoardServiceImpl implements WfBoardService {
	
	@Autowired
	private WfBoardDAO wfBoardDao;
	
	@Autowired 
	private WfReplyDAO WfReplyDao;

	@Override
	public void insertBoard(WfBoardVO wfBoard) {
		this.wfBoardDao.insertBoard(wfBoard);
	}

	@Override
	public List<WfBoardVO> boardList(WfBoardVO b) {
		return this.wfBoardDao.boardList(b);
	}

	@Override
	public WfBoardVO board_find_no(int board_no) {
		return wfBoardDao.board_find_no(board_no);
	}

	@Override
	public void boardEdit(WfBoardVO board) {
		this.wfBoardDao.boardEdit(board);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void board_del(int bno) {
		this.WfReplyDao.replyDel(bno);
		this.wfBoardDao.board_del(bno);
	}

	@Override
	public void noImgInsertBoard(WfBoardVO wfBoard) {
		this.wfBoardDao.noImgInsertBoard(wfBoard);
	}

	@Override
	public void noImgEditBoard(WfBoardVO wfBoard) {
		this.wfBoardDao.noImgEditBoard(wfBoard);
	}

	@Override
	public int getListCount(WfBoardVO b) {
		return this.wfBoardDao.getListCount(b);
	}

	@Override
	public void upHit(int board_no) {
		this.wfBoardDao.upHit(board_no);
	}

}
