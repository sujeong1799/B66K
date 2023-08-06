<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/Bookmodify.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>

	<div class="ModifyContent">
		<div class="ModifyBox">
			<p>상품수정</p>
			<form action="/book/modify?bno=${bdto.bvo.bno }" method="post"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>번호</th>
						<td colspan="3">${bdto.bvo.bno }</td>
						<td></td>

					</tr>
					<tr>
						<th scope="col" style="width: 150px" align="center">상품명</th>
						<td><input name="title" value="${bdto.bvo.title }"></td>
						<th scope="col">저자</th>
						<td><input name="author" value="${bdto.bvo.author }"></td>
					</tr>
					<tr>
						<th scope="col">발매일</th>
						<td><input type="date" name="releaseDate"
							value="${bdto.bvo.releaseDate }"></td>
						<th scope="col">가격</th>
						<td><input name="price" value="${bdto.bvo.price }"></td>
					</tr>
					<tr>
						<th scope="col">재고</th>
						<td><input name="amount" value="${bdto.bvo.amount }"></td>
						<th scope="col">등록일</th>
						<td>${bdto.bvo.regDate }</td>
					</tr>
					<tr>
						<th scope="col">표지</th>
						<td colspan="3"><input type="file" id="files" name="files"
							multiple style="display: none;"> <a><button
									type="button" id="trigger" class="modFileBtn">FileUpload</button></a><br>
							<br>
							<div id="fileZone"></div> <!-- 파일 표시 -->
							<div>
								<ul>
									<li style="list-style-type: none;"><c:choose>
											<c:when test="${bdto.bivo.fileType  > 0}">
												<div class="imgFile">
													<img alt="없음"
														src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}">
													${bdto.bivo.fileName }
													<button type="button" class="file-x modFileCanBtn"
														data-uuid="${bdto.bivo.uuid }">삭제</button>
													<!-- 해당 경로로 가서 uuid_th_fileName으로 만들어진 해당 파일을 가져옴  -->
												</div>
											</c:when>
										</c:choose></li>
								</ul>
							</div></td>

					</tr>
					<tr>
						<th scope="col">책소개</th>
						<td colspan="3"><textarea name="intro"
								id="p_content">${bdto.bvo.intro }</textarea>
								<script type="text/javascript">
									CKEDITOR.replace('p_content', {
										height : 200
									});
								</script>
						<td>
					</tr>
					<tr>
						<th scope="col">목차</th>
						<td colspan="3"><textarea rows="3" cols="80"
								name="contentPage" class="contentPage">${bdto.bvo.contentPage }</textarea>
						<td>
					</tr>
				</table>
				<div align="center">
					<button id="regBtn" type="submit" class="modOkBtn">수정완료</button>
					<a href="/book/list"><button type="button"
							class="modcancelBtn">취소</button></a>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>


	<script type="text/javascript">
		const bnoVal = '<c:out value="${bdto.bvo.bno}" />';
		console.log("bno > " + bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/BookRegister.js"></script>
	<script type="text/javascript" src="/resources/js/BookModify.js"></script>

</body>
</html>