package com.b66k.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BookOrderDTO {
	
	private BookOrderVO bovo;
	private List<BookOrderItemsDTO> boidto;
}