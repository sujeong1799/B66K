package com.b66k.www.service;

import java.io.Console;
import java.util.ArrayList;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.b66k.www.domain.BookImgVO;
import com.b66k.www.domain.BookOrderDTO;
import com.b66k.www.domain.BookOrderItemVO;
import com.b66k.www.domain.BookOrderItemsDTO;
import com.b66k.www.domain.BookOrderVO;
import com.b66k.www.domain.PagingVO;
import com.b66k.www.repository.BookImgDAO;
import com.b66k.www.repository.BookOrderDAO;
import com.b66k.www.repository.CartDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookOrderServiceImpl implements BookOrderService {

	@Inject
	private BookOrderDAO bodao;

	@Inject
	private CartDAO cdao;

	@Inject
	private BookImgDAO bidao;

	@Override
	public int Order(BookOrderVO bovo) {
		// BookOrderDTO bodto 구성 (BookOrderVO bovo, List<BookOrderItemsDTO> boidto)
		// BookOrderItemsDTO boidto 구성 (BookOrderItemVO boivo , BookImgVO bivo)

		log.info("BookOrderService 주문하기 진입");
		int total = 0;
		String id = bovo.getId();
		List<BookOrderItemVO> list = cdao.GetListTobookorder(id);

		for (BookOrderItemVO boivo : list) {
			total += boivo.getCount() * boivo.getPrice(); // 총 주문금액 계산 & 저장
		}
		bovo.setTotal(total);

		int isOk = bodao.registerOrder(bovo); // 배송정보 저장

		if (isOk > 0) {
			int ono = bodao.selectOno();
			for (BookOrderItemVO boivo : list) {
				int bno = boivo.getBno();
				int count = boivo.getCount();
				boivo.setOno(ono);
				isOk *= bodao.registerOrderItems(boivo);
				bodao.saleAmountPlus(bno, count); // 판매되었을때 판매량 늘리고 재고 빼는 메서드
			}

		}

		return isOk;
	}

	@Override
	public List<BookOrderDTO> getorderlist(String id) {
		log.info("BookOrderService 주문내역 진입");
		List<BookOrderVO> bookorderlist = bodao.getOrderList(id); // ID조건에 맞는 주문목록(orderlist) 가져옴 BookOrderVO 형태

		if (bookorderlist.size() > 0) {
			List<BookOrderDTO> bodto = new ArrayList<BookOrderDTO>(); // BookOrderDTO -> BookOrderVO ,
																		// List<BookOrderItemsDTO>

			for (BookOrderVO bovo : bookorderlist) {
				List<BookOrderItemsDTO> boidto = new ArrayList<BookOrderItemsDTO>(); // BookOrderItemsDTO ->
																						// BookOrderItemVO, BookImgVO
				int ono = bovo.getOno();
				List<BookOrderItemVO> bookorderitemlist = bodao.getOrderItems(ono); // 개별 주문의 item 리스트를 가져옴
																					// BookOrderItemsVO 형태
				for (BookOrderItemVO boivo : bookorderitemlist) {
					int bno = boivo.getBno();
					BookImgVO bivo = bidao.getImgList(bno); // BookImgVO형태로 bno 이미지 가져오기
					boidto.add(new BookOrderItemsDTO(boivo, bivo));
				}
				bodto.add(new BookOrderDTO(bovo, boidto));
			}
			log.info("return 위한 bodto 사이즈 >>> " + bodto.size());
			log.info("return 위한 bodto >>> " + bodto.toString());
			return bodto;
		} else {
			return null;
		}
	}

	@Override
	public BookOrderDTO getorderdetail(int ono) {
		log.info("BookOrderService 주문 상세내역 진입");
		BookOrderVO bovo = bodao.getorder(ono);

		List<BookOrderItemsDTO> boidto = new ArrayList<BookOrderItemsDTO>();
		List<BookOrderItemVO> bookorderitemlist = bodao.getOrderItems(ono);
		for (BookOrderItemVO boivo : bookorderitemlist) {
			int bno = boivo.getBno();
			BookImgVO bivo = bidao.getImgList(bno);
			boidto.add(new BookOrderItemsDTO(boivo, bivo));
		}
		BookOrderDTO bodto = new BookOrderDTO(bovo, boidto);
		return bodto;
	}

	@Override
	public int ordercancle(int ono) {
		log.info("BookOrderService 주문 취소 진입");
		int isOk = bodao.ordercancle(ono);
		List<BookOrderItemVO> list = bodao.getOrderItems(ono);
		for (BookOrderItemVO boivo : list) {
			int bno = boivo.getBno();
			int count = boivo.getCount();
			bodao.saleAmountMinus(bno, count); // 취소되었을때 판매량 되돌리고 재고 늘리는 메서드
		}
		return isOk;
	}

	@Override
	public int ordermodify(BookOrderVO bovo) {
		log.info("BookOrderService 배송 정보 수정 진입");
		int isOk = bodao.ordermodify(bovo);
		return isOk;
	}

	@Override
	public List<BookOrderDTO> getallorderlist() {
		log.info("BookOrderService 전체 주문내역 진입");
		List<BookOrderVO> bookorderlist = bodao.getAllOrderList(); // ID조건에 맞는 주문목록(orderlist) 가져옴 BookOrderVO 형태

		if (bookorderlist.size() > 0) {
			List<BookOrderDTO> bodto = new ArrayList<BookOrderDTO>(); // BookOrderDTO -> BookOrderVO ,
																		// List<BookOrderItemsDTO>

			for (BookOrderVO bovo : bookorderlist) {
				List<BookOrderItemsDTO> boidto = new ArrayList<BookOrderItemsDTO>(); // BookOrderItemsDTO ->
																						// BookOrderItemVO, BookImgVO
				int ono = bovo.getOno();
				List<BookOrderItemVO> bookorderitemlist = bodao.getOrderItems(ono); // 개별 주문의 item 리스트를 가져옴
																					// BookOrderItemsVO 형태
				for (BookOrderItemVO boivo : bookorderitemlist) {
					int bno = boivo.getBno();
					BookImgVO bivo = bidao.getImgList(bno); // BookImgVO형태로 bno 이미지 가져오기
					boidto.add(new BookOrderItemsDTO(boivo, bivo));
				}
				bodto.add(new BookOrderDTO(bovo, boidto));
			}
			log.info("return 위한 bodto 사이즈 >>> " + bodto.size());
			log.info("첫번째 boidto 사이즈 >>> " + bodto.get(0).getBoidto().size());
			return bodto;
		} else {
			return null;
		}
	}

	@Override
	public List<BookOrderDTO> getallorderlist(PagingVO pvo) {
		List<BookOrderVO> list = bodao.selectListPaging(pvo);

		if (list.size() > 0) {
			List<BookOrderDTO> bodto = new ArrayList<BookOrderDTO>(); // BookOrderDTO -> BookOrderVO ,
			log.info("ListSize>>>>>" +list.size());
																		// List<BookOrderItemsDTO>

			for (BookOrderVO bovo : list) {
				List<BookOrderItemsDTO> boidto = new ArrayList<BookOrderItemsDTO>(); // BookOrderItemsDTO ->
																						// BookOrderItemVO, BookImgVO
				int ono = bovo.getOno();
				List<BookOrderItemVO> bookorderitemlist = bodao.getOrderItems(ono); // 개별 주문의 item 리스트를 가져옴
																					// BookOrderItemsVO 형태
				for (BookOrderItemVO boivo : bookorderitemlist) {
					int bno = boivo.getBno();
					BookImgVO bivo = bidao.getImgList(bno); // BookImgVO형태로 bno 이미지 가져오기
					boidto.add(new BookOrderItemsDTO(boivo, bivo));
				}
				bodto.add(new BookOrderDTO(bovo, boidto));
			}
			log.info("return 위한 bodto 사이즈 >>> " + bodto.size());
			log.info("첫번째 boidto 사이즈 >>> " + bodto.get(0).getBoidto().size());
			return bodto;
		} else {
			return null;
		}


	}

	@Override
	public int totalCount(PagingVO pvo) {
		log.info("totalCount serviceImple 진입");
		return bodao.totalCount(pvo);
	}

}
