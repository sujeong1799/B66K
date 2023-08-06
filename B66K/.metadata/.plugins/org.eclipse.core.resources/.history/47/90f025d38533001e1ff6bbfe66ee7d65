<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/userDelete.css">
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

					<li><a href="/member/modify?${ses.uvo.id }"> <span
							class="material-symbols-outlined userInfoEdit">
								edit_square </span> 정보수정
					</a></li>

					<li><a href="/favorite/list"> <span
							class="material-symbols-outlined userWishList"> heart_plus
						</span> 찜목록
					</a></li>
					<li><a href="/bookorder/User_orderlist"> <span
							class="material-symbols-outlined userBookOrder"> receipt_long
							</span> 주문목록
					</a></li>
					<li><a href="/member/delete"> <span
							class="material-symbols-outlined userWithdrawal">
								heart_broken </span> 회원탈퇴
					</a></li>
				</ul>
			</div>

		</div>


		<div class="userDeleteForm">

			<div class="userDeleteText">
				<p class="deleteText">회원탈퇴</p>
				<hr class="deleteLine">
				<div class="userDeleteInfo">
					<p class="userDeleteInfoText">탈퇴 안내 사항</p>

					<div class="deleteInfo">
						<div class="InfoDetail">
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 탈퇴 시 b66k의 모든 기능은 사용하실 수
								없습니다.</p>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. b66k에 등록된 고객님의 모든 개인정보는
								삭제되며 복구되지 않습니다.</p>
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 상법 및 '전자상거래 등에서 소비자 보호에 관한 법률'등
								<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 관련 법령의 규정에 의해
								일정기간 고객님의 개인정보가 보관됩니다.
							</p>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 탈퇴 후 b66k에 다시 재가입할 수
								있습니다.</p>
						</div>
					</div>

					<p class="deleteInputInfo">
						탈퇴하시려면 비밀번호를 <b>재입력</b>해주세요.
					</p>

				</div>
			</div>

			<div class="pwArea">
				<span class="pwText">비밀번호</span> <input type="password" id="pw"
					name="pw" placeholder="비밀번호를 입력해주세요" class="pwInput"
					autocomplete="off">

			</div>


			<button class="delBtn" id="btn">탈퇴하기</button>


			<span class="deleteQuestion">오류나 불편함을 겪으셨다면 <a href="/">고객센터</a>에
				의견을 남겨주세요.
			</span>
		</div>




	</div>
	<!--wrap  -->

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


	<script type="text/javascript" src="/resources/js/userPwCheck_Delete.js">
		
	</script>



</body>
</html>