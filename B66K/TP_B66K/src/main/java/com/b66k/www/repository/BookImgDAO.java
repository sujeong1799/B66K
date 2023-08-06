package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.BookImgVO;
import com.b66k.www.domain.BookVO;

public interface BookImgDAO {

	int registerBookImg(BookImgVO bivo);

	BookImgVO getImgList(int bno);

	int deleteBookImg(String uuid);

	List<BookImgVO> getRelationImg(String title);

	BookImgVO getEventPic(int bno);

	List<String> getUuidListBno(int bno);

	void updateBookImgIsDel(String uuid);



}
