package com.b66k.www.repository;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.b66k.www.domain.BookOrderDTO;
import com.b66k.www.domain.BookOrderItemVO;
import com.b66k.www.domain.BookOrderVO;
import com.b66k.www.domain.PagingVO;

public interface BookOrderDAO {

	int registerOrder(BookOrderVO bookorder);

	int selectOno();

	int registerOrderItems(BookOrderItemVO tmp);

	List<BookOrderVO> getOrderList(String id);

	List<BookOrderItemVO> getOrderItems(int ono);

	BookOrderVO getorder(int ono);

	int ordercancle(int ono);

	int ordermodify(BookOrderVO bovo);

	List<BookOrderVO> getAllOrderList();

	void saleAmountMinus(@Param("bno")int bno, @Param("count")int count);

	void saleAmountPlus(@Param("bno")int bno, @Param("count")int count);

	List<BookOrderVO> selectListPaging(PagingVO pvo);

	int totalCount(PagingVO pvo);



	

}
