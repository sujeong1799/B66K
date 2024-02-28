package com.b66k.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.b66k.www.domain.BookVO;
import com.b66k.www.domain.FavoriteVO;

public interface FavoriteDAO {

	public List<FavoriteVO> GetList(String id);

	public int Register(@Param("bvo")BookVO bvo, @Param("id")String id);

	public int Check(@Param("bno")int bno, @Param("id")String id);

	public int Delete(int fno);

}
