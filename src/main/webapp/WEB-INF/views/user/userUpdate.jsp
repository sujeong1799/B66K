<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<link rel="stylesheet" type="text/css" href="/resources/css/userUpdate.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>



   <div class="wrap">

      <div class="profileNav">

         <div class="profileArea">
            <div class="userProfileImg">
               <img alt="없음" id="${ses.uivo.uuid }"
                  src="/upload/userProfile/${fn: replace(ses.uivo.saveDir, '\\','/')}/${ses.uivo.uuid }_${ses.uivo.fileName}"
                  class="userImg">
            </div>

            <div class="userNickName">${ses.uvo.nickname }</div>
         </div>
         <div class="profileNavArea">
                        <ul>
               <li><a href="/member/info?${ses.uvo.id }"> <span
                     class="material-symbols-outlined userInfo"> person </span> 정보보기
               </a></li>

               <li><a href="/member/modify?${ses.uvo.id }" class="userModiLabel"> <span
                     class="material-symbols-outlined userInfoEdit">
                        edit_square </span> 정보수정
               </a></li>

               <li><a href="/favorite/list"> <span
                     class="material-symbols-outlined userWishList"> heart_plus
                  </span> 찜목록
               </a></li>
               <li><a href="/bookorder/User_orderlist"> <span
                     class="material-symbols-outlined userBookOrder">
                        receipt_long </span> 주문목록
               </a></li>
               <li><a href="/member/delete"> <span
                     class="material-symbols-outlined userWithdrawal">
                        heart_broken </span> 회원탈퇴
               </a></li>
            </ul>

         </div>

      </div>


      <div class="userUpdateArea">

         <div class="updateTextArea">
            <p class="updateText">회원정보 변경</p>
            <hr class="updateLine">
         </div>

         <!--=============================================  -->

         <div class="updateArea">



         <div class="userProfileImgArea">
            <div class="profileText">프로필</div>

            <div id="profileImgDiv" class="profileImgDiv">
               <div>
                  <img alt="없음" id="${ses.uivo.uuid }"
                        src="/upload/userProfile/${fn: replace(ses.uivo.saveDir, '\\','/')}/${ses.uivo.uuid }_${ses.uivo.fileName}"
                        class="SelecteduserImg">
                        <input type="hidden" name="uuid" value="${ses.uvo.uuid }" id="uuid">
               </div>

            </div>


         </div>


<!--======================= 프로필 이미지 선택 모달창 =====================-->

         <div id="modal" class="modal-overlay">
            <!--modalWrap  -->
            <div class="modalBody">
               <!--modalWindow창  -->
               <div class="modalTitle">
                  프로필 선택하기 <span id="closeBtn">X </span>
                  <hr>
               </div>

               <div class="wrapper" id="wrapper">
                  <!--content  -->
                  <div class="title" id="title">나의 히어로 아카데미아</div>
                  <div class="carousel">
                     <!--line  -->
                     <!--    <div class="imgLine"> -->

                     <c:forEach items="${hero.flist}" var="heroList">
                        <input class="profile_img" type="radio"
                           id="${heroList.fileName}" value="${heroList.uuid}" name="uuid"
                           data-title="${hero.title}" />
                           
                        <label for="${heroList.fileName}"> <img class="imgBox"
                           alt="없음" id="${heroList.uuid}"
                           src="/upload/userProfile/${fn: replace(heroList.saveDir, '\\','/')}/${heroList.uuid}_${heroList.fileName}">
            
                        </label>
                     </c:forEach>


                     <!-- </div>  -->
                     <!-- imgBox끝  -->
                  </div>

                  <div class="title" id="title">화산귀환</div>
                  <div class="carousel6">

                     <c:forEach items="${robb.flist}" var="robbList">
                        <input class="profile_img" type="radio"
                           id="${robbList.fileName}" value="${robbList.uuid}" name="uuid"
                           data-title="${robb.title}" />
                        <label for="${robbList.fileName}"> <img class="imgBox2"
                           alt="없음" id="${robbList.uuid }"
                           src="/upload/userProfile/${fn: replace(robbList.saveDir, '\\','/')}/${robbList.uuid }_${robbList.fileName}">
                        </label>
                     </c:forEach>

                  </div>

                  <div class="title" id="title">헌터헌터</div>
                  <div class="carousel2">

                     <c:forEach items="${hunt.flist}" var="huntList">
                        <input class="profile_img" type="radio"
                           id="${huntList.fileName}" value="${huntList.uuid}" name="uuid"
                           data-title="${hunt.title}" />
                        <label for="${huntList.fileName}"> <img class="imgBox2"
                           alt="없음" id="${huntList.uuid }"
                           src="/upload/userProfile/${fn: replace(huntList.saveDir, '\\','/')}/${huntList.uuid }_${huntList.fileName}">
                        </label>
                     </c:forEach>

                  </div>
                  <!--carousel끝  -->

                  <div class="title" id="title">주술회전</div>
                  <div class="carousel3">

                     <c:forEach items="${jujutsu.flist}" var="jujutsuList">
                        <input class="profile_img" type="radio"
                           id="${jujutsuList.fileName}" value="${jujutsuList.uuid}" name="uuid"
                           data-title="${jujutsu.title}" />
                        <label for="${jujutsuList.fileName}"> <img class="imgBox3"
                           alt="없음" id="${jujutsuList.uuid }"
                           src="/upload/userProfile/${fn: replace(jujutsuList.saveDir, '\\','/')}/${jujutsuList.uuid }_${jujutsuList.fileName}">
                        </label>
                     </c:forEach>

                  </div>


                  <div class="title" id="title">나루토</div>
                  <div class="carousel4">

                     <c:forEach items="${naruto.flist}" var="narutoList">
                        <input class="profile_img" type="radio"
                           id="${narutoList.fileName}" value="${narutoList.uuid}" name="uuid"
                           data-title="${naruto.title}" />
                        <label for="${narutoList.fileName}"> <img class="imgBox3"
                           alt="없음" id="${narutoList.uuid }"
                           src="/upload/userProfile/${fn: replace(narutoList.saveDir, '\\','/')}/${narutoList.uuid }_${narutoList.fileName}">
                        </label>
                     </c:forEach>

                  </div>

                  <div class="title" id="title">최애의아이</div>
                  <div class="carousel5">

                     <c:forEach items="${oshinoko.flist}" var="oshinokoList">
                        <input class="profile_img" type="radio"
                           id="${oshinokoList.fileName}" value="${oshinokoList.uuid}" name="uuid"
                           data-title="${oshinoko.title}" />
                        <label for="${oshinokoList.fileName}"> <img class="imgBox3"
                           alt="없음" id="${oshinokoList.uuid }"
                           src="/upload/userProfile/${fn: replace(oshinokoList.saveDir, '\\','/')}/${oshinokoList.uuid }_${oshinokoList.fileName}">
                        </label>
                     </c:forEach>

                  </div>


               </div>
               <!--wrapper끗  -->

               <hr>
               <div class="imgchoiceBtnArea">
               <button type="button" id="imgChoiceBtn">선택하기</button>
               </div>

               <!-- </div>그림선택 끝  -->
            </div>
         </div>
         
         <!-- =========================================== -->



            <div class="idArea">
               <ul>
                  <li><span class="idText">아이디</span></li>
                  <li><input type="text" name="id" id="id" class="id"
                     value="${ses.uvo.id }" readonly="readonly"></li>
               </ul>
            </div>

            <div class="pwArea">
               <ul>
                  <li><span class="pwText">비밀번호</span></li>
                  <li><input type="password" name="pw" id="pw" class="pw"
                     autocomplete="off"></li>
               </ul>
               <span class="material-symbols-outlined pwVisibility">visibility
               </span> <span class="material-symbols-outlined pwVisibility_off"
                  style="display: none;">visibility_off </span>
               <p id="pwMsg" class="pwMsg"></p>
            </div>

            <div class="pwcArea">
               <ul>
                  <li><span class="pwcText">재입력</span></li>
                  <li><input type="password" name="pwc" id="pwc" class="pwc"
                     autocomplete="off"></li>
               </ul>
               <span class="material-symbols-outlined pwcVisibility">visibility
               </span> <span class="material-symbols-outlined pwcVisibility_off"
                  style="display: none;">visibility_off </span>
               <p id="pwCheckMsg" class="pwCheckMsg"></p>
            </div>

            <div class="emailArea">
               <ul>
                  <li><span class="emailText">이메일</span></li>
                  <li><input type="text" name="email" id="email" class="email"
                     value="${ses.uvo.email }" readonly="readonly"></li>
               </ul>
            </div>

            <div class="nicknameArea">
               <ul>
                  <li><span class="nicknameText">닉네임</span></li>
                  <li><input type="text" name="nickname" id="nickname"
                     class="nickname" value="${ses.uvo.nickname }"></li>
               </ul>
               <p id="nickMsg" class="nickMsg"></p>
            </div>

            <div class="birthArea">
               <ul>
                  <li><span class="birthText">생년월일</span></li>
                  <li><input type="text" name="birth" id="birth" class="birth"
                     value="${ses.uvo.birth }" readonly="readonly"></li>
               </ul>
            </div>

            <div class="btnArea">
               <button type="button" id="updateBtn" class="updateBtn">수정하기</button>
            </div>

         </div>

      </div>

   </div>
   <!--wrap  -->


   <div id="userUpdatePopup" class="userUpdatePopup">
      <div class="userUpdatePopup_content">
         <div class="userUpdateModalTitle" id="userUpdateModalTitle">
            <div id="modalMessage"></div>
            <div class="userUpdateCloseBtn">
               <p class="userUpdateCloseText">확인</p>
            </div>
         </div>
      </div>
   </div>





<jsp:include page="../layout/footer.jsp"></jsp:include>

   <script type="text/javascript" src="/resources/js/userUpdate.js"></script>


</body>
</html>