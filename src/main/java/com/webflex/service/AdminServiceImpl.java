package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.AdminDAO;
import com.webflex.vo.CommentUpdateVO;
import com.webflex.vo.WebflexUserVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public String findID(String email) {
		// TODO Auto-generated method stub
		return this.adminDAO.findID(email);
	}

	@Override
	public String findPW(String email) {
		// TODO Auto-generated method stub
		return this.adminDAO.findPW(email);
	}

	@Override
	public String findId(String admin_id) {
		// TODO Auto-generated method stub
		return this.adminDAO.findID(admin_id);
	}

	@Override
	public List<WebflexUserVO> adminList() {
		// TODO Auto-generated method stub
		return this.adminDAO.adminList();
	}

	@Override
	public WebflexUserVO adminInfo(String email) {
		// TODO Auto-generated method stub
		return this.adminDAO.adminInfo(email);
	}


	@Override
	public int chageMovie_title(String movie_title) {
		return this.adminDAO.chageMovie_title(movie_title);
		
	}

	@Override
	public void commentUpdate(CommentUpdateVO vo) {
		this.adminDAO.commentUpdate(vo);
		
	}






}
