package com.b66k.www.service;

import java.util.List;

import com.b66k.www.domain.PagingVO;
import com.b66k.www.domain.QuestionDTO;
import com.b66k.www.domain.QuestionVO;

public interface QuestionService {

	int register(QuestionVO qvo);

	List<QuestionVO> list();

	int getTotalCount(PagingVO pvo);

	List<QuestionVO> list(PagingVO pvo);

	QuestionVO detail(int qno);

	int register(QuestionDTO qdto);

	QuestionDTO detailImg(int qno);

	int delete(int qno);

	int removeFile(String uuid);

	

	/*
	 * int getTotalCount(PagingVO pvo);
	 * 
	 * List<QuestionVO> list(PagingVO pvo);
	 */

}
