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
public class ReviewVO {
	
	/*
create table review(
rno int auto_increment not null,
bno int not null,
id varchar(100) not null,
content text,
reg_date datetime default now(),
rating double default 0,
primary key(rno));
*/
	
	private int rno;
	private int bno;
	private String id;
	private String content;
	private String regDate;
	private double rating; // 평점

}

