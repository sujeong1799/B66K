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
public class BookDTO {
	private BookVO bvo;
	private BookImgVO bivo;
}
