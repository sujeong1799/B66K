<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/userFindId.css">

</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>



<div class="idResultWrap">

<div class="idResultWrapText">
아이디 찾기 결과입니다
</div>

<hr id="line">


<table class="idResultTable">
<c:forEach items="${idResult }" var="result">
	<tr>
		<th>아이디</th>
		<td>${result.id }</td>
			
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${result.nickname }</td>	
	</tr>
	<tr>
		<th>가입날짜</th>
		<td>${result.regDate }</td>	
	</tr>

</c:forEach>
</table>
<div class="btnArea">
<a href="/member/searchPw"><button class="findPwBtn">비밀번호 찾기</button></a>
<a href="/member/login"><button class="loginBtn">로그인</button></a>
</div>

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>