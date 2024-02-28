package com.b66k.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class FaqVO {
	
	/*
	 * create table faq( 
	 * fno int auto_increment not null 
	 * title varchar(256), 
	 * content text, );
	 */
	
	private int fno;
	private String title;
	private String content;
	private String isDel;

}
