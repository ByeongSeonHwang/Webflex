package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.AdminBoardDAO;
import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.WfBoardVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{

	@Autowired
	private AdminBoardDAO adminBoardDAO;


	@Override
	public List<WfBoardVO> getBoardUser(WfBoardVO vo) {
		// TODO Auto-generated method stub
		return this.adminBoardDAO.getBoardUser(vo);
	}

	@Override
	public WfBoardVO boardUserContent(int board_no) {
		// TODO Auto-generated method stub
		return this.adminBoardDAO.boardUserContent(board_no);
	}

	@Override
	public void boardUserDelete(int board_no) {
		// TODO Auto-generated method stub
		this.adminBoardDAO.boardUserDelete(board_no);
	}


	@Override
	public int getListCount(WfBoardVO Wvo) {
		// TODO Auto-generated method stub
		return this.adminBoardDAO.getListCount(Wvo);
	}

	@Override
	public List<WfBoardVO> boardSearch(String search) {
		return this.adminBoardDAO.boardSearch(search);
	}




}
