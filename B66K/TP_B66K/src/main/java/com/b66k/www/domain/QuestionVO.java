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
public class QuestionVO {

	private int qno;
	private  String id;
	private  String title;
	private  String content;
	private String regDate;
	private String isDel;
	
}
