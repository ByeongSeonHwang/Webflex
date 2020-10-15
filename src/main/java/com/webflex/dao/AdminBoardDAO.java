package com.webflex.dao;

import java.util.List;

import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.WfBoardVO;

public interface AdminBoardDAO {


	List<WfBoardVO> getBoardUser(WfBoardVO vo);

	WfBoardVO boardUserContent(int board_no);

	void boardUserDelete(int board_no);


	int getListCount(WfBoardVO Wvo);

	List<WfBoardVO> boardSearch(String search);


}
