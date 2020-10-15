package com.webflex.dao;

import java.util.List;

import com.webflex.vo.PassVO;

public interface PassDAO {

	PassVO getPass(int pass_no);

	PassVO passInfo(int pass_no);

	List<PassVO> passList();

}
