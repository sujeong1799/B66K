<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/userProfileRegister.css">
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>
   <jsp:include page="../layout/side.jsp"></jsp:include>




      <div class="profileContent">
         <div class="profileBox">
            <p>프로필 등록</p>
            <hr>
            
            <form action="/member/fileRegister" method="post"
               enctype="multipart/form-data">
               파일 : <input type="file" id="files" name="files" multiple
                  style="display: none;">
               <button type="button" id="trigger" class="fileUploadBtn">업로드</button>
               <div id="fileZone"></div>
            <br><br><br>
               <button id="regBtn" type="submit" class="registerBtn">프로필 등록하기</button>
            </form>
         </div>
      </div>



   <jsp:include page="../layout/footer.jsp"></jsp:include>
   <script type="text/javascript" src="/resources/js/profileRegister.js"></script>
</body>
</html>