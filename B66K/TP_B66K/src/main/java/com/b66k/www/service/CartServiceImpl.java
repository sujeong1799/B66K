package com.b66k.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.b66k.www.domain.BookImgVO;
import com.b66k.www.domain.BookOrderItemVO;
import com.b66k.www.domain.BookOrderItemsDTO;
import com.b66k.www.domain.BookVO;
import com.b66k.www.domain.CartDTO;
import com.b66k.www.domain.CartVO;
import com.b66k.www.repository.BookDAO;
import com.b66k.www.repository.BookImgDAO;
import com.b66k.www.repository.CartDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartDAO cdao;
	
	@Inject
	private BookDAO bdao;

	@Inject
	private BookImgDAO bidao;
	
	@Override
	public List<CartDTO> GetList(String id) {
		log.info("CartService GetList 진입");
		List<CartDTO> cdto = new ArrayList<>();
		List<CartVO> list = cdao.GetList(id);
		for(CartVO cvo : list) {
			int bno = cvo.getBno();
			BookImgVO bivo = bidao.getImgList(bno); 
			cdto.add(new CartDTO(cvo,bivo));
		}
		log.info(">>> CartDTO List " + cdto.toString());
		return cdto;
	}

	@Override
	public int Register(CartVO cvo) {
		log.info("CartService Register 진입");
		int bno = cvo.getBno();
		String id = cvo.getId();
		if(cdao.Check(bno,id) > 0) {
			log.info("항목 중복");
			return 0;
		}else {			
			BookVO bvo = bdao.detail(bno);
			cvo.setAuthor(bvo.getAuthor());
			cvo.setPrice(bvo.getPrice());
			cvo.setTitle(bvo.getTitle());
			int isOk = cdao.Register(cvo);
			log.info(isOk > 0 ? "장바구니 등록 성공" : "장바구니 등록 실패");
			return isOk;
		}
	}

	@Override
	public int Delete(int cno, String id) {
		log.info("CartService Delete 진입");
		int isOk = cdao.Delete(cno, id);
		log.info(isOk > 0 ? "상품 삭제 성공" : "상품 삭제 실패");
		return isOk;
	}

	@Override
	public int changeCount(CartVO cvo) {
		log.info("CartService changeCount 진입");
		int isOk = cdao.changeCount(cvo);
		return isOk;
	}

//	@Override
//	public List<BookOrderItemsDTO> GetListTobookorder(String id) {
//		log.info("CartDAO GetListTobookorder 진입");
//		List<CartDTO> cdto = new ArrayList<>();
//		List<CartVO> list = cdao.GetList(id);
//		cdao.GetListTobookorder(id);
//		return 
//	}

	@Override
	public void cleanList(String id) {
		log.info("CartService 장바구니 비우기 cleanList 진입");
		int isOk = cdao.cleanList(id);
		log.info(isOk > 0 ? "장바구니 비우기 성공" : "장바구니 비우기 실패");
	}

	@Override
	public Map<String, Integer> AmountCheck(String id) {
		log.info("CartService 재고 비교 진입");
		//cart 아이템 리스트를 가져와서 각 아이템의 count와 재고량을 비교
		List<CartVO> list = cdao.GetList(id);
		Map<String, Integer> EmptyAmountItemMap = new HashMap<String, Integer>();
		for(CartVO cvo : list) {
			int bno = cvo.getBno(); // 책번호
			int count = cvo.getCount(); // 주문수량
			int amount = bdao.getAmount(bno); // BookDAO 한테 getAmount(bno) bno의 재고 가져오기
			if(amount < count) {				
				EmptyAmountItemMap.put(cvo.getTitle(), amount);
			}
		}
		return EmptyAmountItemMap;
	}

}
