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
public class BookImgVO {
	/*
create table bookImg(
uuid varchar(256) not null,
saveDir varchar(256) not null,
fileName varchar(256) not null,
fileType tinyint(1) default 0,
bno int,
fileSize int,
regDate datetime default now(),
primary key(uuid));*/
	
	
	private String uuid;
	private String saveDir; // 저장경로
	private String fileName;
	private int fileType;
	private int bno;
	private long fileSize;
	private String regDate;
}
