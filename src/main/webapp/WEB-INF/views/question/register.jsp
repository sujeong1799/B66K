<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS only -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/qna.css">
<!-- <script
   src="https://cdn.ckeditor.com/ckeditor5/38.1.0/classic/ckeditor.js"></script>
</head> -->


</head>



<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/qnasidebar.jsp"></jsp:include>



	<div class="rgsmaindiv">
		<div class="rgsalldiv">
		<div class="rgsdiv">
			<form action="/question/register" method="post"
				enctype="multipart/form-data">


				<div class="form-floating mb-3">
					<input type="text" name="title" class="form-control"
						id="floatingInput" placeholder=" " oninput="checkFormValidity()"
						onblur="handleTitleInput()"> <label for="floatingInput">1:1 문의하기</label>
				</div>


				<!-- 작성자 : -->
				<input type="hidden" name="id" value="${ses.uvo.id }"
					readonly="readonly">

				<div class="mb-3">
					<textarea name="content" class="form-control"
						id="exampleFormControlTextarea1"
						placeholder="문의 내용을 입력하세요. &#13;&#10;비방이나 욕설,영업방해가 되는 글, 게시판과 맞지않는 글은 무통보 삭제됩니다."
						oninput="checkFormValidity()"></textarea>
				</div>


					
						<div align="left">
							<div class="triggerBntdiv" align="center">
								<span class="material-symbols-outlined" id="trigger">photo_camera</span>
							</div>
						</div>


			<div class="fileDivZone">
						<input type="file" id="files" name="files" multiple
							style="display: none"
							accept="image/png, image/jpeg, image/jpg, image/bmp, image/gif"
							onchange="setThumbnail(event)">

						<div id="fileZone" align="left"></div>
			</div>



				<div class="btnbtn">
					<button type="submit" id="regBtn" class="qnaregBtn" disabled="disabled">등록</button>
					<a href="/"><button type="button" class="qnarcanBtn" >취소</button></a>

				</div>


			</form>

		</div>

	</div>
	
	</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>


	<script type="text/javascript" src="/resources/js/qnaregister.js"></script>
	

	
	
</body>
</html>