package com.webflex.dao;

import java.util.List;

import com.webflex.vo.ChangeVO;
import com.webflex.vo.WfReplyVO;

public interface WfReplyDAO {

	void replyInsert(WfReplyVO reply);

	List<WfReplyVO> replyList(int bno);

	void replyDel(int bno);

	int replyCnt(int board_no);

	void onlyReplyDel(int rno);

	void replyEdit(WfReplyVO reply);

	void changeNick(ChangeVO change);


}
