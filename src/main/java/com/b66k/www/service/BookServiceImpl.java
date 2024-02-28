package com.b66k.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.b66k.www.domain.BookDTO;
import com.b66k.www.domain.BookImgVO;
import com.b66k.www.domain.BookVO;
import com.b66k.www.domain.PagingVO;
import com.b66k.www.repository.BookDAO;
import com.b66k.www.repository.BookImgDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookServiceImpl implements BookService {

	@Inject
	private BookDAO bdao;

	@Override
	public int register(BookVO bvo) {
		int isOk = bdao.register(bvo);
		return isOk;
	}

	@Inject
	private BookImgDAO bidao;

	/*
	 * @Override public List<BookVO> list() { return bdao.list(); }
	 */

	@Override
	public BookVO detail(int bno) {
		return bdao.detail(bno);
	}

	@Override
	public BookVO modify(int bno) {
		log.info("modify service 진입");
		return bdao.modify(bno);
	}

	@Override
	public int eidt(BookVO bvo) {
		log.info("edit service 진입");
		return bdao.edit(bvo);
	}

	@Override
	public int delete(int bno) {
		// 해당 글에 첨부된 이미지들의 uuid 목록을 가져오기
		List<String> uuidList = bidao.getUuidListBno(bno);
		for (String uuid : uuidList) {

			// 이미지의 isDel 값을 'Y'로 변경
			bidao.updateBookImgIsDel(uuid);
		}
		int isOk = bdao.delete(bno);
		return isOk;
	}

	@Override
	public List<BookVO> list(PagingVO pvo) {
		return bdao.selectListPaging(pvo);
	}

	@Override
	public int totalCount(PagingVO pvo) {
		log.info("totalCount serviceImple 진입");
		return bdao.totalCount(pvo);
	}

	@Override
	public int register(BookDTO bdto) {
		log.info("bvo+flist register service 진입");
		int isOk = 0;
		if (bdto.getBivo() == null) {
			return isOk;
		} else {
			isOk = bdao.register(bdto.getBvo());
			int bno = bdao.selectBno();
			if (isOk > 0) {
				BookImgVO bivo = bdto.getBivo();
				((BookImgVO) bivo).setBno(bno); // 0번지 사진
				log.info(">>>> registerBookImg : " + bivo.toString());
				isOk *= bidao.registerBookImg(bivo);
			}
		}
		return isOk;
	}

	@Override
	public BookDTO detailImg(int bno) {
		log.info(">>> detail Img service 진입");
		BookDTO bdto = new BookDTO();
		bdto.setBvo(bdao.detail(bno)); // bvo 호출
		bdto.setBivo(bidao.getImgList(bno)); // imgList호출
		log.info("bdto >>> " + bdto.toString());
		return bdto;
	}

	@Override
	public BookDTO modifyFile(int bno) {
		log.info(">>> modify File service 진입");
		BookDTO bdto = new BookDTO();
		bdto.setBvo(bdao.modify(bno));
		bdto.setBivo(bidao.getImgList(bno));
		return bdto;
	}

	@Override
	public int editBookImg(BookDTO bdto) {
		log.info(">>> bvo+flist edit service 진입");
		int isOk = 0;
		isOk = bdao.edit(bdto.getBvo());
		if (bdto.getBivo() == null) {
			return 0;
		} else {
			if (isOk > 0 && bdto.getBivo() != null) {
				int bno = bdto.getBvo().getBno();
				log.info("왜왜왜왜왜왜왜애애앵 >> " + bno);
				bdto.getBivo().setBno(bno);
				log.info(">>> editBookImg : " + bdto.getBivo().toString());
				isOk *= bidao.registerBookImg(bdto.getBivo());
			}
		}
		return isOk;
	}

	@Override
	public List<BookImgVO> getRelationImg(String title) {
		log.info(">>> 관련만화책 이미지 뽑아오기 진입");
		title = title.substring(0, 4);
		log.info("잘라낸 title : " + title);
		return bidao.getRelationImg(title);
	}

	@Override
	public BookImgVO getEventPic(int bno) {

		return bidao.getEventPic(bno);
	}

	@Override
	public List<BookDTO> MonthlyNewList(String date) {
		List<BookVO> NewList = bdao.MonthlyNewList(date);
		List<BookDTO> bdto = new ArrayList<>();
		for (BookVO bvo : NewList) {
			int bno = bvo.getBno();
			BookImgVO bivo = bidao.getImgList(bno);
			bdto.add(new BookDTO(bvo, bivo));
		}
		return bdto;
	}

	@Override
	public List<BookDTO> GetSearchList(String keyword) {
		List<BookVO> titleList = bdao.TitleSearchList(keyword);
		List<BookVO> authorList = new ArrayList<>();
		List<BookDTO> searchList = new ArrayList<>();
		if (titleList.size() == 0) { // 타이틀에서 검색하고 없으면 작가한테서 키워드를 찾음
			authorList = bdao.AuthorSearchList(keyword);
			if (authorList.size() == 0) { // 작가에서 키워드가 없으면 null 리턴
				return null;
			} else { // 작가에서 키워드 찾으면 list 리턴
				for (BookVO bvo : authorList) {
					int bno = bvo.getBno();
					BookImgVO bivo = bidao.getImgList(bno);
					searchList.add(new BookDTO(bvo, bivo));
				}
				return searchList;
			}
		} else { // 타이틀에서 키워드 찾으면 list 리턴
			for (BookVO bvo : titleList) {
				int bno = bvo.getBno();
				BookImgVO bivo = bidao.getImgList(bno);
				searchList.add(new BookDTO(bvo, bivo));
			}
			return searchList;
		}
	}

	@Override
	public int deleteBookImg(String uuid) {
		log.info("delete img service 진입");
		return bidao.deleteBookImg(uuid);
	}

	@Override
	public List<BookDTO> GetSaleRankingList(String date) {

		List<BookVO> list = bdao.GetSaleRankingList(date);
		List<BookDTO> bdto = new ArrayList<>();
		for (BookVO bvo : list) {
			int bno = bvo.getBno();
			BookImgVO bivo = bidao.getImgList(bno);
			bdto.add(new BookDTO(bvo, bivo));
		}
		return bdto;
	}

	@Override
	public List<BookDTO> GetRatingRankingList() {

		List<BookVO> list = bdao.GetRatingRankingList();
		List<BookDTO> bdto = new ArrayList<>();
		for (BookVO bvo : list) {
			int bno = bvo.getBno();
			BookImgVO bivo = bidao.getImgList(bno);
			bdto.add(new BookDTO(bvo, bivo));
		}
		return bdto;
	}

	@Override
	public List<BookDTO> GetTopSaleAmountList() {
		
		List<BookVO> list = bdao.GetTopSaleAmountList();
		List<BookDTO> bdto = new ArrayList<>();
		for (BookVO bvo : list) {
			int bno = bvo.getBno();
			BookImgVO bivo = bidao.getImgList(bno);
			bdto.add(new BookDTO(bvo, bivo));
		}
		return bdto;
	}

	@Override
	public List<BookDTO> GetReviewRankingList() {
		List<BookVO> list = bdao.GetReviewRankingList();
		List<BookDTO> bdto = new ArrayList<>();
		for(BookVO bvo : list) {
			int bno = bvo.getBno();
			BookImgVO bivo = bidao.getImgList(bno);
			bdto.add(new BookDTO(bvo, bivo));
		}
				return bdto;
	}

}
