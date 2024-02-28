package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.AnswerVO;

public interface AnswerDAO {

	int postAnswer(AnswerVO avo);

	List<AnswerVO> AnswerList(int qno);

	int delete(int ano);

	int editList(AnswerVO avo);

}
