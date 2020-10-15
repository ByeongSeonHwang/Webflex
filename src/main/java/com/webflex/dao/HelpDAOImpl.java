package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.HelpNoticeVO;

@Repository
public class HelpDAOImpl implements HelpDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(HelpNoticeVO h) {
		return this.sqlSession.selectOne("notice_count", h);
	}

	@Override
	public List<HelpNoticeVO> getGongjiList(HelpNoticeVO h) {
		return this.sqlSession.selectList("notice_list", h);
	}

	@Override
	public void upHit(int n_no) {
		this.sqlSession.update("upHit",n_no);
		
	}

	@Override
	public HelpNoticeVO getCont(int n_no) {
		return this.sqlSession.selectOne("notice_cont",n_no);
	}
	
	
	
}
