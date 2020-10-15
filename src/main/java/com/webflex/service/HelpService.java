package com.webflex.service;

import java.util.List;

import com.webflex.vo.HelpNoticeVO;

public interface HelpService {

	int getListCount(int notice_no);

	List<HelpNoticeVO> getGongjiList(HelpNoticeVO h);
	
	int getListCount(HelpNoticeVO h);
	
	//게시글 조회수 상승 메서드
	void upHit(int n_no);

	HelpNoticeVO getCont(int n_no);

}
