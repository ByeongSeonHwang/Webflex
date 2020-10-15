package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.AdminNoticeDAO;
import com.webflex.vo.HelpNoticeVO;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService{

	@Autowired
	AdminNoticeDAO adminNoticeDAO;
	
	@Override
	public List<HelpNoticeVO> selectBoardList(HelpNoticeVO vo) {
		// TODO Auto-generated method stub
		return this.adminNoticeDAO.selectBoardList(vo);
	}

	@Override
	public void noticeInsert(HelpNoticeVO vo) {
		this.adminNoticeDAO.noticeInsert(vo);
		
	}

	@Override
	public HelpNoticeVO noticeContent(int notice_no) {
		// TODO Auto-generated method stub
		return this.adminNoticeDAO.noticeContent(notice_no);
	}

	@Override
	public void editContent(HelpNoticeVO noticeVO) {
		// TODO Auto-generated method stub
		this.adminNoticeDAO.editContent(noticeVO);
		
	}
	@Override
	public int getListCount(HelpNoticeVO vo) {
		// TODO Auto-generated method stub
		return this.adminNoticeDAO.getListCount(vo);
	}


	@Override
	public void deleteContent(int notice_no) {
		// TODO Auto-generated method stub
		this.adminNoticeDAO.deleteContent(notice_no);
		
	}

	@Override
	public List<HelpNoticeVO> search(String search) {
		return this.adminNoticeDAO.search(search);
	}

}
