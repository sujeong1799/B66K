<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/resources/css/userList.css">
<body>
	<!-- 헤더, 사이드바 -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>


	<!-- 유저 리스트 -->

	<div class="userListMain">
		<div class="userListContent">
			<div class="userListBox">
				<p>회원 목록</p>

				<table align="center">
					<thead>
						<tr align="center">
							<th>아이디</th>
							<th>이메일</th>
							<th>닉네임</th>
							<th>생일</th>
							<th>등급</th>
						</tr>
					</thead>
					<tbody class="userInfo">
						<c:forEach items="${list }" var="list">
							<tr align="center">
								<td>${list.id }</td>
								<td>${list.email }</td>
								<td>${list.nickname }</td>
								<td>${list.birth }</td>
								<td>${list.role }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>




	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<script>
		function syncSidebarAndlistBoxHeights_userListContent() {
			const sideBar = document.querySelector('.SideBar');
			const listBox = document.querySelector('.userListContent');

			// 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
			const maxHeight = Math.max(sideBar.offsetHeight,
					listBox.offsetHeight);
			sideBar.style.height = maxHeight + 50 + 'px';
			listBox.style.height = maxHeight + 'px';
		}

		window.addEventListener('load',
				syncSidebarAndlistBoxHeights_userListContent);
		window.addEventListener('resize',
				syncSidebarAndlistBoxHeights_userListContent);
	</script>

</body>
</html>