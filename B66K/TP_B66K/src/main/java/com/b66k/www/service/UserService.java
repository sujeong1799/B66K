package com.b66k.www.service;

import java.util.List;

import com.b66k.www.domain.UserDTO;
import com.b66k.www.domain.UserImgDTO;
import com.b66k.www.domain.UserImgVO;
import com.b66k.www.domain.UserVO;

public interface UserService {


	int signup(UserVO uvo);

	UserVO isUser(String id, String pw);

	//아이디중복확인
	int idCheck(String id);
	
	//닉네임 중복확인
	int nicknameCheck(String nickname);
	
	//이메일 중복확인
	int emailCheck(String email);

	//이메일 인증(양식만들기)
	
	String emailAuth(String emailAddress);

	//난수생성
	void randomNum();
	
	
	//메일발송메서드
	void sendEmail(String content, String email, String title);

	/* String getPw(UserVO loginUser); */
	
	String getPw(UserDTO loginUser);

	

	int deleteUser(String id);

	List<UserVO> userList();

	List<UserVO> getList(String id);

	int updateUser(UserVO uvo);
	
	//아이디 찾기
	UserVO IdSearch(UserVO uvo);

	//아이디찾기 이메일 양식
	String searchIdmail(String email);
	
	//아이디찾기 이메일발송
	void searchIDsendEmail(String content, String email, String title);

	//이멜-> 아이디찾기 결과뿌리기
	List<UserVO> findIDResult(String email);

	//비밀번호찾기
	UserVO PwSearch(UserVO uvo);

	//비밀번호 메일양식
	String searchPwmail(String email);

	//비밀번호찾기 이메일 발송
	void searchPwsendEmail(String content, String email, String title);
	
	//비밀번호 변경
	int setPwByEmail(String email, String pw);

	//유저 프로필사진 등록
	int userImgRegister(UserImgDTO uidto);

	//유저 프로필사진 리스트
	List<UserImgVO> getUserImgList();

	List<UserImgVO> getImgList(String fileName1);

	List<UserImgDTO> getCharacterList();

	UserImgVO getUserImg(String uuid);

	//임시임시삭제할거임
	
	List<UserImgVO> ImgTmpList();
	

}