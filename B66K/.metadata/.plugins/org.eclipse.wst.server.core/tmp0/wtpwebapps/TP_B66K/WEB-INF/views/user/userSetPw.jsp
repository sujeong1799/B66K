<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/userSetPw.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>


	<div class="wrap">

		<div class="setPwTitle">비밀번호 찾기</div>

		<hr class="line">

		<div class="setPwText">비밀번호를 재설정하고 다시 로그인해주세요.</div>

		<form action="/member/setUserPw" method="post">

			<div class="pwArea">
				<input type="password" id="pw" name="pw" autocomplete="off" class="pw"
					placeholder="비밀번호"> <span
					class="material-symbols-outlined pwVisibility">visibility </span> <span
					class="material-symbols-outlined pwVisibility_off"
					style="display: none;">visibility_off </span>
				<p id="pwMsg"></p>
			</div>
			<div class="pwcArea">
				<input type="password" id="pwc" name="pwc" autocomplete="off"
					class="pwc" placeholder="비밀번호 재입력"> <span
					class="material-symbols-outlined pwcVisibility">visibility </span> <span
					class="material-symbols-outlined pwcVisibility_off"
					style="display: none;">visibility_off </span>
				<p id="pwcMsg"></p>
			</div>


			<input type="hidden" name="email" value="${email}">

			<button type="submit" id="setPwBtn" disabled="disabled"
				class="setPwBtn">재설정하기</button>

		</form>

		<a href="/member/searchId"><button class="findId">아이디 찾기</button></a>
		<a href="/"><button class="home">뒤로가기</button></a>


	</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

	<script type="text/javascript" src="/resources/js/userSetPw.js"></script>

</body>
</html>