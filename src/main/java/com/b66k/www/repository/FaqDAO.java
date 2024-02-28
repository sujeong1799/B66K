package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.FaqVO;
import com.b66k.www.domain.PagingVO;


public interface FaqDAO {

	int register(FaqVO fqvo);
	
	int totalCount(PagingVO pvo);

	int delete(int fno);

	List<FaqVO> ListPaging(PagingVO pvo);

}
