package com.b66k.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.b66k.www.domain.BookOrderItemVO;
import com.b66k.www.domain.CartVO;

public interface CartDAO {

	List<CartVO> GetList(String id);

	int Register(CartVO cvo);

	int Delete(@Param("cno")int cno, @Param("id")String id);

	int changeCount(CartVO cvo);

	List<BookOrderItemVO> GetListTobookorder(String id);

	int cleanList(String id);

	int Check(@Param("bno")int bno, @Param("id")String id);


	
}
