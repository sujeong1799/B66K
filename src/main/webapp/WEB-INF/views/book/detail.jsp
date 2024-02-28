<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/Bookdetail.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>


	<div class="detailMain">
		<div class="detailContent">
			<div class="detailBox">
				<p>상품 디테일</p>
				<table class="table detailTable">
					<tr>
						<th scope="col" style="width: 150px" align="center">번호</th>
						<td colspan="3">${bdto.bvo.bno }</td>
					</tr>
					<tr>
						<th scope="col">상품명</th>
						<td>${bdto.bvo.title }</td>
						<th scope="col">저자</th>
						<td>${bdto.bvo.author }</td>
					</tr>
					<tr>
						<th scope="col">발매일</th>
						<td>${bdto.bvo.releaseDate }</td>
						<th scope="col">가격</th>
						<td>${bdto.bvo.price }</td>
					</tr>
					<tr>
						<th scope="col">재고</th>
						<td>${bdto.bvo.amount }</td>
						<th scope="col">등록일</th>
						<td>${bdto.bvo.regDate }</td>
					</tr>
					<tr>
						<th scope="col">책소개</th>
						<td colspan="3">${bdto.bvo.intro }</td>
					</tr>
					<tr>
						<th scope="col">목차</th>
						<td colspan="3"><textarea rows="3" cols="85"
								readonly="readonly" class="contentPage">${bdto.bvo.contentPage }</textarea></td>
					</tr>
				</table>

				<!-- 파일 표시 영역 -->
				<div>
					<div class="detailTitle"></div>
					<ul class="detailImgList">
						<li style="list-style-type: none;"><c:if
								test="${bdto.bivo.fileType  > 0}">
								<div class="imgList">
									<img alt="없음"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}">
									<!-- 해당 경로로 가서 uuid_fileName으로 만들어진 해당 파일을 가져옴  -->
								</div>
							</c:if>
					</ul>
					<div align="center">
						<a href="/book/modify?bno=${bdto.bvo.bno }"><button
								class="detailModBtn">수정</button></a> <a
							href="/book/delete?bno=${bdto.bvo.bno }"><button
								class="detailCancelBtn">삭제</button></a>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/BookDetail.js"></script>



</body>
</html>