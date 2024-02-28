package com.b66k.www.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.b66k.www.domain.CartDTO;
import com.b66k.www.domain.CartVO;
import com.b66k.www.domain.UserDTO;
import com.b66k.www.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/cart/*")
@Controller
public class CartController {

	@Inject
	private CartService csv;

	// 장바구니 페이지로 이동 (get) - 아이콘 눌렀을때
	@GetMapping("list")
	public String GetCartList(Model m, HttpServletRequest request) {
		UserDTO udto = (UserDTO)request.getSession().getAttribute("ses");
		String id = udto.getUvo().getId();		
		log.info("로그인 세션 ID : " + id);
		List<CartDTO> list = csv.GetList(id);
		log.info("뿌려질 LIST  : " + list);
		if (list.size() < 1) {
			m.addAttribute("cartlist_msg", 0);
		} else {
			m.addAttribute("list", list);
		}
		return "/cart/list";
	}

	// ===================== 이거는 bno , count만 채운 cvo를 json으로 넘기는 방식 ================
	// 상품 디테일 화면에서 장바구니 담기(아이디 id, 상품번호 bno, 개수 count) 비동기로 담겨야함
	@PostMapping(value = "/register", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> Register(@RequestBody CartVO cvo) {
		log.info(">>>> cvo : " + cvo); // id, bno, count 1 인 cvo
		int isOk = csv.Register(cvo);
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}

//  ======================= 이거는 파라미터 2개 (bno,count)를 넘기는 get방식 =====================
//	@GetMapping(value="/{bno},{count}" ,produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> post(@PathVariable("bno")int bno, @PathVariable("count")int count, HttpServletRequest request){
//		UserVO uvo = (UserVO)request.getSession().getAttribute("ses");
//		String id = uvo.getId();
//		log.info(">>>> bno : "+ bno );
//		log.info(">>>> count : "+ count );
//		log.info(">>>> id : "+ id );
//		
//		int isOk = csv.Register();
//		return isOk> 0? new ResponseEntity<String>("1", HttpStatus.OK)
//				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	@PostMapping("AmountCheck")
	public String AmountCheck(@RequestParam("bno")int bno, @RequestParam("count")int count, HttpServletRequest request, RedirectAttributes ra) {
		UserDTO udto = (UserDTO)request.getSession().getAttribute("ses");
		String id = udto.getUvo().getId();		
		log.info("로그인 세션 ID : " + id);
		log.info("가져온 bno list" + bno);
		log.info("가져온 count list" + count);
		
		Map<String, Integer> EmptyAmountItemMap = csv.AmountCheck(id);
        List<String> titleList = new ArrayList<>(EmptyAmountItemMap.keySet());
        List<Integer> amountList = new ArrayList<>(EmptyAmountItemMap.values());
		log.info("재고보다 주문수량이 많은 책 : " + EmptyAmountItemMap.toString());
		if(EmptyAmountItemMap.size()>0) {
			
			ra.addFlashAttribute("EmptyListTitle",titleList);
			ra.addFlashAttribute("EmptyListAmount",amountList);
			return "redirect:/cart/list";
		}else {
			return "redirect:/bookorder/order";
		}
	}
	
	// 수량변경시(수량 버튼 클릭시) 변경한 수량 CartDB에 반영
	@PutMapping(value = "/changeCount", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> changeCount(@RequestBody CartVO cvo) {
		log.info(">>>> cvo : " + cvo); // cvo : count , cno

		int isOk = csv.changeCount(cvo);
		
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 상품삭제
	@DeleteMapping(value = "/{cno}")
	public ResponseEntity<String> Delete(@PathVariable("cno") int cno, HttpServletRequest request) {
		log.info(">>>> cno : " + cno);
		UserDTO udto = (UserDTO)request.getSession().getAttribute("ses");
		String id = udto.getUvo().getId();	
		int isOk = csv.Delete(cno, id);
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
