package com.webflex.service;

import java.util.List;

import com.webflex.vo.HelpNoticeVO;

public interface AdminNoticeService {
	List<HelpNoticeVO> selectBoardList(HelpNoticeVO vo);

	void noticeInsert(HelpNoticeVO vo);

	HelpNoticeVO noticeContent(int notice_no);

	void editContent(HelpNoticeVO noticeVO);

	int getListCount(HelpNoticeVO vo);

	void deleteContent(int notice_no);

	List<HelpNoticeVO> search(String search);

}
