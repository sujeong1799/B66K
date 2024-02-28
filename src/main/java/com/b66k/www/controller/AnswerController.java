package com.b66k.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.b66k.www.domain.AnswerVO;
import com.b66k.www.service.AnswerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/answer/*")
@Controller
public class AnswerController {

	@Inject
	private AnswerService asv;
	
	
	@PostMapping(value= "/post", consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> post(@RequestBody AnswerVO avo){
		
		   int isOk = asv.postAnswer(avo);
		   	   
		   return isOk > 0 ? new ResponseEntity<String>("1",HttpStatus.OK)
				   : new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	
	
	
	   @GetMapping(value="/{qno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	   public ResponseEntity<List<AnswerVO>> spread(@PathVariable("qno")int qno){
		   log.info(">> Answer List qno >>"+qno);
		   //DB요청
		   List<AnswerVO> list = asv.getList(qno);
		   return new ResponseEntity<List<AnswerVO>>(list, HttpStatus.OK);
	   }
	   

	   @PutMapping(value="/{ano}", consumes = "application/json",
			   produces= {MediaType.TEXT_PLAIN_VALUE})
	   public ResponseEntity<String> edit(@PathVariable("ano")int ano, @RequestBody AnswerVO avo){
		   
		   log.info(">>> edit ano" + ano);
		   log.info(">>> edit avo" + avo);
		   
		   int isOk = asv.edit(avo);
		   return  isOk>0?
				   new ResponseEntity<String>("1",HttpStatus.OK)
				   : new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	   
	   
	   

	   @DeleteMapping(value="/{ano}", produces = {MediaType.TEXT_PLAIN_VALUE})
	   public ResponseEntity<String> remove(@PathVariable("ano")int ano){
		   log.info(">>remove cno"+ano);
		   int isOk=asv.delete(ano);
		   return  isOk>0?
				   new ResponseEntity<String>("1",HttpStatus.OK)
				   : new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
		   
	   }

	
	
	
	
	
	
	
	
	
}
