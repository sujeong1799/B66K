<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색리스트</title>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="/resources/css/searchList.css">
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>


   <div class="searchMain">
      
            <div class="searchMainTitle"> 
               <p>'${keyword }' 검색 결과입니다.</p>
            </div>
   
   
      <div class="searchContent">

         <c:if test="${empty list}">
            <div class="searchBox">
            
            <img src="/resources/img/b66k_searchList.png" class="searchListImg">
               <div class="searchBoxTextArea">
                     <p class="searchBoxText">검색어와 일치하는 제품이 없습니다.</p>
               </div>


            <div class="recommendBox">
            
               <p>이 제품은 어떠세요?</p>
               <p>B66K가 추천하는 제품입니다~ ^^</p>
               
               <div>여기에 제품이 나올겁니다..maybe</div>
            </div>
            
            


            </div>

         </c:if>
         <c:if test="${not empty list}">
            <div class="searchBox2">
               <div class="searchResult">
                  <c:forEach items="${list}" var="bdto">
                     <div class="searchResultBox">
                        <a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img class="titlePic" alt="표지가 없어요"
                           src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
                        <div class="content">
                           <span>${bdto.bvo.title}</span> <br>
                           <span>작가 ${bdto.bvo.author}</span> <br>
                           <span>가격 ${bdto.bvo.price}</span> |
                           <span>별점 ${bdto.bvo.ratingAvg}</span> <br>
                        </div>
                     </div>
                  </c:forEach>
               </div>
            </div>
         </c:if>

      </div>
   </div>

   <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>