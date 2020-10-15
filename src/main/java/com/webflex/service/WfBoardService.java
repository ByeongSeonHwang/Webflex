package com.webflex.service;

import java.util.List;

import com.webflex.vo.WfBoardVO;

public interface WfBoardService {

	void insertBoard(WfBoardVO wfBoard);

	List<WfBoardVO> boardList(WfBoardVO b);

	WfBoardVO board_find_no(int board_no);

	void boardEdit(WfBoardVO board);

	void board_del(int bno);

	void noImgInsertBoard(WfBoardVO wfBoard);

	void noImgEditBoard(WfBoardVO wfBoard);

	int getListCount(WfBoardVO b);

	void upHit(int board_no);

}
