package com.b66k.www.repository;

import java.util.List;

import com.b66k.www.domain.UserDTO;
import com.b66k.www.domain.UserVO;

public interface UserDAO {

	UserVO getUser(String id);

	int insertUser(UserVO uvo);

	int idCheck(String id);

	int nicknameCheck(String nickname);

	int emailCheck(String email);

	String getPw(UserDTO loginUser);

	int deleteUser(String id);

	List<UserVO> userList();

	List<UserVO> userInfo(String id);

	int updateUser(UserVO uvo);

	UserVO searchID(UserVO uvo);

	List<UserVO> findIDResult(String email);

	UserVO searchPw(UserVO uvo);

	int setPw(String email);

	UserVO getEmailUser(String email);

	void setPw(UserVO user);
}