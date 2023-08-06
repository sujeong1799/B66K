<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/Orderlist.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="wrap">
		<div class="orderContent">

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
								class="material-symbols-outlined userWishList">
									heart_plus </span> 찜목록
						</a></li>
						<li><a href="/bookorder/User_orderlist"
							class="bookOrderLabel"> <span
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



			<div class="orderListBox">
				<div class="orderListText">
					<p class="listText">주문목록</p>
					<hr class="listLine">
					<div class="userOrderList">
						<table class="table ">
							<thead>
								<tr align="center" style="vertical-align: middle">
									<th scope="col" rowspan="2">주문번호</th>
									<th scope="col" rowspan="2">주문내역</th>
									<th scope="col" rowspan="2">총금액</th>
									<th scope="col" rowspan="2">주문날짜</th>
									<th scope="col" rowspan="2">주문상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ListEmpty_msg eq '0'}">
									<th colspan="5">
										<div class="orderListZero"><span> 주문내역이 없습니다</span></div>
									</th>
								</c:if>

								<c:if test="${ListEmpty_msg ne '0'}">
									<c:forEach items="${list}" var="bodto">
										<fmt:parseDate var="parsedate" value="${bodto.bovo.orderDate}"
											pattern="yyyy-MM-dd" />
										<fmt:formatDate var="orderdate" value="${parsedate}"
											pattern="yyyy-MM-dd" />
										<tr align="center">
											<th>${bodto.bovo.ono}</th>
											<th><a class="orderListTitle"
												href="/bookorder/orderdetail?ono=${bodto.bovo.ono}"><span>
											<c:forEach items="${bodto.boidto}" var="boidto"
												varStatus="status">
												<c:if test="${status.first}">
                                          ${boidto.boivo.title}
                                       </c:if>
											</c:forEach> <c:if test="${fn:length(bodto.boidto)>1}">
                                    외 ${fn:length(bodto.boidto)-1}건
                                    </c:if>
									</span>
											</a></th>
											<td>${bodto.bovo.total }원</td>
											<td>${orderdate}</td>
											<td>${bodto.bovo.orderStatus}<input type="hidden"
												class="status" value="${bodto.bovo.orderStatus}">
											</td>
										</tr>
									</c:forEach>
								</c:if>




							</tbody>
						</table>

					</div>
				</div>
			</div>


		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<div id="popup">
		<div class="popup_content">
			<div class="popupModalTitle" id="popupModalTitle">
				<div id="modalMessage"></div>
				<div class="popupCloseBtn">
					<p class="popupCloseText">확인</p>
				</div>
			</div>
		</div>
	</div>

	<script>
		const ordercancle_msg = `<c:out value="${ordercancle_msg}"/>`;
		const ordermodify_msg = `<c:out value="${ordermodify_msg}"/>`;
		const body = document.querySelector("body");
		const popup = document.getElementById("popup");

		let modalMessage = document.getElementById('modalMessage');

		function setMessage(text) {
			modalMessage.innerText = text;
		}
		if (ordercancle_msg == '1') {
			popup.style.display = "block";
			body.style.overflow = 'hidden';
			setMessage('주문이 취소되었습니다.');
		}
		if (ordermodify_msg == '1') {
			popup.style.display = "block";
			body.style.overflow = 'hidden';
			setMessage('배송정보가 수정되었습니다.');
		}

		function closePopup() {
			popup.style.display = "none";
			body.style.overflow = "auto";
			window.location.reload();
		}

		document.querySelector(".popupCloseBtn").addEventListener("click",
				closePopup);
	</script>



</body>
</html>