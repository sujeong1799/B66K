<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- CSS only -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />   
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



<div class="qusAlldiv">

	<div class="qnadiv">


<!-- 검색라인 -->
	
	<div class="searchDiv">
	<form action="/question/list" method="get">
		<div class="selediv">
			
			<c:set value="${ph.pgvo.type }" var="typed"></c:set>
			<select name="type" class="select">
				<!-- selected : 현재 내가 선택한 값 -->
				<option ${typed == null ? 'selected' : '' }>선택</option>
				<option value="t" ${type eq 't' ? 'selected' :'' }>제목</option>
				<option value="i" ${type eq 'i' ? 'selected' :'' }>작성자</option>
				<option value="n" ${type eq 'n' ? 'selected' :'' }>글번호</option>
				<option value="c" ${type eq 'c' ? 'selected' :'' }>내용</option>
			</select> 
			
			
			<input type="text" name="keyword" placeholder="search" id="searchZone">
			
			<input type="hidden" name="pageNo" value="${ph.pgvo.pageNo }">
			<input type="hidden" name="qty" value="${ph.pgvo.qty }">
			
			
			<button type="submit" id="scSearchBtn" class="scButton">
  			<span class="scSearchText">검색</span>
  			<span class="material-symbols-outlined search">search</span>
			</button> 
			
		</div>
	</form>
</div>

<!-- 테이블 -->

<div class="qnatable">
	<div class="tbList" >
		<table class="table table-borderless" id="maintb">
			<thead>
				<tr>
					<th scope="col" id="tbitem">글번호</th>
					<th scope="col" id="tbitem">제목</th>
					<th scope="col" id="tbitem">작성자</th>
					<th scope="col" id="tbitem">작성일</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${list }" var="qvo">
					<tr>
						<th id="tbitem2">${qvo.qno }</th>
						<td id="tbitemtitle"><a href="/question/detail?qno=${qvo.qno }" class="AList" id="listTitle" style="text-decoration:none">${qvo.title }</a></td>
						<td id="tbitem2">${qvo.id }</td>
						<td id="tbitem2">${qvo.regDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</div>		
		
		

	
<!-- 페이징처리 -->
		<div style="display: table; margin-left: auto; margin-right: auto;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">

					<c:if test="${ph.prev }">
						<li class="page-item"><a class="page-link"
							href="/question/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
						<li class="page-item"><a class="page-link"
							href="/question/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
					</c:forEach>
					<c:if test="${ph.next }">
						<li class="page-item"><a class="page-link"
							href="/question/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
		
</div>
	
		
		
		
		<div class="qnabtndiv">
				<div class="btn-wrap" id="rgsbtn">
					<a href="/question/register" class="button"> 
					<span class="button-overlay"></span>
					<span class="button-text">문의하기</span>
					</a>
				</div>
		</div>
		
		
		
	</div>





</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>

	<div id="popup">
		<div class="popup_content">
			<div class="popupModalTitle" id="popupModalTitle">
				<div id="modalMessage"></div>
				<div class="popupCloseBtn">
					<p class="popupCloseText">확인</p>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
  const listTitles = document.querySelectorAll("#listTitle");
  const loggedInUserId = '<c:out value="${ses.uvo.id}" />';
  const userRole = '<c:out value="${ses.uvo.role}" />';
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

  	document.querySelector(".popupCloseBtn").addEventListener("click",
  	closePopup);


  function handleListTitleClick(event) {
    const writerId = event.target.parentNode.parentNode.children[2].textContent;

    if (userRole === "admin") {

    } else {
      if (loggedInUserId !== writerId) {
    		popup.style.display = "block";
    		body.style.overflow = 'hidden';
    		setMessage('문의내역은 작성자 본인만 확인하실 수 있습니다.');
        /* alert("문의내역은 작성자 본인만 확인하실 수 있습니다."); */
        event.preventDefault();
      } 
    }
  }

  listTitles.forEach((element) => {
    element.addEventListener("click", handleListTitleClick);
  });
</script>


</body>
</html>