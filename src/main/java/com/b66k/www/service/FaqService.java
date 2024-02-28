package com.b66k.www.service;

import java.util.List;

import com.b66k.www.domain.FaqVO;
import com.b66k.www.domain.PagingVO;

public interface FaqService {

	int register(FaqVO fqvo);


	int getTotalCount(PagingVO pvo);

	int delete(int fno);


	List<FaqVO> list(PagingVO pvo);


	

}
