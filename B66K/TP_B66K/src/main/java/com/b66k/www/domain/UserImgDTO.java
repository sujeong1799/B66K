package com.b66k.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class UserImgDTO {

//	private UserImgVO uivo;
	private String title; 
//	private List<UserImgVO> imglist;
	private List<UserImgVO> flist;
	
    public UserImgDTO(List<UserImgVO> flist) {
        this.flist = flist;
    }
	
}
