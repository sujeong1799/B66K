package com.b66k.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BookOrderVO {

	private int ono;
	private String id;
	private int total; // 총금액
	private String name; // 수령인 이름
	private String addressCode; // 우편주소
	private String addressJuso; // 도로명주소
	private String addressDetail; // 상세주소
	private String payType; // 결제방법
	private String orderStatus; // 주문상태(주문대기 & 주문완료 & 주문취소)
	private String etc; // 요청사항
	private String orderDate;
	
}
