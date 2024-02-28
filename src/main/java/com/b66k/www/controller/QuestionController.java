package com.b66k.www.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.b66k.www.domain.PagingVO;
import com.b66k.www.domain.QuestionDTO;
import com.b66k.www.domain.QuestionImgVO;
import com.b66k.www.domain.QuestionVO;
import com.b66k.www.handler.PagingHandler;
import com.b66k.www.handler.qnaFileHandler;
import com.b66k.www.service.QuestionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/question/*")
@Controller

public class QuestionController {
	
	@Inject
	private QuestionService qsv;
	

	@Inject
	private qnaFileHandler fhd;
	
	@GetMapping("/register")
	public String register() {	
		return "/question/register";
	}
	
	@PostMapping("/register")
	public String registerPost(QuestionVO qvo, RedirectAttributes rAttr,
			@RequestParam(name="files", required=false)MultipartFile[] files) {
		
		log.info(">>> qvo >" + qvo.toString()); 
		log.info("★★★★★★"+files.toString());
		List<QuestionImgVO> flist = null;
		
		
		if(files[0].getSize()>0) { 

			flist = fhd.uploadFiles(files);
		}else{
			log.info("file null");
		}
		
			
		QuestionDTO qdto = new QuestionDTO(qvo,flist);
		int isOk = qsv.register(qdto);
		
		
		
		log.info(">> question register >> " + (isOk > 0 ? "OK" : "FAIL"));
		
		rAttr.addAttribute("isOk", isOk);
		return "redirect:/question/list";
	}
	
	
	
	
	@GetMapping("/list") 
	public String listPost(Model m, PagingVO pvo) {
		log.info(">>> pagevo : " + pvo);
		
		List<QuestionVO> list = qsv.list(pvo);
		m.addAttribute("list", list);
		
		int totalCount = qsv.getTotalCount(pvo);
		PagingHandler ph = new PagingHandler(pvo, totalCount);
		m.addAttribute("ph", ph);
	
		return "/question/list";
	}

	
	
	

	
	@GetMapping("/detail")
	public void detail(Model m, @RequestParam("qno")int qno) {
		log.info(">> qno >>"+qno);
		//QuestionVO qvo= qsv.detail(qno);
		QuestionDTO qdto = qsv.detailImg(qno);
		log.info("qdto > " + qdto.getQvo());
		log.info("qdto > " + qdto.getFlist());
		
		//log.info("qvo" + qvo.toString());
		
		m.addAttribute("QuestionDTO",qdto);

	   }
	
	
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam("qno") int qno,RedirectAttributes rAttr, HttpServletRequest request) {
		
		log.info(">>qno>" + qno);
		int isOk = qsv.delete(qno);
		log.info(">>글 삭제>>" +(isOk >0 ? "성공" : "실패"));
		return "redirect:/question/list";
		
	}
	
	@DeleteMapping(value="/file/{uuid}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeFile(@PathVariable("uuid")String uuid){
		log.info(">>> uuid" + uuid);
		return qsv.removeFile(uuid) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) :
	         new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	


	
	
}

	
	
	
	

