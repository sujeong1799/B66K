<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 주문 상세 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/orderAdminDetail.css">

</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>

	<div class="orderDetailMain">
		<div class="orderDetailContent">
			<div class="orderDetailBox">
				<p>주문 상세 페이지</p>
				<table class="table orderDetailTable">
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
								<td><a href="/book/ProductDetail?bno=${items.bivo.bno }"><img class="orderDetailImg" alt="사진없음"
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
				<br><br><br><br><br>
				<table class="table orderDetailTable">
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
							<td>${bodto.bovo.id}</td>
							<!-- ses.uvo.id에서 고침 -->
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
				<br><br><br><br><br>
			</div>
		</div>
	</div>




   <jsp:include page="../layout/footer.jsp"></jsp:include>
   	<script type="text/javascript" src="/resources/js/orderAdminDetail.js"></script>
   
	<!-- Button trigger modal -->

</body>
</html>