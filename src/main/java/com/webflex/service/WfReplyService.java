package com.webflex.service;

import java.util.List;

import com.webflex.vo.WfReplyVO;

public interface WfReplyService {

	void replyInsert(WfReplyVO reply);

	List<WfReplyVO> replyList(int bno);

	void replyDel(int bno);

	int replyCnt(int board_no);

	void onlyReplyDel(int rno);

	void replyEdit(WfReplyVO reply);

}
