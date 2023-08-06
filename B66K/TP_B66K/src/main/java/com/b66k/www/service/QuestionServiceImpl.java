package com.b66k.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.b66k.www.domain.PagingVO;
import com.b66k.www.domain.QuestionDTO;
import com.b66k.www.domain.QuestionImgVO;
import com.b66k.www.domain.QuestionVO;
import com.b66k.www.repository.QuestionDAO;
import com.b66k.www.repository.QuestionImgDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QuestionServiceImpl implements QuestionService {

	
	@Inject
	private QuestionDAO qdao;
	
	@Inject
	private QuestionImgDAO qidao;
		
	
	@Override
	public int register(QuestionVO qvo) {
		log.info(">>> register service 진입");
		int isOk = qdao.register(qvo);
		return isOk;
	}
	

	@Override
	public int getTotalCount(PagingVO pvo) {
		// TODO Auto-generated method stub
		return qdao.totalCount(pvo);
	}


	@Override
	public List<QuestionVO> list() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<QuestionVO> list(PagingVO pvo) {
		// TODO Auto-generated method stub
		return qdao.ListPaging(pvo);
	}


	@Override
	public QuestionVO detail(int qno) {
		// TODO Auto-generated method stub
		return qdao.detail(qno);
	}





	@Override
	public int register(QuestionDTO qdto) {
		log.info("qvo+flist register in");
		int isOk = qdao.register(qdto.getQvo());
		if(qdto.getFlist() == null) { //파일이 없다는 의미
			isOk*=1; 
		}else {
			if(isOk>0 && qdto.getFlist().size()>0){

				int qno = qdao.selectQno(); 

				for(QuestionImgVO qivo : qdto.getFlist()) {
					//log.info(">> insert File :" + qivo.toString());
					qivo.setQno(qno);
					isOk *= qidao.registerQuestionImg(qivo);
				}
			}
		}
		
		
		return isOk;
	}





	@Override
	public QuestionDTO detailImg(int qno) {
		log.info(">>detail Img service 진입");
		QuestionDTO qdto = new QuestionDTO();
		qdto.setQvo(qdao.detail(qno));
		qdto.setFlist(qidao.getImgList(qno));
		return qdto;
	}





	@Override
	public int delete(int qno) {
		log.info(">>> delete service 진입");
		return qdao.delete(qno);
	}





	@Override
	public int removeFile(String uuid) {
		log.info(">>removeFile");
		return qidao.deleteFile(uuid);
	}
















}
