<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- CSS only -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/qna.css">
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/qnasidebar.jsp"></jsp:include>



	<div class="alldiv">
		<div class="alldiv2">

			<div class="detail">
				<c:set var="qvo" value="${QuestionDTO.qvo }"></c:set>

				<table class="table table-borderless" id="detailTD">
					<tr>
						<td id="thNo">no. ${qvo.qno }</td>
						<td id="belbtntd">
							<div align="right">
								<div class="delbtn" id="delbtn">
									<a href="/question/delete?qno=${qvo.qno }"> <span
										class="material-symbols-outlined"> close </span></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>

						<th id="thTitle" rowspan='2'>${qvo.title }</th>
						<td id="thId" align="right">${qvo.id }</td>


					</tr>
					<tr>
						<td id="thDate">${qvo.regDate }</td>
					</tr>


				</table>


				<textarea id="detailtxt" readonly>${qvo.content }</textarea>

			</div>


			<details>

				<summary>
				
	<div id="imgAddBtn" >				
	<svg xmlns="http://www.w3.org/2000/svg" id="summaeryicon"width="25" height="25" fill="currentColor"  onclick="rotateElement(this)" class="bi bi-caret-right-square" viewBox="0 0 16 16" onclick="toggleRotation(this)">
  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path d="M5.795 12.456A.5.5 0 0 1 5.5 12V4a.5.5 0 0 1 .832-.374l4.5 4a.5.5 0 0 1 0 .748l-4.5 4a.5.5 0 0 1-.537.082z"/>
	</svg>
	</div>		
					
				</summary>


				<div class="questionfileimg" align="center">
					<!-- 이미지표시내역 -->
					<c:set var="flist" value="${QuestionDTO.flist }"></c:set>
					<div>
						<ul>
							<c:forEach items="${flist }" var="qivo">
								<li><c:if test="${qivo.fileType >0 }">
										<div class="fileimgDiv">
											<img id="myfileimg" alt="없음 "
												src="/upload/qnaImg/${fn: replace(qivo.saveDir, '\\','/') }/${qivo.uuid }_${qivo.fileName}"
												onclick="openOriginalSize(this.src)">
										</div>
									</c:if></li>
							</c:forEach>
						</ul>
					</div>
				</div>

	</details>




			<!-- 댓글표시라인 -->
			<div class="answerdiv">
				<ul id="answerArea" style="-webkit-padding-start: 0px;">
					<li></li>
				</ul>
			</div>


<!-- 버튼표시라인 -->
		<div class="allbtn" align="center">


				<div class="btn-wrap" id="rgsbtn">
					<a href="/question/register" class="button"> 
					<span class="button-overlay"></span>
					<span class="button-text">문의하기</span>
					</a>
				</div>


				<div class="btn-wrap" id="listbtn">
					<a href="/question/list" class="button">
					<span class="button-overlay"></span>
					<span class="button-text">글목록</span>
					</a>
				</div>
				

	</div>





			<!-- 관리자만볼수있게 -->
			<div>

				<c:if test="${ses.uvo.role == 'admin' }">
					<!-- 댓글등록 -->
					<div id="answertxtdiv">
						<textarea id="answertxt"></textarea>
					</div>

					<div id="myanswerbtndiv">
						<button type="button" id="myanswerBtn">댓글등록</button>
					</div>
				</c:if>
			</div>




		</div>

	</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>



	<script type="text/javascript">
		const roleVal = '<c:out value="${ses.uvo.role }" />';
		console.log("role>>" + roleVal);
	</script>

	<script type="text/javascript">
		const qnoVal = '<c:out value="${QuestionDTO.qvo.qno}" />';
		console.log("qno>>" + qnoVal);
	</script>


	<script type="text/javascript" src="/resources/js/answer.js"></script>

	<script type="text/javascript">
		getAnswerList(qnoVal);
	</script>

	<script>
		function openOriginalSize(imageSrc) {
			window.open(imageSrc, '_blank');
		}
	</script>

	<script>
		function rotateElement(element) {
			const isRotated = element.getAttribute('data-rotated');

			if (isRotated === 'true') {
				element.style.transform = 'none';
				element.setAttribute('data-rotated', 'false');
			} else {
				element.style.transform = 'rotate(90deg)';
				element.setAttribute('data-rotated', 'true');
			}
		}
	</script>



<script>
  const SubmitBtn = document.getElementById('delbtn');
  SubmitBtn.addEventListener('click', function() {
    alert('삭제되었습니다.');
  });
</script>



</body>
</html>