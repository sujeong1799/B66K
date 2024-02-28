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
public class QuestionImgVO {


	   private String uuid;
	   private String saveDir;
	   private String fileName;
	   private int fileType;
	   private int qno;
	   private long fileSize;
	   private String regDate;
	   

}
