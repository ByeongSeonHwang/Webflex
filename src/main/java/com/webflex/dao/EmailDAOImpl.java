package com.webflex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDAOImpl implements EmailDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int checkSignup(String id) {
		return this.sqlSession.selectOne("id_check",id);
	}

	@Override
	public int checkNick(String nick) {
		return this.sqlSession.selectOne("nick_check",nick);
	}

	@Override
	public String checkPassword(String id) {
		return this.sqlSession.selectOne("password_check",id);
	}
	
}
