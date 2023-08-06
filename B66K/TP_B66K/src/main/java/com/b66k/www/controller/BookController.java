package com.b66k.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.b66k.www.domain.BookDTO;
import com.b66k.www.domain.BookImgVO;
import com.b66k.www.domain.BookVO;
import com.b66k.www.domain.PagingVO;
import com.b66k.www.handler.FileHandler;
import com.b66k.www.handler.PagingHandler;
import com.b66k.www.service.BookService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/book/*")
@Controller
public class BookController {
	
	@Inject
	private BookService bsv;
	
	@Inject
	private FileHandler fhd;
	
	@GetMapping("/testpage")
	public String testpage() {
		return "/book/testpage";
		
	}
	@GetMapping("/admin")
	public void admin() {
	}
	
	@GetMapping("/event")
	public void event() {	
	}
	
	@GetMapping("/event2")
	public void event2() {
	}
	
	@GetMapping("/register")
	public void register() {
	}
	
	@PostMapping("/register")
	public String register(BookVO bvo, RedirectAttributes rAttr,
			@RequestParam(name="files", required = false) MultipartFile[] files) {
		log.info("bvo > " + bvo.toString());
		
//		int isOk = bsv.register(bvo);
		
		List<BookImgVO> bivo = new ArrayList<BookImgVO>();
		if (files[0].getSize() > 0) { // 데이터가 있다 라는 것을 의미
			// 파일 배열을 경로설정, 리스트로 리턴
			bivo = fhd.uploadFiles(files);
		} else {
			log.info("file null");
			
		}
		log.info("bivo >>" + bivo.toString());
		
		BookDTO bdto = new BookDTO(bvo, bivo.get(0));
		int isOk = bsv.register(bdto);
		log.info("book register > "+ (isOk > 0 ?  "성공" : "실패"));
		rAttr.addAttribute("isOk", isOk);
		return "redirect:/book/list";
		
	}
	
	@GetMapping("/list")
	public String list(Model m, PagingVO pvo) {
		log.info(">>>>>>>> pagevo >>>>>>>>> : " + pvo);
		List<BookVO> list = bsv.list(pvo);
		m.addAttribute("list", list);
		int totalCount = bsv.totalCount(pvo);
		log.info(list.toString());		
		log.info(">>>>>>>> totalCount > " + totalCount);
		PagingHandler ph = new PagingHandler(pvo, totalCount);
		m.addAttribute("ph", ph);
		return "/book/list";
	}
	
	@GetMapping("/detail")
	public void detail(Model m, @RequestParam("bno") int bno) {
		log.info(">>> bno >" + bno);
//		BookVO bvo = bsv.detail(bno);
		BookDTO bdto = bsv.detailImg(bno);
//		log.info("bvo > " + bvo.toString());
		log.info("bdto > " + bdto.getBvo());
		log.info("bdto > " + bdto.getBivo());
		log.info("bno>>>>>>>>" + bdto.getBvo().getBno());
		
		m.addAttribute("bdto", bdto);
	}
	
	@GetMapping("/modify")
	public void modify(Model m, @RequestParam("bno") int bno) {
		log.info(">>> bno >" + bno);
		/* BookVO bvo = bsv.modify(bno); */
		BookDTO bdto = bsv.modifyFile(bno);
		//m.addAttribute("bvo", bvo);
		log.info("bdto > " + bdto.getBvo());
		log.info("bdto > " + bdto.getBivo());
		log.info("bno >>>" + bdto.getBvo().getBno());
		m.addAttribute("bdto", bdto);
	}
	
	@PostMapping("/modify")
	public String modify(Model m, BookVO bvo, RedirectAttributes rAttr,
			@RequestParam(name="files", required=false)MultipartFile[] files) {
		log.info(">>> 수정할 bvo >" + bvo);
		List<BookImgVO> bivo = new ArrayList<>();
		int isOk=0;
		if(files[0].getSize() > 0) {
			bivo = fhd.uploadFiles(files);
			BookDTO bdto = new BookDTO(bvo, bivo.get(0));
			isOk = bsv.editBookImg(bdto);
			log.info("book modify > "+ (isOk > 0 ?  "성공" : "실패"));
			return "redirect:/book/list";	
		}
			isOk = bsv.eidt(bvo);
			m.addAttribute("bvo", bvo);
			log.info("book modify > "+ (isOk > 0 ?  "성공" : "실패"));
		return "redirect:/book/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rAttr) {
		log.info("삭제할 bno > " + bno);
		int isOk = bsv.delete(bno);
		log.info(">>> 글 삭제 >" + (isOk > 0 ? "성공" : "실패" ));
		return "redirect:/book/list";

	}
	

	@GetMapping("/ProductDetail")
	public void ProductDetail(Model m, @RequestParam("bno") int bno) {
		log.info(">>> bno >" + bno);
//		BookVO bvo = bsv.detail(bno);
		BookDTO bdto = bsv.detailImg(bno);
//		log.info("bvo > " + bvo.toString());
		log.info("bdto > " + bdto.getBvo());
		log.info("bdto > " + bdto.getBivo());
		String title = bdto.getBvo().getTitle();
		log.info("선택된 타이틀 : "+ title);
		List<BookImgVO> relationImgList = bsv.getRelationImg(title); 
		
		BookImgVO eventPic = bsv.getEventPic(bno);
		log.info("이벤트 사진" + eventPic);
		
		if(eventPic != null) {
			m.addAttribute("eventPic", eventPic);
		}
		m.addAttribute("bdto", bdto);
		m.addAttribute("RelationImgList", relationImgList);
	}
	

	  @DeleteMapping(value="/file/{uuid}", produces = {MediaType.TEXT_PLAIN_VALUE})
	  public ResponseEntity<String> deleteBookImg(@PathVariable("uuid")String
	  uuid){ log.info("uuid" + uuid); return bsv.deleteBookImg(uuid) > 0 ? new
	  ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>("0",
	  HttpStatus.INTERNAL_SERVER_ERROR); }

	
	
	  @GetMapping("/search")
	   public String searchlist(@RequestParam("keyword")String keyword, Model m) {
	      log.info("입력된 keyword 값 : "+keyword);
	      m.addAttribute("keyword", keyword);
	      List<BookDTO> list = new ArrayList<> (); 
	      list = bsv.GetSearchList(keyword);
	      if(list == null) { // 검색된 내용 없음
	         
	    	 List<BookDTO> topsale = bsv.GetTopSaleAmountList(); // 전체판매량 1~5위 리스트
	         m.addAttribute("topsale",topsale);
	         log.info(">>>>>>>추천해줄 판매량순 리스트 사이즈 : "+topsale.size() );
	      }else { // 검색된 내용 있음         
	         log.info(">>>>>>>>검색된 만화책 리스트 : "+list.toString());
	         m.addAttribute("list",list);
	      }
	      return "/book/searchlist";
	   }

	
}
