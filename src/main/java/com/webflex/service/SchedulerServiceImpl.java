package com.webflex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webflex.dao.SchedulerDAO;

@Service
public class SchedulerServiceImpl implements SchedulerService {

	@Autowired
	private SchedulerDAO schedulerDao;

	@Override
	public void paymentReset() {
		this.schedulerDao.paymentReset();
	}
	
}

