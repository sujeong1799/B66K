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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.b66k.www.domain.ReviewVO;
import com.b66k.www.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/review/*")
@Controller
public class ReviewController {

		@Inject
		private ReviewService rsv;
		
		
		@PostMapping(value="/post", consumes = "application/json",
				 produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> post(@RequestBody ReviewVO rvo){
			log.info(">>> rvo : "+rvo);
			
			//DB 연결하기
			int isOk = rsv.register(rvo);
			
			return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK)
					: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);	
		}
		
		@GetMapping(value = "/{bno}", produces = { MediaType.APPLICATION_JSON_VALUE })
		public ResponseEntity<List<ReviewVO>> spread(@PathVariable("bno") int bno){
			log.info(">>> Review List bno >>"+ bno );
			
			//DB요청
			List<ReviewVO> list = rsv.getList(bno);
			
			return new ResponseEntity<List<ReviewVO>>(list, HttpStatus.OK);
		}
		
		// 테스트 
		@GetMapping(value = "/reviews", produces = { MediaType.APPLICATION_JSON_VALUE })
		public ResponseEntity<List<ReviewVO>> getAllReviews(){
		    log.info(">>> All Review List");
		    
		    //DB요청 - 모든 리뷰를 가져오는 메서드를 호출합니다.
		    List<ReviewVO> list = rsv.getAllReviews();
		    
		    return new ResponseEntity<List<ReviewVO>>(list, HttpStatus.OK);
		}
		
		

		@DeleteMapping(value="/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> remove(@PathVariable("rno") int rno){
			log.info(">>> remove rno > "+ rno);
			int isOk = rsv.remove(rno);
			if(isOk > 0) {
				return new ResponseEntity<String>("1", HttpStatus.OK);

			}else {
				return new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		
		/* 흠.. */


}
