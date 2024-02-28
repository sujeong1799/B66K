package com.b66k.www.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.b66k.www.domain.UserDTO;
import com.b66k.www.domain.UserImgDTO;
import com.b66k.www.domain.UserImgVO;
import com.b66k.www.domain.UserVO;
import com.b66k.www.repository.UserDAO;
import com.b66k.www.repository.UserImgDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

   @Inject
   private UserDAO udao;
   
   @Inject
   private UserImgDAO uidao;

   @Autowired
   private BCryptPasswordEncoder passwordencoder;

   @Autowired
   private JavaMailSender javaMailSender;


   private int authNumber;
   
      
   @Override
   public int signup(UserVO uvo) {
      log.info("▶▶▶▶▶ signup service in");
      
      UserVO tUser = udao.getUser(uvo.getId());
      
      if(tUser != null) {
         return 0;
      }
      
      if(uvo.getId() == null || uvo.getId() == ""|| uvo.getId().length() == 0) {
         return 0;
      }
      
      if(uvo.getPw() == null || uvo.getPw().length() == 0) {
         return 0;
      }
      
      String pw = uvo.getPw();
      String encodePw = passwordencoder.encode(pw);
      
      uvo.setPw(encodePw);
      
      int isOk = udao.insertUser(uvo);
      
      return isOk;
      }



   @Override
   public UserVO isUser(String id, String pw) {
      log.info(" >>>>>> login Service");

         log.info(">> login service 진입");
         UserVO user = udao.getUser(id);
         
         if(user == null) {
            return null;
         }
         
         if(passwordencoder.matches(pw, user.getPw())) {
            log.info("비밀번호 일치");
            return user;
         }else {
            
            return null;
         }
   }

//아이디중복확인
   @Override
   public int idCheck(String id) {
      int result = udao.idCheck(id);
      return result;
   }

   //닉네임중복확인
   @Override
   public int nicknameCheck(String nickname) {
      log.info(">>>> nickname check service >>>>");
      int result = udao.nicknameCheck(nickname);
      return result;
   }

   //이메일 중복확인
   @Override
   public int emailCheck(String email) {
      log.info(">>>> email check service >>>> ");
      int result = udao.emailCheck(email);
      return result;
   }
   
   //이메일 인증부분
   @Override
   public void randomNum() {
      
      Random random = new Random();
      int Num = random.nextInt(888888)+111111;
      log.info(">>>>>>>>>>>>>>>>>>Num>>>"+Num);
      
      authNumber = Num;
      
   }
   
   //메일 양식
   @Override
   public String emailAuth(String emailAddress) {
      
      randomNum();
      
      String email = emailAddress;
      String title = "B66K 회원가입 인증메일입니다.";
      String content = "안녕하세요. B66K입니다." + "<br>"
                  +"B66K를 방문해주셔서 감사합니다." + "<br><br>"
                  +"회원가입을 위한 인증번호는  "+authNumber+"  입니다."+"<br><br>"
                  +"해당 인증번호를 인증번호 확인란에 입력해주세요. 감사합니다.";
      sendEmail(content, email, title);
      
      return Integer.toString(authNumber);
   }

   //메일
   @Override
   public void sendEmail(String content, String email, String title) {
      
      MimeMessage mimeMessage = javaMailSender.createMimeMessage();
      
      try {
         MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
         helper.setTo(email);
         helper.setSubject(title);
         helper.setText(content, true);
         
         javaMailSender.send(mimeMessage);
         
      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
   }

   //pw가져오기
   /*
    * @Override public String getPw(UserVO loginUser) {
    * log.info(">>>>>>user password service");
    * 
    * return udao.getPw(loginUser); }
    */
   
   @Override
   public String getPw(UserDTO loginUser) {
      log.info(">>>>>>user password service");
      
      return udao.getPw(loginUser);
   }

   //유저삭제
   @Override
   public int deleteUser(String id) {
      log.info(">>>>user delete service");
      return udao.deleteUser(id);
   }

   //유저전체리스트
   @Override
   public List<UserVO> userList() {
      log.info(">>>>user list service");
      return udao.userList();
   }

   //해당유저정보
   @Override
   public List<UserVO> getList(String id) {
      log.info(">>>>user information service");
      return udao.userInfo(id);
   }

   //유저정보 업데이트
   @Override
   public int updateUser(UserVO uvo) {
      log.info(">>>>user information update service"+uvo);
      
      String rawPw = uvo.getPw(); //원래비밀번호 가져오기
      String encPw = passwordencoder.encode(rawPw); //암호화한거
      log.info("rawPw : "+rawPw);      
      log.info("encPw :"+encPw);

      if(uvo.getPw().equals("")) {
         UserVO user = udao.getUser(uvo.getId()); 
         encPw = user.getPw();
         uvo.setPw(encPw);
         
         log.info("패스워드 빈값 >>>"+encPw);
         
      }else {
         uvo.setPw(encPw);
         
         log.info("패스워드빈값 아님"+encPw);
         
         
      }

      int isOk = udao.updateUser(uvo);
      log.info(isOk>0?"업데이트성공":"업데이트실패");
      
      return isOk;
   }

   //아이디찾기
   @Override
   public UserVO IdSearch(UserVO uvo) {
      log.info(">>>>user id search service~");
      return udao.searchID(uvo);
   }

   //아이디찾기 이메일
   @Override
   public String searchIdmail(String email) {
      randomNum();
      
      String userEmail = email;
      String title = "B66K 아이디찾기 인증메일입니다.";
      String content = "안녕하세요? B66K입니다." + "<br>"
                  +"아이디를 찾기 위한 인증번호는  "+authNumber+"  입니다."+"<br><br>"
                  +"해당 인증번호를 인증번호 확인란에 입력해주세요. 감사합니다.";
      sendEmail(content, userEmail, title);
      
      return Integer.toString(authNumber);
   }


   //아이디 찾기 이메일
   @Override
   public void searchIDsendEmail(String content, String email, String title) {
      MimeMessage mimeMessage = javaMailSender.createMimeMessage();
      
      try {
         MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
         helper.setTo(email);
         helper.setSubject(title);
         helper.setText(content, true);
         
         javaMailSender.send(mimeMessage);
         
      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
      
   }

   //아이디찾기 아이디뿌리기
   @Override
   public List<UserVO> findIDResult(String email) {
      log.info(">>>>> id search service ~> findd service >>>> ");
      return udao.findIDResult(email);
   }



   @Override
   public UserVO PwSearch(UserVO uvo) {
      log.info(">>>>user pw search service~");
      return udao.searchPw(uvo);
   }


   //비밀번호 찾기 이메일 양식
   @Override
   public String searchPwmail(String email) {
      randomNum();
      
      String userEmail = email;
      String title = "B66K 비밀번호찾기 인증메일입니다.";
      String content = "안녕하세요? B66K입니다." + "<br>"
                  +"비밀번호를 찾기 위한 인증번호는  "+authNumber+"  입니다."+"<br><br>"
                  +"해당 인증번호를 인증번호 확인란에 입력해주세요. 감사합니다.";
      sendEmail(content, userEmail, title);
      
      return Integer.toString(authNumber);
   }


   //비밀번호 찾기 이메일 보내기
   @Override
   public void searchPwsendEmail(String content, String email, String title) {
      MimeMessage mimeMessage = javaMailSender.createMimeMessage();
      
      try {
         MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
         helper.setTo(email);
         helper.setSubject(title);
         helper.setText(content, true);
         
         javaMailSender.send(mimeMessage);
         
      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
      
   }



   @Override
   public int setPwByEmail(String email, String pw) {
      UserVO user = udao.getEmailUser(email);
      log.info("비밀번호 수정하려는 유저는 ?!?!?!?! >>>"+email);
      
      if(user != null) {
         
         String rawPw = pw;
         String encPw = passwordencoder.encode(rawPw);
         
         log.info("비밀번호는?!?!?!?!?!? rawPw>>"+rawPw);
         log.info("암호화된 비번은?!?!?!?!?!?! encPw"+encPw);
         user.setPw(encPw);
         
         udao.setPw(user);
      
         return 1;
      }
      return 0;
   }


   //유저프로필사진 등록
   @Override
   public int userImgRegister(UserImgDTO uidto) {
      log.info("userProfile register service in!!!");
      log.info(">>>>>>>>>>>>>>>"+uidto.getFlist().toString());
      int isOk = 1;
      if(uidto.getFlist() == null) {
         isOk*=1;
      }else {
         if(isOk>0 && uidto.getFlist().size()>0) {
            
            for(UserImgVO uivo : uidto.getFlist()) {
               isOk *= uidao.userImgRegister(uivo);
            }
         }
      }
      return isOk;
   }



   @Override
   public List<UserImgDTO> getCharacterList() {

      
         log.info("character list service~~");

         List<UserImgDTO> list = new ArrayList<>();

         String title = "히로아카";
         List<UserImgVO> imgList = uidao.getCharacterList(title);
         UserImgDTO dto = new UserImgDTO(title, imgList);
         list.add(dto);
         log.info("가져온 리스트: " + list.toString());
         
         title = "화산귀환";
         imgList = uidao.getCharacterList(title);
         dto = new UserImgDTO(title, imgList);
         list.add(dto);
         log.info("가져온 리스트: " + list.toString());
         
         title = "헌터헌터";
         imgList = uidao.getCharacterList(title);
         dto = new UserImgDTO(title, imgList);
         list.add(dto);
         log.info("가져온 리스트: " + list.toString());

         title = "주술회전";
         imgList = uidao.getCharacterList(title);
         dto = new UserImgDTO(title, imgList);
         list.add(dto);
         log.info("가져온 리스트: " + list.toString());
         
         title = "나루토";
         imgList = uidao.getCharacterList(title);
         dto = new UserImgDTO(title, imgList);
         list.add(dto);
         log.info("가져온 리스트: " + list.toString());

         title = "최애의아이";
         imgList = uidao.getCharacterList(title);
         dto = new UserImgDTO(title, imgList);
         list.add(dto);
         log.info("가져온 리스트: " + list.toString());
         
         log.info(">>> 캐릭터 리스트 size: " + list.size());
         return list;
      
   }



   @Override
   public List<UserImgVO> getUserImgList() {
      // TODO Auto-generated method stub
      return null;
   }



   @Override
   public List<UserImgVO> getImgList(String fileName1) {
      // TODO Auto-generated method stub
      return null;
   }



   @Override
   public UserImgVO getUserImg(String uuid) {
      
      return uidao.getUserImg(uuid);
   }



   //삭제할거야 임시!!!!!!!!!
   @Override
   public List<UserImgVO> ImgTmpList() {
      // TODO Auto-generated method stub
      return uidao.getTmpImgList();
   }



   
   
   
   
   

}