package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.WebflexUserVO;

@Repository
public class AdminUserDAOImpl implements AdminUserDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<WebflexUserVO> userList() {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("userList");
	}


	@Override
	public int getListCount(WebflexUserVO vo) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("ulist", vo);
	}

	@Override
	public List<WebflexUserVO> search(String search) {
		return this.sqlSession.selectList("user_search", search);
	}

	@Override
	public void updateUser(String email) {
		this.sqlSession.update("updateUser", email);
		
	}


	@Override
	public void dmaccountUser(String email) {
		this.sqlSession.update("dmaccountUser",email);
		
	}
}
