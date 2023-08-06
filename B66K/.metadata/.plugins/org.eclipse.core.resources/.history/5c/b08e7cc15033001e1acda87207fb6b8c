<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ REGISTER</title>
<link rel="stylesheet" type="text/css" href="/resources/css/faq.css">
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>
	


	<div class="faqrgsalldiv">
		<div class="faqrgsdiv">
			<form action="/faq/register" method="post">

				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label"></label>
					<input type="text" class="form-control" name="title"
						id="exampleFormControlInput1" placeholder="자주하는 질문">
				</div>


<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label"></label>
  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="3" placeholder="내 용"></textarea>
</div>

			<div class="faqrgsbtn">
				<button type="submit" id ="faqrgsSubmitBtn" disabled="disabled">등록</button>
				<a href="/"><button type="button" id="faqcancelBtn">취소</button></a>
			</div>
			</form>


		</div>


	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
<script type="text/javascript" src="/resources/js/faqregister.js"></script>

<script>
  const SubmitBtn = document.getElementById('faqrgsSubmitBtn');
  SubmitBtn.addEventListener('click', function() {
    alert('등록되었습니다.');
  });
</script>


</body>
</html>