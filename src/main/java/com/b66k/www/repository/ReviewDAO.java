package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.ReviewVO;
import com.b66k.www.domain.UpdateReviewDTO;

public interface ReviewDAO {

	int register(ReviewVO rvo);

	List<ReviewVO> list(int bno);

	int remove(int rno);

	double getRatingAvg(int bno);
	
	int updateRating(UpdateReviewDTO rdto);

	int selectBno(int rno);

	double resetRating(UpdateReviewDTO rdto);

	List<ReviewVO> listAll();


}
