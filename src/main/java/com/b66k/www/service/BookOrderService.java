package com.b66k.www.service;

import java.util.List;

import com.b66k.www.domain.BookOrderDTO;
import com.b66k.www.domain.BookOrderVO;
import com.b66k.www.domain.PagingVO;

public interface BookOrderService {

	int Order(BookOrderVO bovo);

	List<BookOrderDTO> getorderlist(String id);

	BookOrderDTO getorderdetail(int ono);

	int ordercancle(int ono);

	int ordermodify(BookOrderVO bovo);

	List<BookOrderDTO> getallorderlist();

	List<BookOrderDTO> getallorderlist(PagingVO pvo);


	int totalCount(PagingVO pvo);

}
