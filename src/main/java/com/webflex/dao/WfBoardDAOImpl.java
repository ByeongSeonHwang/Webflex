package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.ChangeVO;
import com.webflex.vo.WfBoardVO;

@Repository
public class WfBoardDAOImpl implements WfBoardDAO {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoard(WfBoardVO wfBoard) {
		this.sqlSession.insert("wf_board_insert", wfBoard);
	}

	@Override
	public List<WfBoardVO> boardList(WfBoardVO b) {
		return this.sqlSession.selectList("wf_board_list", b);
	}

	@Override
	public WfBoardVO board_find_no(int board_no) {
		return this.sqlSession.selectOne("findNo", board_no);
	}

	@Override
	public void boardEdit(WfBoardVO board) {
		this.sqlSession.update("boardEdit", board);
	}

	@Override
	public void board_del(int bno) {
		this.sqlSession.delete("boardDel",bno);
	}

	@Override
	public void noImgInsertBoard(WfBoardVO wfBoard) {
		this.sqlSession.insert("wf_board_noImgInsert",wfBoard);
	}

	@Override
	public void noImgEditBoard(WfBoardVO wfBoard) {
		this.sqlSession.update("wf_board_noImgEdit", wfBoard);
	}

	@Override
	public int getListCount(WfBoardVO b) {
		return this.sqlSession.selectOne("wf_board_count", b);
	}

	@Override
	public void upHit(int board_no) {
		this.sqlSession.update("board_hit_up", board_no);
	}

	@Override
	public void changeNick(ChangeVO change) {
		this.sqlSession.update("board_nick_change", change);
	}

}
