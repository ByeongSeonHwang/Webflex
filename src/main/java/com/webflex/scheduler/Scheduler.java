package com.webflex.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.webflex.service.SchedulerService;

@Component
public class Scheduler {

	@Autowired 
	private SchedulerService service;
	/*
	 *                   초  분  시  일  월  요일
	 */
	@Scheduled(cron = "00 00 06 * * *")
	public void autoUpdate() {
		service.paymentReset();
		System.out.println("오전 6:00:00에 호출됩니다.");
	}


}
