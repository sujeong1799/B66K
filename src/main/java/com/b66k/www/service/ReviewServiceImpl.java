package com.b66k.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.b66k.www.domain.ReviewVO;
import com.b66k.www.domain.UpdateReviewDTO;
import com.b66k.www.repository.ReviewDAO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO rdao;
		
	@Override public int register(ReviewVO rvo) {
		int isOk = rdao.register(rvo);
		setRating(rvo.getBno());
		
	  return isOk;
	}


	@Override
	public List<ReviewVO> getList(int bno) {

		return rdao.list(bno);
	}

	@Override
	public int remove(int rno) {
		int bno = rdao.selectBno(rno);
		int isOk = rdao.remove(rno);
		
		List<ReviewVO> list = rdao.list(bno); 
		
		if (list.size() > 0) {
			setRating(bno);
		}else {
			resetRating(bno);
		}
		
		return isOk;
	}

	
	// 리뷰가 0일때 평균 리셋
	public void resetRating(int bno) {
		
		double ratingAvg = 0;
				
		UpdateReviewDTO urd = new UpdateReviewDTO();
		urd.setBno(bno);
		urd.setRatingAvg(ratingAvg);
		
		rdao.resetRating(urd);		
	}

	// 리뷰가 등록될때마다 평점 업뎃
	public void setRating(int bno) {
		double ratingAvg = rdao.getRatingAvg(bno);
		if(ratingAvg > 0) {
			ratingAvg = (double) (Math.round(ratingAvg*10));
			ratingAvg = ratingAvg / 10;
		}else {
			
			ratingAvg = 0;
		}
				
		UpdateReviewDTO urd = new UpdateReviewDTO();
		urd.setBno(bno);
		urd.setRatingAvg(ratingAvg);

		rdao.updateRating(urd);
	}


	// 리스트 테스트 
	@Override
	public List<ReviewVO> getAllReviews() {
		// TODO Auto-generated method stub
		return rdao.listAll();
	}

}
