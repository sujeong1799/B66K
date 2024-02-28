<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/qnaSide.css">
</head>
<body>

   <div class="qnaside">
   <p id="qnaid">Q&A</p>
      <ul class="sidelist">
        <li><a href="/faq/list">자주하는질문</a></li>
        <li><a href="/question/list">Q&A전체보기</a></li>
        <li><a href="/question/register">1:1문의</a></li>
        <li><a href="/question/list?keyword=${ses.uvo.id}&type=i">나의문의내역</a></li>
        <li id="sbhomeli"><a href="/">HOME</a></li>
      </ul>    
   </div>
   
   <div>
   
   </div>
   


</body>
</html>