<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/userInfo.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>



	<div class="wrap">

		<div class="profileNav">

				<div class="profileArea">
					<div class="ProfileImg">
						<img alt="없음" id="${ses.uivo.uuid }"
							src="/upload/userProfile/${fn: replace(ses.uivo.saveDir, '\\','/')}/${ses.uivo.uuid }_${ses.uivo.fileName}"
							class="userImg">
					</div>
					<div class="userNickName">${ses.uvo.nickname }</div>
				</div>
				<div class="profileNavArea">
					<ul>
						<li><a href="/member/info?${ses.uvo.id }" class="userInfoLabel"> <span
								class="material-symbols-outlined userInfo"> person </span> 정보보기
						</a></li>

						<li><a href="/member/modify?${ses.uvo.id }"> <span
								class="material-symbols-outlined userInfoEdit">
									edit_square </span> 정보수정
						</a></li>
						<li><a href="/favorite/list"> <span
								class="material-symbols-outlined userWishList">
									heart_plus </span> 찜목록
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


		<div class="profileInfo">

			<div class="profileInfoTitle">
				<p class="profileInfoText">회원정보</p>
				<hr class="line">
			</div>

			<div class="profileInfoArea">

				<div class="id">
					<div class="idTextArea">
						<p class="idText">아이디</p>
					</div>
					<div class="idValueArea">
						<p class="idValue">${ses.uvo.id }</p>
					</div>
				</div>
				<hr class="idLine">

				<div class="nickname">
					<div class="nicknameArea">
						<p class="nicknameText">닉네임</p>
					</div>
					<div class="nicknameValueArea">
						<p class="nicknameValue">${ses.uvo.nickname }</p>
					</div>
				</div>
				<hr class="nicknameLine">

				<div class="email">
					<div class="emailTextArea">
						<p class="emailText">이메일</p>
					</div>
					<div class="emailValueArea">
						<p class="emailValue">${ses.uvo.email }</p>
					</div>
				</div>
				<hr class="emailLine">

				<div class="birth">
					<div class="birthTextArea">
						<p class="birthText">생년월일</p>
					</div>
					<div class="birthValueArea">
						<p class="birthValue">${ses.uvo.birth }</p>
					</div>
				</div>
				<hr class="birthLine">

			</div>


		</div>

	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>