package com.webflex.dao;

import java.util.List;

import com.webflex.vo.HelpNoticeVO;

public interface HelpDAO {

	int getListCount(HelpNoticeVO h);

	List<HelpNoticeVO> getGongjiList(HelpNoticeVO h);

	void upHit(int n_no);

	HelpNoticeVO getCont(int n_no);


}
