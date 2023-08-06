package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.BookVO;
import com.b66k.www.domain.PagingVO;

public interface BookDAO {
	
	// 상품 등록
	int register(BookVO bvo);

	// 상품 리스트
	List<BookVO> list();

	// 상품 디테일
	BookVO detail(int bno);

	// 수정할 상품 출력
	int modify(BookVO bvo);
	
	// 상품 수정
	int edit(BookVO bvo);

	// 상품 리스트 페이징
	List<BookVO> selectListPaging(PagingVO pvo);

	// 상품 총 몇개인지 확인
	int totalCount(PagingVO pvo);

	// book에 있는 제일 마지막 글 번호 가져오기 
	int selectBno();

	// 상품 삭제
	int delete(int bno);
	
	// favorite에서 쓰는 bno
	BookVO selectBno(int bno);
	
	// 
	BookVO modify(int bno);

	// 재고량 가져오기
	int getAmount(int bno);

	List<BookVO> MonthlyNewList(String date);

	List<BookVO> TitleSearchList(String keyword);

	List<BookVO> AuthorSearchList(String keyword);

	List<BookVO> GetSaleRankingList(String date);

	List<BookVO> GetRatingRankingList();

	List<BookVO> GetTopSaleAmountList();

	List<BookVO> GetReviewRankingList();
	

}
