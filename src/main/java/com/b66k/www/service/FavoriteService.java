package com.b66k.www.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.b66k.www.domain.FavoriteDTO;
import com.b66k.www.domain.FavoriteVO;

public interface FavoriteService {
	
	public List<FavoriteDTO> GetList(String id);

	public int Register(int bno, String id);

	public int Delete(int fno);
	
}
