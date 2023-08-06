<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/userModify.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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


		<div class="pwCheck">

			<div class="pwCheckText">회원정보 변경</div>

			<hr class="line">

			<div class="pwArea">
				<p class="pwCheckp">개인정보를 변경하기 위해 비밀번호를 입력해주세요.</p>
				<span class="pwText">비밀번호</span> <input type="password" id="pw"
					name="pw" placeholder="비밀번호를 입력해주세요" class="pwInput"
					autocomplete="off">

			</div>

			<!-- <a href="/member/edit"></a> -->

			<button class="modBtn" id="btn">변경하기</button>


		</div>

	</div>

	<div id="popup" class="popup">
		<div class="popup_content">
			<div class="modalTitle">
				비밀번호가 일치하지 않습니다.
				<div class="closeBtn">
					<p class="closeText">확인</p>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<script type="text/javascript"
		src="/resources/js/userPwCheck_Modify.js">
		
	</script>

</body>
</html>