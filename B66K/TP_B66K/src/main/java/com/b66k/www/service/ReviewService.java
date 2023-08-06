package com.b66k.www.service;

import java.util.List;

import com.b66k.www.domain.ReviewVO;

public interface ReviewService {
	
	/* 리뷰 등록 */
	int register(ReviewVO rvo);

	/* 리뷰 가져오기 */
	List<ReviewVO> getList(int bno);

	int remove(int rno);

	// 전체 리뷰 가져오기 테스트
	List<ReviewVO> getAllReviews();


	
}
