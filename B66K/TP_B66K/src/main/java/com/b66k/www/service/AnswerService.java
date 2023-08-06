package com.b66k.www.service;

import java.util.List;

import com.b66k.www.domain.AnswerVO;

public interface AnswerService {

	int postAnswer(AnswerVO avo);

	List<AnswerVO> getList(int qno);
	
	int edit(AnswerVO avo);

	int delete(int ano);

	



}
