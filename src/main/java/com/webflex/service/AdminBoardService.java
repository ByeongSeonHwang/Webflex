package com.webflex.service;

import java.util.List;

import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.WfBoardVO;


public interface AdminBoardService {

	
	void boardUserDelete(int board_no);

	List<WfBoardVO> getBoardUser(WfBoardVO vo);

	WfBoardVO boardUserContent(int board_no);


	int getListCount(WfBoardVO Wvo);

	List<WfBoardVO> boardSearch(String search);





}
