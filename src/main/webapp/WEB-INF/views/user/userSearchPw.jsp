<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="/resources/css/userSearchPw.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>


<div class="wrap">

<div class="findPwtextArea">
	<p class="findPwText1">비밀번호 찾기<p>	
	<hr id="line">
	<div class="findPwText2">
	<p class="findPwText3">가입 시 입력한 이메일로 인증번호를 보내드립니다.<p>
   이메일을 입력하고 인증번호 받기를 누른 후 이메일로 온 인증번호를 입력해주세요. </div>
</div>
<form action="/member/searchPw" method="post">

<div class="emailArea">

	<div class="emailInputArea">
<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요." class="emailInput">
<button type="button" id="AuthNumBtn" name="AuthNumBtn" style="display: inline-block;" class="SearchBtn">인증번호 받기</button>

	</div>


	<div class="emailAuthArea">

<input type="text" id="emailCheckNum" maxlength="7" placeholder="인증번호를 입력해주세요." class="authInput" 
autocomplete="off" style="display: none;">
<!--style="display: none;"  -->
<button type="button" id="SearchPwBtn" name="SearchPwBtn" 
class="SearchPwBtn" style="display: none;">인증번호 입력</button>
<!--style="display: none;"  -->
	</div>
	
</div>

</form>

<!-- <a href="/member/searchId"><button class="idSearchBtn">아이디 찾기</button></a>
<a href="/"><button class="homeBtn">뒤로가기</button></a> -->

<div class="btnArea">

  <a id="idSearchBtn" class="idButton" href="/member/searchId">
  <span class="idSearchText">아이디찾기</span>
  <span class="material-symbols-outlined search">
	search
	</span>
  </a>
  
  <a id="homeBtn" class="homeButton" href="/">
  <span class="homeText">홈으로가기</span>
	<span class="material-symbols-outlined home">
		arrow_back
	</span>
  </a>
</div>


</div>  <!-- wrap div끝  -->


	<div id="searchPwPopup" class="searchPwPopup">
		<div class="searchPwPopup_content">
			<div class="searchPwModalTitle" id="searchPwModalTitle">
					<div id="modalMessage"></div>
				<div class="searchPwCloseBtn">
				<p class="searchPwCloseText">확인</p></div>
			</div>
		</div>
	</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/userSearchPw.js"></script>

</body>
</html>