package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.CommentUpdateVO;
import com.webflex.vo.WebflexUserVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession sqlSession; 
	
	//로그인 아이디 찾기
	@Override
	public String findID(String email) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("findID", email);
	}
	//비밀번호
	@Override
	public String findPW(String email) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("findPW",email);
	}
	
	
	//회원 가입 아이디 찾기
	@Override
	public String findId(String admin_id) {
		return this.sqlSession.selectOne("findId", admin_id);
	}
	//관리자 전체 목록 가져오기
	@Override
	public List<WebflexUserVO> adminList() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("adminList");
		
	}
	@Override
	public WebflexUserVO adminInfo(String email) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("adminInfo",email);
	}
	
	@Override
	public int chageMovie_title(String movie_title) {
		return this.sqlSession.selectOne("adminChage",movie_title);
		
	}
	@Override
	public void commentUpdate(CommentUpdateVO vo) {
		this.sqlSession.update("commentUpdate",vo);
		
	}

	
}
