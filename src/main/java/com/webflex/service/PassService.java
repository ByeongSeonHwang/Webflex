package com.webflex.service;

import java.util.List;

import com.webflex.vo.PassVO;

public interface PassService {

	PassVO passInfo(int pass_no);

	List<PassVO> passList();

}
