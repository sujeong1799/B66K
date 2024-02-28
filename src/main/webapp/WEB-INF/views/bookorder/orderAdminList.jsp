<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/orderAdminList.css">

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>


	<div class="orderListMain">
		<div class="orderListContent">
			<div class="orderListBox">
				<p>주문목록</p>

<%-- 				<!-- 검색라인 -->
				<div align="center">
					<form action="/bookorder/Admin_orderlist" method="get">
						<c:set value="${ph.pgvo.type }" var="typed"></c:set>
						<select name="type">
							<option ${typed == null ? 'selected' : '' }>선택</option>
							<option value="n" ${type eq 'n' ? 'selected' :'' }>주문번호</option>
							<option value="t" ${type eq 't' ? 'selected' :'' }>주문내역</option>
						</select> <input type="text" name="keyword" placeholder="search"
							class="search"> <input type="hidden" name="pageNo"
							value="${ph.pgvo.pageNo }"> <input type="hidden"
							name="qty" value="${ph.pgvo.qty }">
						<button type="submit" class="listSearchBtn">Search</button>
					</form>
				</div> --%>

				<table class="table" style="border-color: gray;">
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
								<div class="orderListZero">
									<span> 주문내역이 없습니다</span>
								</div>
							</th>
						</c:if>


						<c:forEach items="${list}" var="bodto">
							<fmt:parseDate var="parsedate" value="${bodto.bovo.orderDate}"
								pattern="yyyy-MM-dd" />
							<fmt:formatDate var="orderdate" value="${parsedate}"
								pattern="yyyy-MM-dd" />
							<tr align="center">
								<th>${bodto.bovo.ono}</th>
								<th><a class="orderListTitle"
									href="/bookorder/orderAdminDetail?ono=${bodto.bovo.ono}"><span>
											<c:forEach items="${bodto.boidto}" var="boidto"
												varStatus="status">
												<c:if test="${status.first}">
                                          ${boidto.boivo.title}
                                       </c:if>
											</c:forEach> <c:if test="${fn:length(bodto.boidto)>1}">
                                    외 ${fn:length(bodto.boidto)-1}건
                                    </c:if>
									</span> </a></th>
								<td>${bodto.bovo.total }원</td>
								<td>${orderdate}</td>
								<td>${bodto.bovo.orderStatus}<input type="hidden"
									class="status" value="${bodto.bovo.orderStatus}">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
				<!-- 페이징처리 -->
				<div style="display: table; margin-left: auto; margin-right: auto;">
					<nav aria-label="Page navigation example">
						<ul class="pagination">

							<c:if test="${ph.prev }">
								<li class="page-item"><a class="page-link"
									href="/bookorder/Admin_orderlist?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
								<li class="page-item"><a class="page-link"
									href="/bookorder/Admin_orderlist?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
							</c:forEach>

							<c:if test="${ph.next }">
								<li class="page-item"><a class="page-link"
									href="/bookorder/Admin_orderlist?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&raquo;</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/orderAdminList.js"></script>

</body>
</html>