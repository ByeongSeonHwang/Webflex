package com.webflex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.PassDAO;
import com.webflex.vo.PassVO;

@Service
public class PassServiceImpl implements PassService {

	@Autowired
	private PassDAO passDao;

	@Override
	public PassVO passInfo(int pass_no) {
		return this.passDao.passInfo(pass_no);
	}

	@Override
	public List<PassVO> passList() {
		return this.passDao.passList();
	}
	
}
