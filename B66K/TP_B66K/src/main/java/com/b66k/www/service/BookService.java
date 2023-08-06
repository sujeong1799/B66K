package com.b66k.www.service;

import java.util.List;

import com.b66k.www.domain.BookDTO;
import com.b66k.www.domain.BookImgVO;
import com.b66k.www.domain.BookVO;
import com.b66k.www.domain.PagingVO;

public interface BookService {

	int register(BookVO bvo);

	List<BookVO> list(PagingVO pvo);

	BookVO detail(int bno);

	BookVO modify(int bno);

	int eidt(BookVO bvo);

	int delete(int bno);

	int totalCount(PagingVO pvo);

	int register(BookDTO bdto);

	BookDTO detailImg(int bno);

	BookDTO modifyFile(int bno);

	int deleteBookImg(String uuid);

	int editBookImg(BookDTO bdto);

	List<BookImgVO> getRelationImg(String title);

	BookImgVO getEventPic(int bno);

	List<BookDTO> MonthlyNewList(String date);

	List<BookDTO> GetSearchList(String keyword);

	List<BookDTO> GetSaleRankingList(String date);

	List<BookDTO> GetRatingRankingList();

	List<BookDTO> GetTopSaleAmountList();

	List<BookDTO> GetReviewRankingList();

}
