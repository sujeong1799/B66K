package com.b66k.www.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.b66k.www.domain.UserDTO;
import com.b66k.www.domain.UserImgDTO;
import com.b66k.www.domain.UserImgVO;
import com.b66k.www.domain.UserVO;
import com.b66k.www.handler.userImgHandler;
import com.b66k.www.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@Controller
public class UserController {

   @Inject
   private UserService usv;

   @Inject
   private BCryptPasswordEncoder passwordEncoder;

   @Inject
   private userImgHandler uih;
   

   
   @GetMapping("/signup")
   public String signupGet(Model m) {

      log.info("signup GetMapping....");

      
      List<UserImgDTO> uidto =  usv.getCharacterList();
      m.addAttribute(uidto);
      log.info("uidto>>"+uidto.toString());
      log.info("size>>>>>>>>>>>>>>>>>>>>>>>>"+uidto.size());
      
      for(UserImgDTO tmp : uidto) {
         if(tmp.getTitle() == "히로아카") {            
            m.addAttribute("hero",tmp);
         }
         if(tmp.getTitle() == "화산귀환") {            
            m.addAttribute("robb",tmp);
         }
         if(tmp.getTitle() == "헌터헌터") {            
            m.addAttribute("hunt",tmp);
         }
         if(tmp.getTitle() == "주술회전") {            
            m.addAttribute("jujutsu",tmp);
         }
         if(tmp.getTitle() == "나루토") {            
            m.addAttribute("naruto",tmp);
         }
         if(tmp.getTitle() == "최애의아이") {            
            m.addAttribute("oshinoko",tmp);
         }
         
         
      }
      
      return "/user/userJoin";

   }

   @PostMapping("/signup")
   public String signupPost(Model m, UserVO uvo, RedirectAttributes ra) {
      log.info("회원가입 >>>>> ");
      log.info("가져온 img uuid >>>>> "+uvo.getUuid());
      int isOk = usv.signup(uvo);
      if (isOk > 0) {
         m.addAttribute("msg_signup", 1);
         log.info("회원가입 성공 >>>>" + uvo.toString());
      } else {
         m.addAttribute("msg_signup", 0);
      }

      return "redirect:/";
   }

   @GetMapping("/login")
   public String loginGet() {
      return "/user/userLogin";
   }
   
 @PostMapping("/login") public String loginPost(Model m, UserVO uvo,
     HttpServletRequest request, RedirectAttributes ra) {
    
    //RedirectAttributes ra
     UserVO isUser = usv.isUser(uvo.getId(), uvo.getPw());
     
     
     log.info("로그인 접근 완료! 아이디 : " + uvo.getId() + " | 비밀번호 : " + uvo.getPw());
     
     if (isUser != null) {
        UserImgVO uivo  =usv.getUserImg(isUser.getUuid());        
        UserDTO udto = new UserDTO(isUser, uivo);
        
        HttpSession ses = request.getSession();
        ses.setAttribute("ses", udto);
        ses.setMaxInactiveInterval(60 * 10);
        log.info("@@@@@@@ses@@@@@@@" + ses.getId()); m.addAttribute("user", isUser);
        m.addAttribute("msg_login", 1); 
        log.info("성공"); 
           return "redirect:/";
     
     } else {
        m.addAttribute("msg_login", 0); 
        log.info("실패");
          return "/user/userLogin";
        }
        //return "redirect:/";
     }

   // 아이디 중복확인
   @ResponseBody
   @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
   public int idCheck(String id) {
      log.info("user id Check 진입 >>>>");

      int result = usv.idCheck(id);

      log.info("id>>>>" + id);
      log.info("결과값 >>> " + result);

      return result;
   }

   // 닉네임 중복확인
   @ResponseBody
   @RequestMapping(value = "/nicknameCheck", method = RequestMethod.POST)
   public int nicknameCheck(String nickname) {
      log.info(">>nickname check 진입 >>>");

      int result = usv.nicknameCheck(nickname);

      log.info("nickname >>>" + nickname);
      log.info("nickname 중복 결과>>" + result);

      return result;
   }

   // 이메일 중복확인
   @ResponseBody
   @RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
   public int emailCheck(String email) {
      log.info(">>> email check 진입 >>>>");
      int result = usv.emailCheck(email);
      log.info("email >>>" + email);
      log.info("email 중복 결과 >>>" + result);

      return result;
   }

   // 이메일 인증
   @ResponseBody
   @RequestMapping(value = "/mailAuthentication", consumes = MediaType.APPLICATION_JSON_VALUE)
   public ResponseEntity<String> mailAuthentication(@RequestBody HashMap<String, Object> user) {

      String email = (String) user.get("email");
      String authNum = usv.emailAuth(email);

      log.info("이메일 >>> " + user.get("email"));
      log.info("인증번호 >>>" + authNum);

      return ResponseEntity.status(HttpStatus.OK).body(authNum);
   }

   // 로그아웃
   @GetMapping("/logout")
   public String logout(Model m, HttpServletRequest request, RedirectAttributes ra) {

      request.getSession().removeAttribute("ses");
      request.getSession().invalidate();

      // m.addAttribute("msg_logout",1);
      log.info("logout");

      /* return "home"; */
      return "redirect:/";
   }

   // 탈퇴1
   @GetMapping("/delete")
   public String deleteUser() {
      log.info("user remove....>>>> ");

      return "/user/userDelete";
   }

   // 비밀번호 확인
   @ResponseBody
   @RequestMapping(value = "/pwCheck")
   public String pwCheck(@RequestParam("pw") String pw, HttpServletRequest request) {

      HttpSession ses = request.getSession();
      /* UserVO loginUser = (UserVO) ses.getAttribute("ses"); */
      
      UserDTO loginUser = (UserDTO) ses.getAttribute("ses");
      
      log.info("비밀번호 확인 => 로그인객체>>" + loginUser.toString());

      
      
      String userPw = usv.getPw(loginUser); // db에 저장된 암호화된 비번을 가꼬옴

      log.info("user의 비밀번호>>>>>" + userPw);
      log.info("입력된 비밀번호>>>>>>>>>" + pw);
      BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

      log.info("matches결과>>" + (passwordEncoder.matches(pw, userPw) ? "일치" : "불일치"));
      String result = (passwordEncoder.matches(pw, userPw) ? "1" : "0");

      log.info("비밀번호 mathch result 1:일치/0:불일치>>>>>" + result);

      return result;

   }

   // 탈퇴2 . 진짜 탈퇴..
   @GetMapping("/remove")
   public String removeUser(UserVO user, HttpServletRequest request) {
      log.info(">>>>user data remove process in... ");

      HttpSession ses = request.getSession();

      // 로그인 객체 담고..
      UserDTO loginUser = (UserDTO) ses.getAttribute("ses");

      log.info("탈퇴 => 로그인 객체 >>> " + loginUser.toString());

      String removeId = loginUser.getUvo().getId();

      log.info("탈퇴하려는 아이디 >>>> " + removeId);

      int isOk = usv.deleteUser(loginUser.getUvo().getId());

      if (isOk > 0) {
         // 연결끊어주기
         request.getSession().removeAttribute("ses");
         request.getSession().invalidate();
      } else {
         return null;
      }
      return "/user/userRemove";
   }

   // 유저 목록
   @GetMapping("/list")
   public String userList(Model m) {
      List<UserVO> userList = usv.userList();
      m.addAttribute("list", userList);
      return "/user/userList";
   }

   // 내 정보 ->해당유저 정보
   @GetMapping("/info")
   public String userInfo(Model m, HttpServletRequest request) {

      HttpSession ses = request.getSession();
           
      UserDTO udto = (UserDTO) ses.getAttribute("ses");

      
      
      return "/user/userInfo";

   }

   // 정보수정확인
   @GetMapping("/modify")
   public String userModify() {
      log.info(">>>>> user info modify password check!");
      return "/user/userModify";
   }

   // 정보수정으로 이동
   @GetMapping("/edit")
   public String userEdit(Model m, HttpServletRequest request) {
      log.info(">>>>>user info edit!!!!!");

      
      List<UserImgDTO> uidto =  usv.getCharacterList();
      m.addAttribute(uidto);
      log.info("uidto>>"+uidto.toString());
      log.info("size>>>>>>>>>>>>>>>>>>>>>>>>"+uidto.size());
      
      for(UserImgDTO tmp : uidto) {
         if(tmp.getTitle() == "히로아카") {            
            m.addAttribute("hero",tmp);
         }
         if(tmp.getTitle() == "화산귀환") {            
            m.addAttribute("robb",tmp);
         }
         if(tmp.getTitle() == "헌터헌터") {            
            m.addAttribute("hunt",tmp);
         }
         if(tmp.getTitle() == "주술회전") {            
            m.addAttribute("jujutsu",tmp);
         }
         if(tmp.getTitle() == "나루토") {            
            m.addAttribute("naruto",tmp);
         }
         if(tmp.getTitle() == "최애의아이") {            
            m.addAttribute("oshinoko",tmp);
         }
      }
      
      return "/user/userUpdate";
   }

   // 회원정보를 수정하는 부분
   @PostMapping("/edit")
   public ResponseEntity<Integer> userEditProcess(@ModelAttribute UserVO uvo, HttpServletRequest request, Model m) {
      // ModelAttribute는 jsp에서 넘어온 값들을 객체로 한번에 받을수있음..

      log.info(">>>>edit user >>>>" + uvo.toString());

      int isOk = usv.updateUser(uvo);

      if (isOk > 0) {
         log.info("user information update success");
         log.info("sesssion 변경 시작");

         HttpSession ses = request.getSession();
         log.info("바뀐 세션 정보 >>>>" + uvo);

         UserImgVO uivo = usv.getUserImg(uvo.getUuid());
         
         UserDTO udto = new UserDTO(uvo, uivo);
         
         ses.setAttribute("ses", udto);

      } else {
         log.info("user information update fail");
      }

      return ResponseEntity.status(HttpStatus.OK).body(isOk); 
   }

   // 아이디 찾기
   @GetMapping("/searchId")
   public String searchIdGet() {

      return "/user/userSearchId";
   }

   // 아이디찾기
   @ResponseBody
   @PostMapping("/searchId")
   public int searchIdPost(Model m, HttpServletRequest request, @ModelAttribute UserVO uvo) {
      UserVO user = usv.IdSearch(uvo);
      return (user != null) ? 1 : 0;
   }

   // 아이디찾기-이메일 전송
   @ResponseBody
   @RequestMapping(value = "/searchIdMail", consumes = MediaType.APPLICATION_JSON_VALUE)
   public ResponseEntity<String> searchIdMail(@RequestBody HashMap<String, Object> user) {

      String email = (String) user.get("email");
      String authNum2 = usv.searchIdmail(email);

      log.info("이메일 >>> " + user.get("email"));
      log.info("이메일 찾기 인증번호 >>>" + authNum2);

      return ResponseEntity.status(HttpStatus.OK).body(authNum2);
   }

   // 아이디찾기 -결과 뿌리기
   @GetMapping("/findID")
   public String findIDResult(@RequestParam("email") String email, Model m, UserVO uvo) {

      // UserVO isUser = usv.isUser(user.getId(), user.getPw());
      // = (uvo.getEmail());
      // usv.getEmail(email);

      List<UserVO> foundID = usv.findIDResult(email);
      log.info("찾은 결과 : " + foundID.toString());

      m.addAttribute("idResult", foundID);

      return "/user/userFindId";
   }

   // 비밀번호 찾기
   @GetMapping("/searchPw")
   public String searchPwGet() {

      return "/user/userSearchPw";
   }

   // 비밀번호 찾기
   @ResponseBody
   @PostMapping("/searchPw")
   public int searchPwPost(Model m, HttpServletRequest request, @ModelAttribute UserVO uvo) {
      UserVO user = usv.PwSearch(uvo);
      return (user != null) ? 1 : 0;
   }

   // 비밀번호 메일을 보내기
   @ResponseBody
   @RequestMapping(value = "/searchPwMail", consumes = MediaType.APPLICATION_JSON_VALUE)
   public ResponseEntity<String> searchPwMail(@RequestBody HashMap<String, Object> user) {

      String email = (String) user.get("email");
      String authNum3 = usv.searchPwmail(email);
      
      log.info("이메일 >>"+user.get("email"));
      log.info("비밀번호 찾기 인증번호 >>"+authNum3);
      
      
      return ResponseEntity.status(HttpStatus.OK).body(authNum3);
   }

   //비밀번호 재설정하기
   @GetMapping("/findPw")
   public String findPwResult(@RequestParam("email") String email, Model m, UserVO uvo) {
      log.info("pw reset&change user request >>>"+email);
      
      m.addAttribute("email", email);
      return "/user/userSetPw";
   }
   
   //비밀번호 바꾸기
   @PostMapping("/setUserPw")
   public String setUserPw(Model m, @RequestParam("email") String email, @RequestParam("pw") String pw) {
     log.info(">>>>>>>>>>>>>>>>>>" + email);

     // 해당 email을 가진 유저의 비밀번호 변경
     usv.setPwByEmail(email, pw);

     return "/home";
   }
   
   @GetMapping("/fileRegister")
   public String registerUserImgGet() {
      
      log.info("user profile Img register >> ");
      
      return "/management/profileRegister";
   }
   
   //프로필 등록
   @PostMapping("/fileRegister")
   public String registerUserImg(@RequestParam(name="files", required = false)MultipartFile[] files, Model m,
         RedirectAttributes ra) {
   
      log.info("profile register >>>>");
      
      List<UserImgVO> flist = null;
      
      if(files[0].getSize()>0) {
         flist= uih.uploadFiles(files);
         
      }else {
         log.info("file null T_T");
      }
   
      UserImgDTO uidto = new UserImgDTO(flist);
      int isOk = usv.userImgRegister(uidto);
   
      
      log.info("flist >>>"+flist.toString());
   
      m.addAttribute("userImg", flist);

      
      return "redirect:/member/userFileList";
      /*return "/member/userFileList";*/
   }
   

   @GetMapping("/userFileList")
   public String getImg(Model m) {

      List<UserImgDTO> uidto =  usv.getCharacterList();
      m.addAttribute(uidto);
      log.info("uidto>>"+uidto.toString());
      log.info("size>>>>>>>>>>>>>>>>>>>>>>>>"+uidto.size());
      
      for(UserImgDTO tmp : uidto) {
         if(tmp.getTitle() == "히로아카") {            
            m.addAttribute("hero",tmp);
         }
         if(tmp.getTitle() == "화산귀환") {            
            m.addAttribute("robb",tmp);
         }
         if(tmp.getTitle() == "헌터헌터") {            
            m.addAttribute("hunt",tmp);
         }
         if(tmp.getTitle() == "주술회전") {            
            m.addAttribute("jujutsu",tmp);
         }
         if(tmp.getTitle() == "나루토") {            
            m.addAttribute("naruto",tmp);
         }
         if(tmp.getTitle() == "최애의아이") {            
            m.addAttribute("oshinoko",tmp);
         }
      }
      
      return "/management/profileList";
   }

   
}