package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.QuestionImgVO;

public interface QuestionImgDAO {
	
	
	int registerQuestionImg(QuestionImgVO qivo); 
	
	List<QuestionImgVO> getImgList(int qno);

	int deleteFile(String uuid);

}
