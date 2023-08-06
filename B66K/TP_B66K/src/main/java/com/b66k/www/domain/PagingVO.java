package com.b66k.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class PagingVO {
	
	private int pageNo;
	private int qty;
	
	private String type;
	private String keyword;
	
	public PagingVO() {
		this(1, 10);
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	public int getPageStart() {
		return(this.pageNo-1)*qty;
	}
	
	public String[] getTypeToArray() {
		// 타입이 널이면 스트링 배열에 값이 없는걸로 처리함.
		return this.type == null ? new String[] {} : this.type.split("");
	}
	

	
}
