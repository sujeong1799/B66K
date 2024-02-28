<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>FAQ LIST</title>
<link rel="stylesheet" type="text/css" href="/resources/css/faq.css">

</head>
<body>




<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/qnasidebar.jsp"></jsp:include>



	




<div class="classalldiv">
<div id="faqalldiv">
	<div class="mainDiv">
	
	<div class="hdiv">
	<div class="h1h2">
	<h1 class="h11">자주하는</h1> <h1 class="h12">질문</h1>
	</div>
	</div>

		
 		<div class="accordion accordion-flush" id="accordionFlushExample">

		<c:forEach items="${list }" var="list">
			<div class="accordion-item">	
				<h2 class="accordion-header" id="${list.fno }">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#flush-collapse${list.fno }" aria-expanded="false"
						aria-controls="flush-collapse${list.fno }"><b>${list.fno }</b>　　　　${list.title }
					</button>
				</h2>
				<div id="flush-collapse${list.fno }"
					class="accordion-collapse collapse"
					aria-labelledby="flush-heading${list.fno }"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body" align="left"><pre id="faqContent">${list.content }</pre></div>


					<c:if test="${ses.uvo.role == 'admin' }">
						<div class="faqDel"><a href="/faq/delete?fno=${list.fno }">
						<button class="btndelBtn" id="delBtn">삭제</button></a></div>
					</c:if>

				</div> 
			</div>
		</c:forEach>
	</div>








		<!-- 페이징처리 -->
		<div class="pgdiv">
		<div style="display: table; margin-left: auto; margin-right: auto;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">

					<c:if test="${ph.prev }">
						<li class="page-item"><a class="page-link"
							href="/faq/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
						<li class="page-item"><a class="page-link"
							href="/faq/list?pageNo=${i }&qty=${ph.pgvo.qty}">${i }</a></li>
					</c:forEach>

					<c:if test="${ph.next }">
						<li class="page-item"><a class="page-link"
							href="/faq/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}">&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
		</div>
		
		


	<div class="faqbtn">
		<c:if test="${ses.uvo.role == 'admin' }">
		<a href="/faq/register"><button id="addlistbtn">글등록</button></a>
	 	</c:if>
	</div>

</div>
</div>

</div>	





   
   

<jsp:include page="../layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/faqregister.js"></script>



<script>
  const deleteButton = document.getElementById('delBtn');
  deleteButton.addEventListener('click', function() {
    alert('삭제되었습니다');
  });
</script>


<script>

     function adjustMainDivHeightOnExpand(event) {
        const mainDiv = document.querySelector(".mainDiv");
        const isExpanded = event.target.getAttribute("aria-expanded") === "true";

        if (isExpanded) {
            mainDiv.style.height = "auto";
          
        } else {
            mainDiv.style.height = "950px";
          
        }
    } 

    document.addEventListener("DOMContentLoaded", adjustMainDivHeight);
    window.addEventListener("resize", adjustMainDivHeight);

    const accordionButtons = document.querySelectorAll(".accordion-button");
    accordionButtons.forEach(function (button) {
        button.addEventListener("click", adjustMainDivHeightOnExpand);
    });
</script>







</body>
</html>



