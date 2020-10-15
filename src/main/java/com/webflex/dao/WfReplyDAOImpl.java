package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.ChangeVO;
import com.webflex.vo.WfReplyVO;

@Repository
public class WfReplyDAOImpl implements WfReplyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void replyInsert(WfReplyVO reply) {
		this.sqlSession.insert("reply_insert", reply);
	}
	//댓글입력

	@Override
	public List<WfReplyVO> replyList(int bno) {
		return this.sqlSession.selectList("reply_list", bno);
	}
	//댓글 목록

	@Override
	public void replyDel(int bno) {
		this.sqlSession.delete("reply_del", bno);
	}
	//댓글 삭제

	@Override
	public int replyCnt(int board_no) {
		return this.sqlSession.selectOne("reply_cnt", board_no);
	}

	@Override
	public void onlyReplyDel(int rno) {
		this.sqlSession.delete("only_reply_del",rno);
	}

	@Override
	public void replyEdit(WfReplyVO reply) {
		this.sqlSession.update("reply_edit", reply);
	}

	@Override
	public void changeNick(ChangeVO change) {
		this.sqlSession.update("reply_nick_change", change);
	}

}
