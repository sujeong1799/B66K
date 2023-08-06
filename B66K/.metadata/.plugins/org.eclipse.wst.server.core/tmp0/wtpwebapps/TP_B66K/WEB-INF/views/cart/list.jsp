<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록 페이지</title>
<!-- CSS only -->
<!-- JavaScript Bundle with Popper -->
<link rel="stylesheet"
	href="/resources/css/Cart.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>


	<div id="wrap">
		<div class="cartContent">

			<div class="cartListBox">
				<div class="cartListText">
					<p class="listText">장바구니</p>
					<hr class="listLine">
					<c:set var="total" value="0" />
					<form action="/cart/AmountCheck" method="post">
						<div class="userListBox">
							<table class="table">
								<thead>
									<tr align="center">
										<th scope="col"></th>
										<th scope="col">상품명</th>
										<th scope="col">작가</th>
										<th scope="col">가격</th>
										<th scope="col">개수</th>
										<th scope="col"></th>
									</tr>
								</thead>

								<tbody>

									<c:if test="${cartlist_msg eq '0'}">
										<tr style="height: 500px;" align="center">
											<th colspan="5">장바구니가 비어있습니다</th>
										</tr>
									</c:if>


									<c:if test="${cartlist_msg ne '0'}">
										<c:forEach items="${list}" var="cdto">
											<tr align="center">
												<th><a href="/book/ProductDetail?bno=${cdto.cvo.bno}"><img alt="사진없음"
														class="bookimg"
														src="/upload/${fn: replace(cdto.bivo.saveDir, '\\','/')}/${cdto.bivo.uuid }_${cdto.bivo.fileName}"></a>
													<input type="hidden" name="bno" value="${cdto.cvo.bno}">
													<input type="hidden" name="id" value="${cdto.cvo.id}"></th>
												<th><a href="book/${cdto.cvo.bno}">${cdto.cvo.title}</a>
													<input type="hidden" name="title" value="${cdto.cvo.title}"></th>
												<th><a href="book/author=${cdto.cvo.author}">${cdto.cvo.author}</a>
													<input type="hidden" name="author"
													value="${cdto.cvo.author}"></th>
												<th>${cdto.cvo.price}<input type="hidden" class="price"
													name="price" value="${cdto.cvo.price}">
												</th>
												<th class="count_row">
													<button class="minus countBtn" type="button">▼</button> <span
													class="count">${cdto.cvo.count}</span>
													<button class="plus countBtn" type="button">▲</button> <input
													type="hidden" name="count" value="${cdto.cvo.count}"
													data-cno="${cdto.cvo.cno}">
												</th>
												<th><a href=""><img
														src="/resources/img/delete_icon.png"
														data-cno="${cdto.cvo.cno}" class="CartDeleteImg btnImg"></a></th>
											</tr>
											<c:set var="total"
												value="${total + cdto.cvo.price*cdto.cvo.count}" />
										</c:forEach>
									</c:if>
								</tbody>
							</table>

						</div>
						<div class="payDivCover">
							<div class="payDiv">

								<div class="productPrice">
									<div class="productPriceText">상품 금액</div>
									<div class="productPriceValue" id="pay_div">
										<fmt:formatNumber value="${total}" />
									</div>
								</div>

								<div class="deliveryPrice">
									<div class="deliveryPriceText">배송비</div>
									<div class="deliveryPriceValue" id="extra_div">

										<c:if test="${total > 15000}">
               0
            </c:if>
										<c:if test="${total <= 15000}">
               3000
            </c:if>
									</div>
								</div>
								<div class="totalPrice">
									<div class="totalPriceText">총금액</div>
									<div class="totalPriceValue" id="total_div">
										<c:if test="${total>15000}">
											<fmt:formatNumber value="${total}" />
										</c:if>
										<c:if test="${total<15000}">
											<fmt:formatNumber value="${total+3000}" />
										</c:if>
									</div>
								</div>

								<div class="orderBtnArea">
									<button type="submit" id="orderBtn" class="orderBtn">주문하기</button>
								</div>
								<div class="payInfo">
									<p>&nbsp;&nbsp;"주문완료" 상태일 경우에만 주문 취소가 가능합니다.</p>
									<p>&nbsp;&nbsp;"주문상세 내역 페이지"에서 주문 취소 가능합니다.</p>
									<p>&nbsp;&nbsp;사은품 목록은 책 상세페이지에서 확인할 수 있습니다.</p>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>


		<!-- 버튼  -->





		<!-- wrap끝  -->
	</div>





	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
	<div id="popup">
		<div class="popup_content2">
			<div class="popupModalTitle" id="popupModalTitle">
				<div id="modalMessage"></div>
				<div class="popupCloseBtn2">
					<p class="popupCloseText">확인</p>
				</div>
			</div>
		</div>
	</div>

	<script
		src="/resources/js/CartList.js?v=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript">
		let total = `<c:out value="${total}"/>`;
		const EmptyListTitle = `<c:out value="${EmptyListTitle}"/>`;
		const EmptyListAmount = `<c:out value="${EmptyListAmount}"/>`;
		const body = document.querySelector("body");
		const popup = document.getElementById("popup");

		let modalMessage = document.getElementById('modalMessage');

		function setMessage(text) {
			modalMessage.innerText = text;
		}
			function closePopup() {
				popup.style.display = "none";
				body.style.overflow = "auto";
			}

			document.querySelector(".popupCloseBtn2").addEventListener("click",
			closePopup);

		
		let titlelist = [];
		let amountlist = [];
		<c:forEach var="title" items="${EmptyListTitle}" varStatus="status">
		titlelist.push("${title}");
		</c:forEach>

		<c:forEach var="amount" items="${EmptyListAmount}" varStatus="status">
		amountlist.push("${amount}");
		</c:forEach>

		console.log(titlelist);
		console.log(amountlist);
		if (EmptyListTitle.length > 0) {
			let tmp = "";
			for (let i = 0; i < titlelist.length; i++) {
				tmp += "'" + titlelist[i] + "' "
			}
			tmp += "의 재고가 부족합니다.\n";
			tmp += "남은 재고 수\n";
			for (let i = 0; i < titlelist.length; i++) {
				tmp += titlelist[i] + " : " + amountlist[i] + "권\n";
			}
			popup.style.display = "block";
			body.style.overflow = 'hidden';
			setMessage(tmp);
		}
	</script>


</body>
</html>