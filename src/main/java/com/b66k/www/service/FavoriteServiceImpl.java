package com.b66k.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.b66k.www.domain.BookImgVO;
import com.b66k.www.domain.BookOrderDTO;
import com.b66k.www.domain.BookVO;
import com.b66k.www.domain.FavoriteDTO;
import com.b66k.www.domain.FavoriteVO;
import com.b66k.www.repository.BookDAO;
import com.b66k.www.repository.BookImgDAO;
import com.b66k.www.repository.FavoriteDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FavoriteServiceImpl implements FavoriteService{
	
	@Inject
	private FavoriteDAO fdao;
	
	@Inject
	private BookDAO bdao;
	
	@Inject
	private BookImgDAO bidao;
	
	@Override
	public List<FavoriteDTO> GetList(String id) {
		// fdto 구성 : fvo, bivo
		log.info(">>> FavoriteListDAO 진입");
		List<FavoriteDTO> fdto = new ArrayList<FavoriteDTO> ();
		List<FavoriteVO> list = fdao.GetList(id);
		for(FavoriteVO fvo : list) {
			int bno = fvo.getBno();
			BookImgVO bivo = bidao.getImgList(bno);
			fdto.add(new FavoriteDTO(fvo,bivo));
		}
		log.info(">>> FavoriteDTO List " + fdto.toString());
		return fdto;
	}

	@Override
	public int Register(int bno, String id) {
		log.info(">>> FavoriteRegisterDAO 진입");
		if(fdao.Check(bno,id) > 0) { // 체크하고 1개 나오면 그건 등록안하고 리턴
			log.info("찜목록에 이미 동일한 항목 있음");
			return 0;
		}else {			
			BookVO bvo = bdao.detail(bno);
			log.info("가져온 bvo : " + bvo.toString());
			int isOk = fdao.Register(bvo, id);
			log.info(isOk > 0 ? "찜 성공" : "찜 실패");
			return isOk;
		}
	}

	@Override
	public int Delete(int fno) {
		log.info(">>> FavoriteDeleteDAO 진입");
		int isOk = fdao.Delete(fno);
		log.info(isOk > 0 ? "찜 삭제 성공" : "찜 삭제 실패");
		return isOk;
	}

}
