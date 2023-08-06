<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 페이지</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/Orderdetail.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="orderDetailMain">
		<div class="orderDetailContent">

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




			<div class="orderDetailBox">
				<div class="orderDetailText">
					<p class="detailText">주문 상세 내역</p>
					<hr class="detailLine">
					<div class="userOrderDetail">
						<table class="table orderDeatilTable">
							<thead>
								<tr align="center">
									<th scope="col"></th>
									<th scope="col">상품명</th>
									<th scope="col">가격</th>
									<th scope="col">수량</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bodto.boidto}" var="items">
									<tr align="center">
										<td><a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img class="orderDetailImg" alt="사진없음"
											src="/upload/${fn: replace(items.bivo.saveDir, '\\','/')}/${items.bivo.uuid }_${items.bivo.fileName}"></a></td>
										<td>${items.boivo.title}</td>
										<td>${items.boivo.price}</td>
										<td>${items.boivo.count}</td>
									</tr>
								</c:forEach>
								<tr align="center">
									<th colspan="3"></th>
									<th>합계 : ${bodto.bovo.total}원</th>
								</tr>
							</tbody>
						</table>
					</div>
					<br> <br>
					<table class="table orderDetailInfo">
						<thead>
							<tr align="center">
								<th scope="col">주문번호</th>
								<td>${bodto.bovo.ono }</td>
								<th scope="col">주문일자</th>
								<fmt:parseDate var="parsedate" value="${bodto.bovo.orderDate}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate var="orderdate" value="${parsedate}"
									pattern="yyyy-MM-dd" />
								<td>${orderdate}</td>
							</tr>
							<tr align="center">
								<th scope="col">주문하신 분</th>
								<td>${ses.uvo.nickname}</td>
								<th scope="col">받으시는 분</th>
								<td>${bodto.bovo.name }</td>
							</tr>
							<tr align="center">
								<th scope="col">주문상태</th>
								<td>${bodto.bovo.orderStatus}</td>
								<th scope="col">결제방법</th>
								<td>${bodto.bovo.payType}</td>
							</tr>
							<tr align="center">
								<th scope="col">배송지 주소</th>
								<td colspan="3">(${bodto.bovo.addressCode})
									${bodto.bovo.addressJuso}, ${bodto.bovo.addressDetail}</td>
							</tr>
							<tr align="center">
								<th scope="col">요청사항</th>
								<td colspan="3">${bodto.bovo.etc}</td>
							</tr>
						</thead>
					</table>
					<div class="btnBox">
						<c:if test="${bodto.bovo.orderStatus eq '결제완료'}">
							<div class="btnDiv" align="center">
								<button type="button" class="orderDetailcancelBtn"
									data-bs-toggle="modal" data-bs-target="#confirm">주문취소</button>
								<button type="button" class="orderDetailmodifyBtn"
									data-bs-toggle="modal" data-bs-target="#modify">배송정보수정</button>
							</div>
						</c:if>
					</div>
					<!-- Button trigger modal -->
				</div>
			</div>
		</div>
	</div>
	<!-- orderDetailText 끝 -->


	<!-- Modal 1 -->
	<div class="modal fade" id="confirm" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">주문을 취소하시겠습니까?</div>
				<div class="modal-footer">
					<a href="/bookorder/cancle?ono=${bodto.bovo.ono}"><button
							type="button" class="">예</button></a>
					<button type="button" class="" data-bs-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>


	<!-- Modal 1 끝 -->



	<!-- Modal 2 -->
	<div class="modal fade" id="modify" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">배송정보수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="/bookorder/modify" method="post">
					<div class="modal-body">
						<input type="hidden" name="ono" value="${bodto.bovo.ono}">
						받는분 성함<br> <input type="text" name="name"
							value="${bodto.bovo.name}"><br> <br> 우편번호<br>
						<input type="text" id="sample4_postcode" placeholder="우편번호"
							name="addressCode" value="${bodto.bovo.addressCode}" readonly>
						<input type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기"><br> 도로명주소<br> <input
							type="text" id="sample4_roadAddress" placeholder="도로명주소"
							name="addressJuso" value="${bodto.bovo.addressJuso}" readonly><br>
						지번주소<br> <input type="text" id="sample4_jibunAddress"
							placeholder="지번주소" readonly><br> <span id="guide"
							style="color: #999; display: none"></span> 상세주소<br> <input
							type="text" id="sample4_detailAddress" placeholder="상세주소"
							name="addressDetail" value="${bodto.bovo.addressDetail}"><br>
						<br> 요청사항<br>
						<textarea rows="10" cols="60" name="etc" style="resize: none">${bodto.bovo.etc}</textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="modalNo" data-bs-dismiss="modal">아니오</button>
						<button type="submit" class="modalOk">수정완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal 2 modal fade  -->



	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
</body>
</html>