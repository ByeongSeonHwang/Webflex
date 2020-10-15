package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.AdminUserDAO;
import com.webflex.vo.WebflexUserVO;

@Service
public class AdminUserServiceImpl implements AdminUserService{

	@Autowired
	AdminUserDAO adminUserDAO;
	

	@Override
	public List<WebflexUserVO> userList() {
		// TODO Auto-generated method stub
		return this.adminUserDAO.userList();
	}

	@Override
	public int getListCount(WebflexUserVO vo) {
		// TODO Auto-generated method stub
		return this.adminUserDAO.getListCount(vo);
	}

	@Override
	public List<WebflexUserVO> search(String search) {
		return this.adminUserDAO.search(search);
	}

	@Override
	public void updateUser(String email) {

		this.adminUserDAO.updateUser(email);
		
	}

	@Override
	public void dmaccountUser(String email) {
		this.adminUserDAO.dmaccountUser(email);
		
	}

}
