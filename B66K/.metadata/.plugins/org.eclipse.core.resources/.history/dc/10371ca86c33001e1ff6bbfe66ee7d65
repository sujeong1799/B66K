<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

여기 유저 리스트입니다

<table border="1">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이메일</th>		
			<th>닉네임</th>
			<th>생일</th>
			<th>등급</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.id }</td>
				<td>${list.email }</td>
				<td>${list.nickname }</td>
				<td>${list.birth }</td>
				<td>${list.role }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<jsp:include page="../layout/footer.jsp"></jsp:include>



</body>
</html>

