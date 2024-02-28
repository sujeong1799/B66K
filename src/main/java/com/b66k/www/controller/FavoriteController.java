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
import org.springframework.web.bind.annotation.RequestMapping;

import com.b66k.www.domain.FavoriteDTO;
import com.b66k.www.domain.UserDTO;
import com.b66k.www.service.FavoriteService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/favorite/*")
@Controller
public class FavoriteController {
	
	@Inject
	private FavoriteService fsv;
	
	// 찜목록 보기(getmapping으로 뿌려주기)
	@GetMapping("list")
	public String GetList(Model m, HttpServletRequest request) {
		UserDTO udto = (UserDTO)request.getSession().getAttribute("ses");
		String id = udto.getUvo().getId();		
		log.info("로그인 세션 ID : "+id);
		List<FavoriteDTO> list = fsv.GetList(id);
		log.info("가져온 DTO LIST  : "+ list);
		if(list.size() < 1) {
			m.addAttribute("favoritelist_msg", 0);
			
		}else {			
			m.addAttribute("list" , list);
		}
		return "/favorite/list";
	}
	
	//책 상세내용에서 찜 버튼 누르면 찜 담기(비동기로 bno 보내고 세션 아이디 가져와서 DB에 저장) + serviceImpl에서 중복검사
	@GetMapping(value="/{bno}" ,produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> Register(@PathVariable("bno")int bno, HttpServletRequest request){
		UserDTO udto = (UserDTO)request.getSession().getAttribute("ses");
		String id = udto.getUvo().getId();		
		log.info(">>> bno : "+ bno);
		log.info(">>> id : "+ id);
		return fsv.Register(bno, id) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK) : 
					new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 찜 물품 삭제(delete mapping)
	@DeleteMapping(value="/{fno}")
	public ResponseEntity<String> Delete(@PathVariable("fno") int fno){ 
		log.info(">>>> fno : "+ fno);
		int isOk = fsv.Delete(fno);
		return isOk> 0? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
