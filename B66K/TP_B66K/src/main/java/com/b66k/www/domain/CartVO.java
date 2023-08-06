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
public class CartVO {
	//create table cart(
//	id varchar(100) not null,
//	bno int not null,
//	title varchar(100),
//	price int,
//	author varchar(100),
//	count int
//	);
	private int cno;
	private String id; // 사용자 id
	private int bno; // 책 번호
	private String title; // 책 제목
	private int price; // 책 가격
	private String author; // 책 작가
	private int count; // 책 수량
}
