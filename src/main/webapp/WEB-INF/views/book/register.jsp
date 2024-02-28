<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/resources/css/Bookregister.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<body>
	<!-- 헤더, 사이드바 -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>


	<!-- 상품등록(제목, 저자, 가격, 내용, 재고(amount), 이미지) - 관리자입장 -->

	<div class="RegisterMain">
		<div class="RegisterContent">
			<div class="RegisterBox">
				<p>상품등록</p>
				<form action="/book/register" method="post"
					enctype="multipart/form-data">

					<table class="table">
						<tr>
							<th scope="col" align="center">상품명</th>
							<td><input type="text" name="title" placeholder="상품명"></td>
							<th scope="col">저자</th>
							<td ><input type="text" name="author" placeholder="저자명"></td>
						</tr>
						<tr>
							<th scope="col">표지</th>
							<td colspan="3"><input type="file" id="files" name="files"
								multiple style="display: none;"> <a><button
										type="button" id="trigger" class="regFileBtn">FileUpload</button></a><br>
								<div id="fileZone"></div></td>
						</tr>
						<tr>
							<th scope="col">발매일</th>
							<td colspan="3"><input type="date" name="releaseDate"></td>
						</tr>
						<tr>
							<th scope="col">판매가</th>
							<td><input type="text" name="price" placeholder="판매가"></td>
							<th scope="col">재고</th>
							<td><input type="text" name="amount" placeholder="재고"></td>
						</tr>
						<tr>
							<th scope="col">책소개</th>
							<td colspan="3"><textarea name="intro" id="p_content">${bdto.bvo.intro }</textarea>
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
									name="contentPage" class="contentPage"></textarea>
							<td>
						</tr>
					</table>
					<div align="center">
						<button type="submit" id="regBtn" class="regAddBtn">등록</button>
						<a href="/"><button type="button" class="regCancelBtn">취소</button></a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		const bnoVal = '<c:out value="${BookDTO.bvo.bno}" />';
		console.log("bno > " + bnoVal);
	</script>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/BookRegister.js"></script>
	

</body>
</html>