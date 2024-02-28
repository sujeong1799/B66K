package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.PagingVO;
import com.b66k.www.domain.QuestionImgVO;
import com.b66k.www.domain.QuestionVO;

public interface QuestionDAO {

	int register(QuestionVO qvo);

	List<QuestionVO> list();

	int totalCount(PagingVO pvo);

	List<QuestionVO> ListPaging(PagingVO pvo);

	QuestionVO detail(int qno);

	int selectQno();

	int delete(int qno);




	
	
}
