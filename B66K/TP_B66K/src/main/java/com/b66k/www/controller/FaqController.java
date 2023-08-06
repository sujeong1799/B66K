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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.b66k.www.domain.FaqVO;
import com.b66k.www.domain.PagingVO;
import com.b66k.www.handler.PagingHandler;
import com.b66k.www.service.FaqService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/faq/*")
@Controller
public class FaqController {
	
	@Inject
	private FaqService fsv;
	
	
	@GetMapping("/register")
	public String register() {	
		return "/faq/register";
	}
	
	@PostMapping("/register")
	public String registerPost(FaqVO fqvo, RedirectAttributes rAttr,
			@RequestParam(name="files", required=false)MultipartFile[] files) {
		
		log.info(">>> fqvo >" + fqvo.toString()); 
		int isOk = fsv.register(fqvo);

		log.info(">> FAQ register >> " + (isOk > 0 ? "OK" : "FAIL"));
		
		rAttr.addAttribute("isOk", isOk);
		return "redirect:/faq/list";
	}

	
	@GetMapping("/list") 
	public String listPost(Model m, PagingVO pvo) {
		log.info(">>> pagevo : " + pvo);
		
		List<FaqVO> list = fsv.list(pvo);
		m.addAttribute("list", list);
		log.info(">>> 가져온list : " + list);
		int totalCount = fsv.getTotalCount(pvo);
		PagingHandler ph = new PagingHandler(pvo, totalCount);
		m.addAttribute("ph", ph);
	
		return "/faq/list";
	}
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam("fno") int fno, RedirectAttributes rAttr, HttpServletRequest request) {
		
		log.info(">>fno>" + fno);
		int isOk = fsv.delete(fno);
		log.info(">>글 삭제>>" +(isOk >0 ? "성공" : "실패"));
		return "redirect:/faq/list";
		
	}
	
	
	
	
}
