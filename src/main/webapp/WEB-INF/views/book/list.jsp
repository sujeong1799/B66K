<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<link rel="stylesheet" type="text/css" href="/resources/css/Booklist.css">

</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>


	<div class="listMain">
		<div class="listContent">
			<div class="listBox">

				<p>상품리스트</p>
			
				<!-- 검색라인 -->
				<div align="center">
				<form action="/book/list" method="get">
					<c:set value="${ph.pgvo.type }" var="typed"></c:set>
					<select name="type">
						<option ${typed == null ? 'selected' : '' }>선택</option>
						<option value="t" ${type eq 't' ? 'selected' :'' }>상품명</option>
						<option value="a" ${type eq 'a' ? 'selected' :'' }>저자</option>
						<option value="p" ${type eq 'p' ? 'selected' :'' }>가격</option>
					</select> <input type="text" name="keyword" placeholder="search"
						class="search"> <input type="hidden" name="pageNo"
						value="${ph.pgvo.pageNo }"> <input type="hidden"
						name="qty" value="${ph.pgvo.qty }">
					<button type="submit" class="listSearchBtn">Search</button>
				</form>
				</div>
				
				
				<table class="table" style="border-color: gray;">
					<thead>
						<tr align="center">
							<th scope="col">번호</th>
							<th scope="col">상품명</th>
							<th scope="col">저자</th>
							<th scope="col">발매일</th>
							<th scope="col">가격</th>
							<th scope="col">재고</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${list }" var="bvo">
							<tr align="center">
								<td>${bvo.bno }</td>
								<td><a class="listTitle" href="/book/detail?bno=${bvo.bno }">${bvo.title }</a></td>
								<td>${bvo.author }</td>
								<td>${bvo.releaseDate }</td>
								<td>${bvo.price }</td>
								<td>${bvo.amount }</td>
								<td>${bvo.regDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<a href="/book/register"><button type="button"
							class="listAddBtn">상품등록</button></a>
					<a href="/"><button type="button" class="listMainBtn">메인</button></a> <br>
				</div>

				<br>
				<!-- 페이징처리 -->
				<div style="display: table; margin-left: auto; margin-right: auto;">
					<nav aria-label="Page navigation example">
						<ul class="pagination">

							<c:if test="${ph.prev }">
								<li class="page-item"><a class="page-link"	
									href="/book/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
								<li class="page-item"><a class="page-link"
									href="/book/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
							</c:forEach>

							<c:if test="${ph.next }">
								<li class="page-item"><a class="page-link"
									href="/book/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&raquo;</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/BookList.js"></script>
	
	
</body>
</html>