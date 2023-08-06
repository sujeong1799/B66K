<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/userJoin.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>


	<!--========================================================-->

	<form action="/member/signup" method="post" id="joinForm">

		<div class="wrap">
			<!--전체를 감싸는 디브  -->

			<div class="div0">

				<div class="joinTitle">회원가입</div>

				<hr class="line">
			</div>

			<!--======================== id ============================  -->
			<div class="div1">
				<!--아이디 div  -->
				<div class="idText">아이디</div>
				<div class="idIput">
					<input type="text" id="id" name="id" class="idArea"
						placeholder="아이디를 입력해주세요.">
				</div>
				<p id="idMsg" class="idMsg"></p>
			</div>

			<!--======================= pw ===========================  -->

			<div class="div2">
				<!-- 비밀번호 div  -->
				<div class="pwText">비밀번호</div>
				<div class="pwInput">
					<input type="password" id="pw" name="pw" class="pwArea"
						placeholder="비밀번호를 입력해주세요." autocomplete="off"> <span
						class="material-symbols-outlined pwVisibility">visibility </span>
					<span class="material-symbols-outlined pwVisibility_off"
						style="display: none;">visibility_off </span>
				</div>
				<p id="pwMsg" class="pwMsg"></p>
			</div>

			<!--==========================pw check ========================  -->
			<div class="div3">
				<!--비밀번호 확인 div  -->
				<div class="pwcText">재입력</div>
				<div class="pwcInput">
					<input type="password" id="pwCheck" class="pwcArea"
						placeholder="비밀번호를 재입력해주세요." autocomplete="off"> <span
						class="material-symbols-outlined pwcVisibility">visibility
					</span> <span class="material-symbols-outlined pwcVisibility_off"
						style="display: none;">visibility_off </span>
				</div>
				<p id="pwCheckMsg" class="pwcMsg"></p>
			</div>

			<!--=========================== nickname =====================  -->

			<div class="div4">
				<!--닉네임  -->
				<div class="nickText">닉네임</div>
				<div class="nickInput">
					<input type="text" id="nickname" class="nickArea" name="nickname"
						placeholder="닉네임을 입력해주세요.">
				</div>
				<p id="nicknameMsg" class="nickMsg"></p>
			</div>

			<!--=================== userprofile =============== -->

			<div class="div5">
				<div class="profileText">프로필</div>

				<div id="profileImgDiv">
					<div>
						<img alt="" src="">
					</div>

				</div>


			</div>
			<!--div5끝  -->
			<!-- =======여기까지 화면에 놓을 부분============= -->
			<!-- 여기서부터 모달창  -->

			<div id="modal" class="modal-overlay">
				<!--modalWrap  -->
				<div class="modalBody">
					<!--modalWindow창  -->
					<div class="modalTitle">
						프로필 선택하기 <span id="closeBtn">X </span>
						<hr>
					</div>



					<div class="wrapper" id="wrapper">
						<!--content  -->
						<div class="title" id="title">나의 히어로 아카데미아</div>
						<div class="carousel">
							<!--line  -->
							<!-- 	<div class="imgLine"> -->

							<c:forEach items="${hero.flist}" var="heroList">
								<input class="profile_img" type="radio"
									id="${heroList.fileName}" value="${heroList.uuid}" name="uuid"
									data-title="${hero.title}" />

								<label for="${heroList.fileName}"> <img class="imgBox"
									alt="없음" id="${heroList.uuid}"
									src="/upload/userProfile/${fn: replace(heroList.saveDir, '\\','/')}/${heroList.uuid}_${heroList.fileName}">

								</label>
							</c:forEach>


							<!-- </div>  -->
							<!-- imgBox끝  -->
						</div>

						<div class="title" id="title">화산귀환</div>
						<div class="carousel6">

							<c:forEach items="${robb.flist}" var="robbList">
								<input class="profile_img" type="radio"
									id="${robbList.fileName}" value="${robbList.uuid}" name="uuid"
									data-title="${robb.title}" />
								<label for="${robbList.fileName}"> <img class="imgBox2"
									alt="없음" id="${robbList.uuid }"
									src="/upload/userProfile/${fn: replace(robbList.saveDir, '\\','/')}/${robbList.uuid }_${robbList.fileName}">
								</label>
							</c:forEach>

						</div>


						<div class="title" id="title">헌터헌터</div>
						<div class="carousel2">

							<c:forEach items="${hunt.flist}" var="huntList">
								<input class="profile_img" type="radio"
									id="${huntList.fileName}" value="${huntList.uuid}" name="uuid"
									data-title="${hunt.title}" />
								<label for="${huntList.fileName}"> <img class="imgBox2"
									alt="없음" id="${huntList.uuid }"
									src="/upload/userProfile/${fn: replace(huntList.saveDir, '\\','/')}/${huntList.uuid }_${huntList.fileName}">
								</label>
							</c:forEach>

						</div>
						<!--carousel끝  -->

						<div class="title" id="title">주술회전</div>
						<div class="carousel3">

							<c:forEach items="${jujutsu.flist}" var="jujutsuList">
								<input class="profile_img" type="radio"
									id="${jujutsuList.fileName}" value="${jujutsuList.uuid}"
									name="uuid" data-title="${jujutsu.title}" />
								<label for="${jujutsuList.fileName}"> <img
									class="imgBox3" alt="없음" id="${jujutsuList.uuid }"
									src="/upload/userProfile/${fn: replace(jujutsuList.saveDir, '\\','/')}/${jujutsuList.uuid }_${jujutsuList.fileName}">
								</label>
							</c:forEach>

						</div>


						<div class="title" id="title">나루토</div>
						<div class="carousel4">

							<c:forEach items="${naruto.flist}" var="narutoList">
								<input class="profile_img" type="radio"
									id="${narutoList.fileName}" value="${narutoList.uuid}"
									name="uuid" data-title="${naruto.title}" />
								<label for="${narutoList.fileName}"> <img
									class="imgBox3" alt="없음" id="${narutoList.uuid }"
									src="/upload/userProfile/${fn: replace(narutoList.saveDir, '\\','/')}/${narutoList.uuid }_${narutoList.fileName}">
								</label>
							</c:forEach>

						</div>

						<div class="title" id="title">최애의 아이</div>
						<div class="carousel5">

							<c:forEach items="${oshinoko.flist}" var="oshinokoList">
								<input class="profile_img" type="radio"
									id="${oshinokoList.fileName}" value="${oshinokoList.uuid}"
									name="uuid" data-title="${oshinoko.title}" />
								<label for="${oshinokoList.fileName}"> <img
									class="imgBox3" alt="없음" id="${oshinokoList.uuid }"
									src="/upload/userProfile/${fn: replace(oshinokoList.saveDir, '\\','/')}/${oshinokoList.uuid }_${oshinokoList.fileName}">
								</label>
							</c:forEach>

						</div>







					</div>
					<!--wrapper끗  -->

					<hr>
					<div class="imgchoiceBtnArea">
						<button type="button" id="imgChoiceBtn">선택하기</button>
					</div>

					<!-- </div>그림선택 끝  -->
				</div>
			</div>


			<span class="material-symbols-outlined imgChecked"
				style="display: none;"> check </span>



			<!--======================== email ==============================  -->

			<div class="div6">
				<!--이메일 div  -->
				<div class="emailText">이메일</div>
				<div class="emailInput">
					<input type="text" id="email" name="email" class="emailArea"
						placeholder="이메일을 입력해주세요." autocomplete="off">
				</div>
				<button type="button" id="emailCheckBtn" class="emailBtn"
					disabled="disabled">이메일 인증</button>
				<p id="emailMsg" class="emailMsg"></p>
			</div>

			<!-- =======================email check ======================  -->
			<div class="div7">
				<!--인증번호 div  -->
				<div class="emailcText"></div>
				<div class="emailcInput">
					<input type="text" maxlength="7" onkeyup="checkAuthNum()"
						id="AuthNumInput" class="emailcArea" disabled="disabled"
						placeholder="인증번호를 입력하세요." onclick="checkAuthNum()">
				</div>
				<p id="emailCheckMsg" class="emailcMsg"></p>
			</div>

			<!-- ========================birth===============  -->

			<div class="div8">
				<!--생년월일 div  -->
				<div class="birthText">생년월일</div>

				<!-- 				<div class="birthInput">

					<input type="date" id="birth" name="birth" min="1950-01-01"
						max="2013-01-01" required pattern="\d{4}-\d{2}-\d{2}"
						class="birthArea">

				</div> -->


				<div class="birthBox">

					<div class="yearDiv">
						<div class="yearBox">
							<input type="text" id="birthYear" name="birthYear"
								placeholder="년도" class="birthYear" maxlength="4">
						</div>
					</div>

					<span class="yearDivision"></span>
					<div class="monthDiv">
						<div class="monthBox">
							<input type="text" id="birthMonth" name="birthMonth"
								placeholder="월" class="birthMonth" maxlength="2">
						</div>
					</div>

					<span></span>

					<div class="dayDiv">
						<div class="dayBox">
							<input type="text" id="birthDay" name="birthDay" placeholder="날짜"
								class="birthDay" maxlength="2">
						</div>
					</div>

					<input type="hidden" id="birth" name="birth">

				</div>
				.
				<p class="birthMsg" id="birthMsg"></p>
			</div>




			<!-- ================== button =========================  -->

			<div class="div9">

				<button type="submit" id="signBtn" class="signBtn"
					disabled="disabled">회원가입</button>
				<a href="/"><button type="button" class="cancleBtn">취소하기</button></a>
			</div>






		</div>
		<!-- 전체를 감싸는 div끝  -->


		<!--임시버튼  -->


	</form>



	<div id="emailPopup">
		<div class="emailPopup_content">
			<div class="emailModalTitle">
				인증 메일이 전송되었습니다.<br> 인증 번호를 입력해주세요.
				<div class="emailCloseBtn">
					<p class="emailCloseText">확인</p>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>


	<script type="text/javascript" src="/resources/js/userJoin.js"></script>

	<script type="text/javascript">
	   
   const profile_div = document.getElementById('profileImgDiv')
   
   const imgChoiceBtn = document.getElementById('imgChoiceBtn');
      
   const profile_img = document.querySelectorAll('.profile_img');
   
   
   let str = "";
   let img_src ="";
   
   
   let selectedImage = null;
   const checkmarkIcon = document.getElementById("checkmarkIcon");
   const selectedImageWrapper = document.getElementById("selectedImageWrapper");
   
   
   document.addEventListener('click', (e)=>{
       if(e.target.classList.contains('profile_img')){
           let title = e.target.dataset.title;
           let click_uuid = e.target.value;
           
        
           console.log(click_uuid); // 선택된 이미지의 uuid
           console.log(title); // 선택된 이미지의 title
           if(title == '히로아카'){
               console.log("히로아카 진입");
               console.log('히로아카 이미지클릭함!!!!!!!!!!!!!!!!!');

               
              img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src             
               str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`


               
               const selectImg = document.getElementById(click_uuid);
               if (selectedImage) {
                   selectedImage.style.border = "none";
               }
               selectImg.style.border = "5px solid #fca311";
               selectedImage = selectImg;

               // 선택된 이미지 테두리....
               const imgRect = selectedImage.getBoundingClientRect();
               selectedImageWrapper.style.left = imgRect.left + "px";
               selectedImageWrapper.style.top = imgRect.top + "px";
               selectedImageWrapper.style.display = "block";
           
           
           
           }
           else if(title == '화산귀환'){
               console.log("화산귀환 진입");
               console.log('화산귀환 이미지클릭함!!!!!!!!!!!!!!!!!');

               img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src
              str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
   
              const selectImg = document.getElementById(click_uuid);
              if (selectedImage) {
                  selectedImage.style.border = "none";
              }
              selectImg.style.border = "5px solid #fca311";
              selectedImage = selectImg;
  
              const imgRect = selectedImage.getBoundingClientRect();
              selectedImageWrapper.style.left = imgRect.left + "px";
              selectedImageWrapper.style.top = imgRect.top + "px";
              selectedImageWrapper.style.display = "block";
           }
           else if(title == '헌터헌터'){
               console.log("헌터헌터 진입");
               console.log('헌터헌터 이미지클릭함!!!!!!!!!!!!!!!!!');
               
               
              img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src
              str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
          
           
              const selectImg = document.getElementById(click_uuid);
              if (selectedImage) {
                  selectedImage.style.border = "none";
              }
              selectImg.style.border = "5px solid #fca311";
              selectedImage = selectImg;

              
              const imgRect = selectedImage.getBoundingClientRect();
              selectedImageWrapper.style.left = imgRect.left + "px";
              selectedImageWrapper.style.top = imgRect.top + "px";
              selectedImageWrapper.style.display = "block";
           

           }else if(title == '주술회전'){
               console.log("주술회전 진입");
               console.log('주술회전 이미지클릭함!');

              img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src
              str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`

              const selectImg = document.getElementById(click_uuid);
              if (selectedImage) {
                  selectedImage.style.border = "none";
              }
              selectImg.style.border = "5px solid #fca311";
              selectedImage = selectImg;
 
              const imgRect = selectedImage.getBoundingClientRect();
              selectedImageWrapper.style.left = imgRect.left + "px";
              selectedImageWrapper.style.top = imgRect.top + "px";
              selectedImageWrapper.style.display = "block";
              
           }else if(title == '나루토'){
               console.log("나루토 진입");
               console.log('나루토 이미지클릭함!');

              img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src
              str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`

              const selectImg = document.getElementById(click_uuid);
              if (selectedImage) {
                  selectedImage.style.border = "none";
              }
              selectImg.style.border = "5px solid #fca311";
              selectedImage = selectImg;
 
              const imgRect = selectedImage.getBoundingClientRect();
              selectedImageWrapper.style.left = imgRect.left + "px";
              selectedImageWrapper.style.top = imgRect.top + "px";
              selectedImageWrapper.style.display = "block";
              
           }else if(title == '최애의아이'){
               console.log("최애의아이 진입");
               console.log('최애의아이 이미지클릭함!');

              img_src = document.getElementById(click_uuid).getAttribute("src");
              console.log(img_src); // 선택된 이미지의 src
              str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`

              const selectImg = document.getElementById(click_uuid);
              if (selectedImage) {
                  selectedImage.style.border = "none";
              }
              selectImg.style.border = "5px solid #fca311";
              selectedImage = selectImg;
 
              const imgRect = selectedImage.getBoundingClientRect();
              selectedImageWrapper.style.left = imgRect.left + "px";
              selectedImageWrapper.style.top = imgRect.top + "px";
              selectedImageWrapper.style.display = "block";
              
           }
           
           console.log(str);

       }
   })

   profile_div.addEventListener('click',()=>{
        console.log('선택됨. 이건 프로필을 고를때 누르는거');
    })


   
   imgChoiceBtn.addEventListener('click', ()=>{
		profile_div.innerHTML = str;
		document.getElementById("select_img").src = img_src;
          modal.style.display = 'none'; // modal창 close
          body.style.overflow = 'auto';
   });
	
   
</script>

</body>
</html>