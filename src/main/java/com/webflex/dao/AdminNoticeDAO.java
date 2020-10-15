package com.webflex.dao;

import java.util.List;

import com.webflex.vo.HelpNoticeVO;

public interface AdminNoticeDAO {

	List<HelpNoticeVO> selectBoardList(HelpNoticeVO vo);

	void noticeInsert(HelpNoticeVO vo);
	
	int getListCount(HelpNoticeVO vo);

	HelpNoticeVO noticeContent(int notice_no);

	void editContent(HelpNoticeVO noticeVO);

	void deleteContent(int notice_no);

	List<HelpNoticeVO> search(String search);
}
