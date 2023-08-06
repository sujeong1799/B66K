package com.b66k.www.service;

import java.util.List;
import java.util.Map;

import com.b66k.www.domain.BookOrderItemVO;
import com.b66k.www.domain.CartDTO;
import com.b66k.www.domain.CartVO;


public interface CartService {

	List<CartDTO> GetList(String id);

	int Register(CartVO cvo);

	int Delete(int cno, String id);

	int changeCount(CartVO cvo);

	void cleanList(String id);

	Map<String, Integer> AmountCheck(String id);

}
