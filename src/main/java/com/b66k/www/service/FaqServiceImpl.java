package com.b66k.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.b66k.www.domain.FaqVO;
import com.b66k.www.domain.PagingVO;
import com.b66k.www.repository.FaqDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FaqServiceImpl implements FaqService {
	
	@Inject
	private FaqDAO fdao;
	

	@Override
	public int register(FaqVO fqvo) {
		log.info("register진입");
		int isOk = fdao.register(fqvo);
		return isOk;
	}



	@Override
	public int getTotalCount(PagingVO pvo) {
		// TODO Auto-generated method stub
		return fdao.totalCount(pvo);
	}
	
	
	@Override
	public List<FaqVO> list(PagingVO pvo) {
		// TODO Auto-generated method stub
		return fdao.ListPaging(pvo);
	}


	
	
	@Override
	public int delete(int fno) {
		log.info(">>delete service 진입");
		int isOk = fdao.delete(fno);
		return isOk;
	}





}
