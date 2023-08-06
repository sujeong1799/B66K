<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 페이지</title>
<link rel="stylesheet" type="text/css"
   href="/resources/css/Favorite.css">
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>



  <div class="orderDetailMain">
      
      
      <div class="favoriteContent">
      
         


         <div class="profileNav">


            <div class="profileArea">
               <div class="ProfileImg">
                  <img alt="없음" id="${ses.uivo.uuid }"
                     src="/upload/userProfile/${fn: replace(ses.uivo.saveDir, '\\','/')}/${ses.uivo.uuid }_${ses.uivo.fileName}"
                     class="userImg">
               </div>
               <div class="userNickName">${ses.uvo.nickname }</div>
            </div>
            <div class="profileNavArea">
               <ul>
                  <li><a href="/member/info?${ses.uvo.id }"> <span
                        class="material-symbols-outlined userInfo"> person </span> 정보보기
                  </a></li>

                  <li><a href="/member/modify?${ses.uvo.id }"> <span
                        class="material-symbols-outlined userInfoEdit">
                           edit_square </span> 정보수정
                  </a></li>
                  <li><a href="/favorite/list" class="userFavLabel"> <span
                        class="material-symbols-outlined userWishList">
                           heart_plus </span> 찜목록
                  </a></li>
                  <li><a href="/bookorder/User_orderlist"> <span
                        class="material-symbols-outlined userBookOrder">
                           receipt_long </span> 주문목록
                  </a></li>
                  <li><a href="/member/delete"> <span
                        class="material-symbols-outlined userWithdrawal">
                           heart_broken </span> 회원탈퇴
                  </a></li>
               </ul>
            </div>


         </div>


         <div class="favoriteBox">
            <div class="favoriteDetailText">
               <p class="favoritedetailText">주문 상세 내역</p>
               <hr class="favoriteLine">
               <div class="userfavorite">
                  <table class="table favoriteTable" style="width: 100%;">
                     <thead>
                        <tr align="center" >
                           <th scope="col"></th>
                           <th scope="col">상품명</th>
                           <th scope="col">작가</th>
                           <th scope="col">가격</th>
                           <th scope="col"></th>
                           
                        </tr>
                     </thead>
                     <tbody>



   <c:if test="${favoritelist_msg eq '0'}">
            <tr align="center" style="height: 700px;">
               <th colspan="5">찜 목록이 비어있습니다</th>
            </tr>
         </c:if>
         <c:if test="${favoritelist_msg ne '0'}">
            <c:forEach items="${list}" var="fdto">
               <tr data-fno="${fdto.fvo.fno}">
                  <th><a href="book/${fdto.fvo.bno}"><img alt="사진없음" class="bookimg"
                        src="/upload/${fdto.bivo.saveDir}/${fdto.bivo.uuid }_${fdto.bivo.fileName}"></a></th>   
                  <th><a href="book/${fdto.fvo.bno}" class="bookTitle">${fdto.fvo.title}</a></th> 
                  <th><a href="book/author=${fdto.fvo.author}">${fdto.fvo.author}</a></th> 
                  <th>${fdto.fvo.price}</th>
                  <th>
                  
                  <span class="material-symbols-outlined CartRegisterBtn" data-bno="${fdto.fvo.bno}">
                     shopping_cart
                  </span>
                  
               
                  <span class="material-symbols-outlined FavoriteDeleteBtn">
                     delete
                  </span>
               

                  
                  <!-- <button class="favoritebtn"><img src="/resources/img/delete_icon.png" class="FavoriteDeleteBtn btnImg"></button> -->
                  <%-- <button class="favoritebtn"><img src="/resources/img/cart_icon.png" class="CartRegisterBtn btnImg" data-bno="${fdto.fvo.bno}"></button> --%>
                  </th>                  
               </tr>
            </c:forEach>
         </c:if>




                     </tbody>
                  </table>
               </div>
            

            </div>
         </div>
      
    
    
    
    
    
      
      
      </div>
      
   </div>






<jsp:include page="../layout/footer.jsp"></jsp:include>






   <script src="/resources/js/FavoriteList.js?v=<%=System.currentTimeMillis() %>"></script>
   <script type="text/javascript">
   const favoritelist_msg = '<c:out value="${favoritelist_msg}" />';
   console.log(favoritelist_msg);
   const idVal = '<c:out value="1234" />';
   </script>
</body>
</html>