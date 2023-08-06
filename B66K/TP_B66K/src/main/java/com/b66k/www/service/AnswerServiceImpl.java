package com.b66k.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.b66k.www.domain.AnswerVO;
import com.b66k.www.repository.AnswerDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AnswerServiceImpl implements AnswerService{

	@Inject
	private AnswerDAO adao;
	
	@Override
	public int postAnswer(AnswerVO avo) {
		log.info("Answer post Service");
		return adao.postAnswer(avo);
	}

	@Override
	public List<AnswerVO> getList(int qno) {
		return adao.AnswerList(qno);
	}

	@Override
	public int delete(int ano) {
		return adao.delete(ano);
	}

	@Override
	public int edit(AnswerVO avo) {
		return adao.editList(avo);
	}

}
