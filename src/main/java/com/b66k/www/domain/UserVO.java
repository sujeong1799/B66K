package com.b66k.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {

	private String id; // 사용자id
	private String pw; // 사용자pw
	private String email; // 사용자email
	private String nickname; // 사용자 닉네임
	private String birth; // 사용자 생년월일
	private String role; // 사용자 역할(관리자, 사용자)
	private String regDate;
	private String uuid;
}
