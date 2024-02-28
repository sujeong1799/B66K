package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.UserImgVO;

public interface UserImgDAO {

	int userImgRegister(UserImgVO uivo);

	List<UserImgVO> getUserImgList();

	List<UserImgVO> getImgList(String fileName1);

	List<UserImgVO> getCharacterList(String title);

	UserImgVO getProfileImg(String title);

	UserImgVO getUserImg(String uuid);

	
	//삭제할거임!!!!!!!!!!!!!!!!!
	List<UserImgVO> getTmpImgList();

	
}
