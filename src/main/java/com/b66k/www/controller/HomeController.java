package com.b66k.www.controller;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.b66k.www.domain.BookDTO;
import com.b66k.www.service.BookService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
   
   @Inject
   private BookService bsv;
   
   
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Model m) {
		
	      LocalDate now = LocalDate.now(); // 연도, 월, 일
	      int dayOfMonth = now.getDayOfMonth(); // 오늘 며칠인지
	      
	      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
	      String formatedNow = now.format(formatter); // String 형태의 yyyy-MM 저장
	      String date="";
	      List<BookDTO> salelist = new ArrayList<>();
	      
	      if(dayOfMonth > 15) { // 15일이 넘어갔으면 이번달의 신작
	         date=formatedNow;
	         log.info(">>>>>>>>현재 년월 출력 : "+ date);
	         
	         List<BookDTO> monthlylist = bsv.MonthlyNewList(date); // 이번달 신작
	         salelist = bsv.GetSaleRankingList(date); // 이번달 월간 판매량 (주문내역기준)
	         log.info("가져온 MonthlyList >>>> "+ monthlylist.size());
	         
	         m.addAttribute("monthlylist", monthlylist); // 신작
	         
	      }else { // 15일이 안넘어갔으면 지난달의 신작
	         LocalDate onemonthago = now.minusMonths(1);
	         String formatedOneMonthAgo = onemonthago.format(formatter);
	         date=formatedOneMonthAgo;
	         log.info(">>>>>>>>지난달 년월 출력 : "+date);
	         List<BookDTO> monthlylist = bsv.MonthlyNewList(date); // 지난달 신작
	         salelist = bsv.GetSaleRankingList(date); // 지난달 월간 판매량 (주문내역기준)
	         log.info("가져온 monthlylist >>>> "+ monthlylist.size());
	         m.addAttribute("monthlylist", monthlylist);
	      }
	         List<BookDTO> ratinglist = bsv.GetRatingRankingList(); // 전체평점
	         
	         List<BookDTO> reviewlist = bsv.GetReviewRankingList(); // 리뷰많은순위	         
	         
	         log.info("가져온 salelist >>>> "+ salelist.size());
	         log.info("가져온 ratinglist >>>> "+ ratinglist.size());
	         log.info("가져온 reviewlist >>>>" + reviewlist.size());
	         
	         
	         m.addAttribute("salelist",salelist); // 판매량
	         m.addAttribute("ratinglist",ratinglist); // 평점순
	         m.addAttribute("reviewlist",reviewlist); // 리뷰순
	         //home.jsp에 뿌려지는 attribute "monthlylist", "salelist", "ratinglist"
	      return "home";
	      
   }
   
   
   
}