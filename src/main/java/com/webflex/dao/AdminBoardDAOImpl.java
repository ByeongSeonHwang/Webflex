package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.HelpNoticeVO;
import com.webflex.vo.WfBoardVO;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WfBoardVO> getBoardUser(WfBoardVO vo) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("Ublist",vo);
	}

	@Override
	public WfBoardVO boardUserContent(int board_no) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("board", board_no);
	}

	@Override
	public void boardUserDelete(int board_no) {
		// TODO Auto-generated method stub
		this.sqlSession.delete("boardDelete",board_no);
	}


	@Override
	public int getListCount(WfBoardVO wvo) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("BoardlistCount", wvo);
	}

	@Override
	public List<WfBoardVO> boardSearch(String search) {
		return this.sqlSession.selectList("board_search", search);
	}




	
}
