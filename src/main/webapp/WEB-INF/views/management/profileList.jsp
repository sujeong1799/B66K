<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/profileList.css">
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	<jsp:include page="../layout/side.jsp"></jsp:include>




	<div class="profileList">
		<div class="profileBox">
			<div class="container">
				<p>프로필 목록</p>
				<a href="/member/fileRegister"><button class="registerBtn">
						프로필 등록하기</button></a>
			</div>
			<hr>

			<!-- 업로드된 프로필 목록  -->


			<div class="naruto">

				<c:forEach items="${naruto.flist}" var="narutoList">
					<input class="profile_img" type="radio" id="${narutoList.fileName}"
						value="${narutoList.uuid}" name="uuid"
						data-title="${naruto.title}" />
					<label for="${narutoList.fileName}"> <img class="imgBox"
						alt="없음" id="${narutoList.uuid }"
						src="/upload/userProfile/${fn: replace(narutoList.saveDir, '\\','/')}/${narutoList.uuid }_${narutoList.fileName}">
					</label>
				</c:forEach>

			</div>


			<div class="hero">
				<c:forEach items="${hero.flist}" var="heroList">
					<input class="profile_img" type="radio" id="${heroList.fileName}"
						value="${heroList.uuid}" name="uuid" data-title="${hero.title}" />

					<label for="${heroList.fileName}"> <img class="imgBox"
						alt="없음" id="${heroList.uuid}"
						src="/upload/userProfile/${fn: replace(heroList.saveDir, '\\','/')}/${heroList.uuid}_${heroList.fileName}">

					</label>
				</c:forEach>
			</div>


			<div class="robb">
				<c:forEach items="${robb.flist}" var="robbList">
					<input class="profile_img" type="radio" id="${robbList.fileName}"
						value="${robbList.uuid}" name="uuid" data-title="${robb.title}" />
					<label for="${robbList.fileName}"> <img class="imgBox"
						alt="없음" id="${robbList.uuid }"
						src="/upload/userProfile/${fn: replace(robbList.saveDir, '\\','/')}/${robbList.uuid }_${robbList.fileName}">
					</label>
				</c:forEach>

			</div>

			<div class="hunter">

				<c:forEach items="${hunt.flist}" var="huntList">
					<input class="profile_img" type="radio" id="${huntList.fileName}"
						value="${huntList.uuid}" name="uuid" data-title="${hunt.title}" />
					<label for="${huntList.fileName}"> <img class="imgBox"
						alt="없음" id="${huntList.uuid }"
						src="/upload/userProfile/${fn: replace(huntList.saveDir, '\\','/')}/${huntList.uuid }_${huntList.fileName}">
					</label>
				</c:forEach>


			</div>


			<div class="jujutsu">

				<c:forEach items="${jujutsu.flist}" var="jujutsuList">
					<input class="profile_img" type="radio"
						id="${jujutsuList.fileName}" value="${jujutsuList.uuid}"
						name="uuid" data-title="${jujutsu.title}" />
					<label for="${jujutsuList.fileName}"> <img class="imgBox"
						alt="없음" id="${jujutsuList.uuid }"
						src="/upload/userProfile/${fn: replace(jujutsuList.saveDir, '\\','/')}/${jujutsuList.uuid }_${jujutsuList.fileName}">
					</label>
				</c:forEach>
			</div>


			<div class="oshinoko">


				<c:forEach items="${oshinoko.flist}" var="oshinokoList">
					<input class="profile_img" type="radio"
						id="${oshinokoList.fileName}" value="${oshinokoList.uuid}"
						name="uuid" data-title="${oshinoko.title}" />
					<label for="${oshinokoList.fileName}"> <img class="imgBox"
						alt="없음" id="${oshinokoList.uuid }"
						src="/upload/userProfile/${fn: replace(oshinokoList.saveDir, '\\','/')}/${oshinokoList.uuid }_${oshinokoList.fileName}">
					</label>
				</c:forEach>


			</div>
		</div>
	</div>

	<br>


	<jsp:include page="../layout/footer.jsp"></jsp:include>



	<script type="text/javascript">
   const profile_div = document.getElementById('profileImgDiv')
   document.addEventListener('click', (e)=>{
   let str = "";
       if(e.target.classList.contains('profile_img')){
           let title = e.target.dataset.title;
           let click_uuid = e.target.value;
           
           console.log(click_uuid); // 선택된 이미지의 uuid
           console.log(title); // 선택된 이미지의 title
           if(title == '히로아카'){
               console.log("히로아카 진입")               
              let img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src
               str = `<img class="" alt="없음" src="" id="select_img" style="width:100px; height:100px;">`
              profile_div.innerHTML = str;
              document.getElementById("select_img").src = img_src;
           }
           else if(title == '헌터헌터'){
              let img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src
              str = `<img class="" alt="없음" src="" id="select_img" style="width:100px; height:100px;">`
             profile_div.innerHTML = str;
              document.getElementById("select_img").src = img_src;
           }
           console.log(str);

          // modal.style.display = 'none'; // modal창 close
       }
   })
   
   
   
   
   
   /* 사이드 높이설정 */
   function syncSidebarAndprofileBoxHeights_profileContent() {
    const sideBar = document.querySelector('.SideBar');
    const profileBox = document.querySelector('.profileList');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, profileBox.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    profileBox.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndprofileBoxHeights_profileContent);
  window.addEventListener('resize', syncSidebarAndprofileBoxHeights_profileContent);
  
  
  </script>
</body>
</html>