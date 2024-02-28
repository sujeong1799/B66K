package com.b66k.www.controller;

import java.util.List;





import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.b66k.www.service.BookOrderService;
import com.b66k.www.service.CartService;

import lombok.extern.slf4j.Slf4j;

import com.b66k.www.domain.BookOrderDTO;

import com.b66k.www.domain.BookOrderVO;
import com.b66k.www.domain.CartDTO;
import com.b66k.www.domain.PagingVO;
import com.b66k.www.domain.UserDTO;
import com.b66k.www.domain.UserVO;
import com.b66k.www.handler.PagingHandler;


@Slf4j
@RequestMapping("/bookorder/*")
@Controller
public class BookOrderController {
	
	@Inject
	private BookOrderService bosv;
	
	@Inject
	private CartService csv;
	
	// 장바구니에서 주문하기 버튼 눌렀을때 이동
	@GetMapping("order")
	public String GetOrderList(Model m, HttpServletRequest request) {
		UserDTO udto = (UserDTO)request.getSession().getAttribute("ses");
		String id = udto.getUvo().getId();		
		log.info(">>>> id " + id);
		List<CartDTO> list = csv.GetList(id);
		log.info(">>> Order에 뿌려질 List" + list);
		m.addAttribute("list", list);
		return "/bookorder/order";
	}
	
	// order.jsp에서 주소 등 다 채우고 등록
	@PostMapping("order")
	public String Order(BookOrderVO bovo, RedirectAttributes ra) {
		String id = bovo.getId();
		log.info(">>> id" + id);
		log.info(">>> bovo" + bovo);
		int isOk = bosv.Order(bovo);
		if(isOk > 0) {
			log.info("주문 성공");
			csv.cleanList(id);
			ra.addFlashAttribute("ordersuccess_msg",1);
			return "redirect:/";
		}else {
			log.info("주문 실패");
			return "/home";
		}
	}
	
	@GetMapping("User_orderlist") // 유저가 주문내역 아이콘 눌렀을때 자신의 주문내역 출력
    public String GetUserOrderList(Model m, HttpServletRequest request) {
        UserDTO udto = (UserDTO)request.getSession().getAttribute("ses");
        String id = udto.getUvo().getId();
            List<BookOrderDTO> list = bosv.getorderlist(id);

            if(list == null) {
                m.addAttribute("ListEmpty_msg", 0);

            }else {
                m.addAttribute("ListEmpty_msg", 1);
                m.addAttribute("list", list);
                log.info(">>> 주문내역 list : "+list.toString());
            }
            return "/bookorder/orderlist";

    }
	
	@GetMapping("Admin_orderlist") // admin 관리페이지에서 주문내역 조회했을때 전체 주문내역 출력
	public String GetAllOrderList(Model m,PagingVO pvo, HttpServletRequest request) {
		List<BookOrderDTO> list = bosv.getallorderlist(pvo);
		
		if(list == null) {
			 m.addAttribute("ListEmpty_msg", 0);

		}else {
			m.addAttribute("ListEmpty_msg", 1);
			m.addAttribute("list", list);
			int totalCount = bosv.totalCount(pvo);
			PagingHandler ph = new PagingHandler(pvo, totalCount);
			m.addAttribute("ph", ph);

			log.info(">>> 주문내역 list : "+list.toString());
		}
		return "/bookorder/orderAdminList";
	}
	
	@GetMapping("orderdetail")
	public String GetOrderDetail(@RequestParam("ono")int ono, Model m) {
		BookOrderDTO bodto = bosv.getorderdetail(ono);
		log.info(">>> 상세 주문내역 : "+ bodto.toString());
		m.addAttribute("bodto", bodto);
		return "/bookorder/orderdetail";	
	}
	
	@GetMapping("orderAdminDetail")
	public String GetOrderAdminDetail(@RequestParam("ono")int ono, Model m) {
		BookOrderDTO bodto = bosv.getorderdetail(ono);
		log.info(">>> 상세 주문내역 : "+ bodto.toString());
		m.addAttribute("bodto", bodto);
		return "/bookorder/orderAdminDetail";	
	}
	
	
	@GetMapping("cancle")
	public String OrderCancle(@RequestParam("ono")int ono, Model m, RedirectAttributes ra) {
		int isOk = bosv.ordercancle(ono);
		log.info("주문 취소 "+ (isOk>0?"성공":"실패"));
		if(isOk > 0) {
			ra.addFlashAttribute("ordercancle_msg",1);
		}
		return "redirect:/bookorder/User_orderlist";
	}
	
	@PostMapping("modify")
	public String OrderModify(BookOrderVO bovo , RedirectAttributes ra) {
		log.info("배송정보 수정 bovo >>> "+ bovo.toString());
		int isOk = bosv.ordermodify(bovo);
		if(isOk > 0) {
			ra.addFlashAttribute("ordermodify_msg",1);
		}
		return "redirect:/bookorder/User_orderlist";
		
	}
	
}

