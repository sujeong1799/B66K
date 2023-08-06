<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트1</title>
<link rel="stylesheet" type="text/css" href="/resources/css/event.css">
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>


   <div class="alldiv">
      <div class="middiv" align="center">

         <div class="condiv">

            <div class="evtimglogo">
               <img alt="없음" src="/resources/img/event1.png">
            </div>


            <div class="evtimg" align="center">
               <img alt="없음" src="/resources/img/이벤트_화산귀환.png">
            </div>

            <a href="#"><button class="eventTop" type="button"
                  data-is-hidden="false">
                  <svg width="1em" height="1em" viewBox="0 0 30 30" fill="none"
                     xmlns="http://www.w3.org/2000/svg" aria-label="맨 위로 스크롤">
    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M6.582 13.436a.8.8 0 01-1.164-1.098l9-9.54a.8.8 0 011.164 0l9 9.54a.8.8 0 11-1.164 1.098L15.8 5.36v20.483a.8.8 0 11-1.6 0V5.36l-7.618 8.075z"
                        fill="currentColor"></path>
  </svg>
               </button></a>




            <div class="endDiv" align="center">
            <div class="endDiv2">
            
               <div id="txtImg" align="right">
                  <img alt="없음" src="/resources/img/화귀.jpg" style="height: 200px">
               </div>
            <div class="txtZone" align="left">
               <div class="textareaZone">
               대 화산파 13대 제자. 천하삼대검수 매화검존 청명.<br>
               천하를 혼란에 빠뜨린 고금제일마 천마의 목을 치고 십만대산의 정상에서 영면.<br>
               백 년의 시간을 뛰어넘어 아이의 몸으로 다시 살아나다.<br>
               ……뭐? 화산이 망해? 이게 뭔 개소리야!?<br>
               <br>
               <b>그림/만화 · 비가 원작</b></div>
               </div>
               
            </div>   
            </div>



            <div class="Evtlogoimg" align="center">

               <div class="buyBtn">
                  <a href="/book/ProductDetail?bno=123"><span>구매하러가기</span></a>
               </div>




            </div>
         </div>
      </div>
   </div>

   <jsp:include page="../layout/footer.jsp"></jsp:include>




   <script type="text/javascript" src="/resources/js/event.js"></script>

</body>
</html>