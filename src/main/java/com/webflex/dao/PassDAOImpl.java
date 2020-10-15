package com.webflex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.webflex.vo.PassVO;

@Repository
public class PassDAOImpl implements PassDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public PassVO getPass(int pass_no) {
		return this.sqlSession.selectOne("pass_name",pass_no);
	}

	@Override
	public PassVO passInfo(int pass_no) {
		return this.sqlSession.selectOne("pass_info",pass_no);
	}

	@Override
	public List<PassVO> passList() {
		return this.sqlSession.selectList("pass_list");
	}
	
}
