package com.b66k.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserImgVO {
	
//	create table userimg(
//			uuid varchar(256) not null,
//			saveDir varchar(256) not null,
//			fileName varchar(256) not null,
//			fileType tinyint(1) default 0,
//			pno int,
//			fileSize int,
//			primary key(uuid));
	
	
	private String uuid;
	private String saveDir;
	private String fileName;
	private int fileType;
	private int pno;
	private long fileSize;
	

}
