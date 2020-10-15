package com.webflex.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.webflex.dao.WebflexUserDAO;
import com.webflex.dao.WfBoardDAO;
import com.webflex.dao.WfReplyDAO;
import com.webflex.vo.ChangeVO;
import com.webflex.vo.WebflexUserVO;

@Service
public class WebflexUserServiceImpl implements WebflexUserService {

	@Autowired
	private WebflexUserDAO webflexUserDao;
	@Autowired
	private WfReplyDAO wfReplyDao;
	@Autowired
	private WfBoardDAO wfBoardDao;

	@Override
	public void addUser(WebflexUserVO vo) {
		this.webflexUserDao.addUser(vo);
	}

	@Override
	public String findEmail(String email) {
		return this.webflexUserDao.findEmail(email);
	}

	@Override
	public String getUserPw(String email) {
		return this.webflexUserDao.getUserPw(email);
	}

	@Override
	public int payCheck(String email) {
		return this.webflexUserDao.payCheck(email);
	}

	@Override
	public WebflexUserVO userInfo(String email) {
		return this.webflexUserDao.userInfo(email);
	}

	@Override
	public void updatePayment(WebflexUserVO user) {
		this.webflexUserDao.updatePayment(user);
	}

	@Override
	public void passwordEdit(WebflexUserVO user) {
		this.webflexUserDao.passwordEdit(user);
	}

	@Override
	public String getNick(String email) {
		return this.webflexUserDao.getNick(email);
	}
	
	@Transactional
	@Override
	public void changeNick(ChangeVO change) {
		this.webflexUserDao.changeNick(change);
		this.wfBoardDao.changeNick(change);
		this.wfReplyDao.changeNick(change);
	}

	@Override
	public int nickCount(String nick) {
		return this.webflexUserDao.nickCount(nick);
	}

	@Override
	public void categoryUpdate(WebflexUserVO user) {
		this.webflexUserDao.categoryUpdate(user);
	}

	@Override
	public void categoryDel(String email) {
		this.webflexUserDao.categoryDel(email);
	}

	@Override
	public String getAuthority(String email) {
		return this.webflexUserDao.getAuthority(email);
	}

	@Override
	public Date getPayEndDate(String email) {
		return this.webflexUserDao.getPayEndDate(email);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void signOut(String email) {
		this.webflexUserDao.signOut(email);
	}

	@Override
	public String getCategory(String email) {
		return this.webflexUserDao.getCategory(email);
	}
	
}












