<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- CSS only -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css">
</head>
<body>

   <nav class="navbar">
      <div class="container-fluid">
         <a class="navbar-brand" href="/"> <img
            src="/resources/img/B66K_logo_white.png">
         </a>
         <div class="headerLine"> </div>
         
         <!-- @@@@@@@ 로고 끝 @@@@@@  -->

         <span class="material-symbols-outlined headerSearchIcon"
            id="headerSearchIcon"> search </span>

         <div align="center" class="headerSearchDiv" id="headerSearchDiv">
            <form action="/book/search" method="get">
               <input type="text" name="keyword" placeholder="search"
                  class="headerSearch">

               <button type="submit" class="headerListSearchBtn">검색</button>
            </form>
         </div>
         <!-- @@@@@ 검색 끝 @@@@@  -->


         <div class="loginUserInformation">
         
         <c:if test="${ses.uvo.id != null}">
               <span><img
                  alt="없음" id="${ses.uivo.uuid }"
                  src="/upload/userProfile/${fn: replace(ses.uivo.saveDir, '\\','/')}/${ses.uivo.uuid }_${ses.uivo.fileName}"
                  class="headerImgIcon"/>
               <span class="headerUserNickname">${ses.uvo.nickname }</span>
               </span>
         </c:if>
         
         </div>





         <div class="dropdown">
            <c:if test="${ses.uvo.id == null}">
               <a class="navlog" href="/member/signup">회원가입</a>
               <a class="navlog" href="/member/login">로그인</a>
            </c:if>
            <c:if test="${ses.uvo.id != null}">
<%--                <span class="userNickname">${ses.uvo.nickname } 님 <img
                  alt="없음" id="${ses.uivo.uuid }"
                  src="/upload/userProfile/${fn: replace(ses.uivo.saveDir, '\\','/')}/${ses.uivo.uuid }_${ses.uivo.fileName}"
                  class="imgIcon">
               </span> --%>


               <button class="btn dropdown-toggle headerBtn" type="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <span>MYPAGE</span>
               </button>

               <a class="navlog" href="/member/logout">로그아웃</a>
            </c:if>
            <c:if test="${ses.uvo.id != null && ses.uvo.role eq 'admin'}">
               <ul class="dropdown-menu adminDropDown">
                  <li><a class="dropdown-item" href="/book/list">관리자페이지</a></li>
               </ul>
            </c:if>
            <c:if test="${ses.uvo.id != null && ses.uvo.role ne 'admin'}">
               <ul class="dropdown-menu userDropdown">
						<li><a class="dropdown-item" href="/bookorder/User_orderlist">주문목록</a></li>
						<li><a class="dropdown-item" href="/favorite/list">찜한상품</a></li>
						<li><a class="dropdown-item" href="/cart/list">장바구니</a></li>
						<li><a class="dropdown-item" href="/question/list">1:1문의</a></li>
						<li><a class="dropdown-item"
							href="/member/info?${ses.uvo.id}">마이페이지</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</nav>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		let headerSearchIcon = document.getElementById('headerSearchIcon');
		let searchDiv = document.getElementById('headerSearchDiv');

		function headerSearchDisplay() {
			if (searchDiv.style.display == 'block') {
				searchDiv.style.display = 'none';
			} else {
				searchDiv.style.display = 'block';
			}
		}

		headerSearchIcon.addEventListener('click', headerSearchDisplay);
	</script>
</body>
</html>