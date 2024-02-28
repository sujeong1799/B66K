package com.b66k.www;

import javax.inject.Inject;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.b66k.www.domain.BookVO;
import com.b66k.www.repository.BookDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
public class BookTest {
	
	@Inject
	private BookDAO bdao;
	
	public void registerBoard() {
		log.info("Test Register in");
		for(int i = 6; i< 37; i++) {
			BookVO bvo = new BookVO();
			bvo.setTitle("나의 히어로 아카데미아 " + i);
			bvo.setAuthor("호리코시 코헤이");
			bvo.setPrice(6000);
			bvo.setAmount(20);
			
			bdao.register(bvo);
		}
	}
	

}
