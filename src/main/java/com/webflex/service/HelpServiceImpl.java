package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.HelpDAO;
import com.webflex.vo.HelpNoticeVO;

@Service
public class HelpServiceImpl implements HelpService {

	@Autowired
	private HelpDAO helpDAO;

	@Override
	public int getListCount(HelpNoticeVO h) {
		return this.helpDAO.getListCount(h);
	}

	@Override
	public List<HelpNoticeVO> getGongjiList(HelpNoticeVO h) {
		return this.helpDAO.getGongjiList(h);
	}

	@Override
	public int getListCount(int notice_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void upHit(int n_no) {
		helpDAO.upHit(n_no);
		
	}

	//게시물 내용 가져오기
	@Override
	public HelpNoticeVO getCont(int n_no) {
		return this.helpDAO.getCont(n_no);
	}


	
}
