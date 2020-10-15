package com.webflex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SchedulerDAOImpl implements SchedulerDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void paymentReset() {
		this.sqlSession.update("paymentReset");
	}
	
}
