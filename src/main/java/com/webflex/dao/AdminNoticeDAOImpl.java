package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.HelpNoticeVO;

@Repository
public class AdminNoticeDAOImpl implements AdminNoticeDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HelpNoticeVO> selectBoardList(HelpNoticeVO vo) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("blist",vo);
	}
	@Override
	public int getListCount(HelpNoticeVO vo) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("listCount", vo);
	}
	@Override
	public void noticeInsert(HelpNoticeVO vo) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("noticeList", vo);
		
	}

	@Override
	public HelpNoticeVO noticeContent(int notice_no) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("notice",notice_no);
	}

	@Override
	public void editContent(HelpNoticeVO noticeVO) {
		// TODO Auto-generated method stub
		this.sqlSession.update("noticeEdit",noticeVO);
	}
	

	@Override
	public void deleteContent(int notice_no) {
		// TODO Auto-generated method stub
		this.sqlSession.delete("contentDelete",notice_no);
	}
	@Override
	public List<HelpNoticeVO> search(String search) {
		return this.sqlSession.selectList("search_notice",search);
	}


}
