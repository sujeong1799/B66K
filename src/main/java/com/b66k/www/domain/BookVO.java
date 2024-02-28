package com.b66k.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BookVO {
	
	private int bno;
	private String author; // 작가
	private String title;
	private String content;
	private int price;
	private double ratingAvg; // 평점
	private int amount; // 재고
	private int saleAmount; // 판매량
	private String regDate;
	private String releaseDate; // 발매일
	private String intro; // 책 소개
	private String contentPage; // 목차
	

}
