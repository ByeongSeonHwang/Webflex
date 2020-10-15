package com.webflex.dao;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.webflex.vo.ChangeVO;
import com.webflex.vo.WebflexUserVO;

@Repository
public class WebflexUserDAOImpl implements WebflexUserDAO {

	@Autowired
	private SqlSession sqlSession;

	//회원가입
	@Override
	public void addUser(WebflexUserVO vo) {
		this.sqlSession.insert("wf_user_join",vo);
	}

	//이메일찾기
	@Override
	public String findEmail(String email) {
		return this.sqlSession.selectOne("find_email",email);
	}

	//비밀번호 가져오기
	@Override
	public String getUserPw(String email) {
		return this.sqlSession.selectOne("find_pw",email);
	}

	//결제여부 검사
	@Override
	public int payCheck(String email) {
		return this.sqlSession.selectOne("pay_check",email);
	}

	//사용자 정보
	@Override
	public WebflexUserVO userInfo(String email) {
		return this.sqlSession.selectOne("user_info",email);
	}

	//결제 성공
	@Override
	public void updatePayment(WebflexUserVO user) {
		this.sqlSession.update("payment_update", user);
	}

	//비밀번호 변경
	@Override
	public void passwordEdit(WebflexUserVO user) {
		this.sqlSession.update("password_edit",user);
	}

	@Override
	public String getNick(String email) {
		return this.sqlSession.selectOne("get_nick",email);
	}

	@Override
	public void changeNick(ChangeVO change) {
		this.sqlSession.update("user_nick_change",change);
	}
	@Override
	public int nickCount(String nick) {
		return this.sqlSession.selectOne("nick_count", nick);
	}

	@Override
	public void categoryUpdate(WebflexUserVO user) {
		this.sqlSession.update("category_update",user);
	}

	@Override
	public void categoryDel(String email) {
		this.sqlSession.update("category_del", email);
	}

	@Override
	public String getAuthority(String email) {
		return this.sqlSession.selectOne("get_authority", email);
	}

	@Override
	public Date getPayEndDate(String email) {
		return this.sqlSession.selectOne("get_pay_end_date", email);
	}

	@Override
	public void signOut(String email) {
		this.sqlSession.delete("sign_out",email);
	}

	@Override
	public String getCategory(String email) {
		return this.sqlSession.selectOne("get_category",email);
	}
	
}
