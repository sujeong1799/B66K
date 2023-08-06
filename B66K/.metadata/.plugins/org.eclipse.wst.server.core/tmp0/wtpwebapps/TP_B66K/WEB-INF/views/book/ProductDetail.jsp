<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/Productdetail.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
               
               

	<div class="ProductMain">
		<div class="ProductTitle">
			<div class="ProductPic">
				<!-- 파일 표시 영역 -->
				<div>
					<ul>
						<li style="list-style-type: none;"><c:if
								test="${bdto.bivo.fileType  > 0}">
								<div>
									<img class="titlePic" alt="표지가 없어요"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}">
									<!-- 해당 경로로 가서 uuid_fileName으로 만들어진 해당 파일을 가져옴  -->
								</div>
							</c:if>
					</ul>
				</div>


			</div>
			<div class="ProductInfo">
				<div class="Info">

					<h1>${bdto.bvo.title }</h1>
					<span class="InfoFont">${bdto.bvo.author } |
						${bdto.bvo.releaseDate } | 평점 ${bdto.bvo.ratingAvg }</span>
					<!-- @@@@ 별 아이콘을 표시할 div @@@@ -->
					<span id="starIcons"></span>
					<hr>
					<table>
						<tr class="ProductBox">
							<th class="dep">판매가</th>
							<!-- jstl을 이용해 숫자 콤마 넣는법 -->
							<td><fmt:formatNumber value="${bdto.bvo.price }" /></td>
						</tr>
						<tr class="ProductBox">
							<th class="dep">배송안내<br> <br> <br>
							</th>
							<td><span class="PostAdd" id="delivery">지금 주문 시 내일 도착</span><br>
								<span class="PostAdd" id="deliveryAddress">인천광역시 남동구 인주대로</span>
								<br> <a class="PostBtn"
								onclick="sample4_execDaumPostcode()">지역변경</a></td>
						</tr>
						<tr class="ProductBox2">
							<c:choose>
								<c:when test="${bdto.bvo.price >= 15000}">
									<th class="dep">배송비</th>
									<td>무료</td>
								</c:when>
								<c:otherwise>
									<th class="dep">배송비</th>
									<td>3000원 (15,000원 이상 무료)</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
					<br>
					<hr>
					<br>
					<div class="btnBox">
						<div class="favoritBox">
							<button class="FavoritBtn" data-bno="${bdto.bvo.bno}">
								<span class="material-symbols-outlined bg favoriteIcon"> favorite </span>
							</button>
							<button class="CartBtn" id="CartRegisterBtn">
								<span>카트에 담기</span>
							</button>
						</div>


					</div>
				</div>
			</div>
		</div>


		<div class="ProductContent">
			<!-- 해당 만화책이랑 이름이 같은 책들 슬라이드 -->
			<div class="slide_wrapper">
				<i id="left" class="fa-solid fa-chevron-left"></i>
				<div class="carousel">
					<c:forEach items="${RelationImgList}" var="imglist">
						<div class="ImgList">
							<a href="/book/ProductDetail?bno=${imglist.bno}"><img
								alt="사진없음"
								src="/upload/${fn: replace(imglist.saveDir, '\\','/')}/${imglist.uuid }_${imglist.fileName}"></a>
							<!-- imglist.fileName을 뽑으면 나의 히어로 아카데미아 2.jpg로 나와서 뒤에 jpg만 잘라서 넣어줄거임.. -->
							<c:set var="fileName" value="${imglist.fileName}" />
							<!-- 풀네임에서 .뒤에 있는거만 없애고 추출할거임. -->
							<c:set var="slideFileName"
								value="${fileName.substring(0, fileName.lastIndexOf('.'))}" />
							<!--추출한 이름 뿌리기 -->
							<div id="NameList">
								<a href="/book/ProductDetail?bno=${imglist.bno}"><span
									id="titleName${loop.index}">${slideFileName}
										${loop.index}</span></a>
							</div>
						</div>
					</c:forEach>
				</div>
				<i id="right" class="fa-solid fa-chevron-right"></i>
			</div>
			<br>
			<div class="ProductDetail">

				<div class="BookEvent">
					<a href="/book/event"><img class="BookEventImg" alt="없음"
						src="/resources/img/event1.png"></a> <a href="/book/event2"><img
						class="BookEventImg" alt="없음" src="/resources/img/event2.png"></a>
				</div>
				<br>
				<div class="BookIntro">
					<p>책소개</p>
					<div class="IntroContent">${bdto.bvo.intro }</div>
					<hr>

					<c:choose>
						<c:when test="${empty bdto.bvo.contentPage}">
							<!-- 아무 내용도 작성하지 않음 -->
						</c:when>
						<c:otherwise>
							<p>목차</p>
							<div class="contentPage">${bdto.bvo.contentPage}</div>
							<hr>
						</c:otherwise>
					</c:choose>
				</div>
				<br>
				<div>
					<!-- 파일 표시 영역 -->
					<div class="bookEventBox">

						<ul>
							<li style="list-style-type: none;"><c:if
									test="${eventPic.fileType  > 0}">
									<div>
										<img class="bookEventPic" alt=""
											src="/upload/${fn: replace(eventPic.saveDir, '\\','/')}/${eventPic.uuid }_${eventPic.fileName}">
										<!-- 해당 경로로 가서 uuid_fileName으로 만들어진 해당 파일을 가져옴  -->
									</div>
									<hr>

								</c:if>
						</ul>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- @@@@ Main 끝 @@@@ -->
	<!-- @@@ 리뷰 시작 @@@  -->
	<div class="ProductReview">

		<div class="ReviewBox">
			<br>
			<!-- 별점 라인 -->
			<p>한줄평</p>
			<div id="ReviewWriteBox" class="ReviewWriteBox">

				<div class="star-rating">
					<input class="rating" type="radio" id="5-stars" name="rating"
						value="5" /><label for="5-stars" class="star">&#9733;</label> <input
						class="rating" type="radio" id="4-stars" name="rating" value="4" /><label
						for="4-stars" class="star">&#9733;</label> <input class="rating"
						type="radio" id="3-stars" name="rating" value="3" /><label
						for="3-stars" class="star">&#9733;</label> <input class="rating"
						type="radio" id="2-stars" name="rating" value="2" /><label
						for="2-stars" class="star">&#9733;</label> <input class="rating"
						type="radio" id="1-star" name="rating" value="1" /><label
						for="1-star" class="star">&#9733;</label>
				</div>

				<!-- 댓글 작성라인 -->
				<div class="ReviewComment" align="center">
					<span id="revid">${ses.uvo.id}</span><br>
					<div class="revText">
						<textarea rows="3" cols="70" id="revText"
							placeholder="한글 기준 50자까지 작성 가능합니다."></textarea>
						<button type="button" id="revPostBtn" class="btn text-white"
							style="background-color: black">등록</button>
					</div>
				</div>
			</div>
			<br>
			<!-- 댓글 표시 라인 -->
			<br>
			<div align="center">
				<span id="reviewCount" style="font-size: 25px"></span>
			</div>
			<div align="center">
				<span id="starIcons2" class="fa-2x"></span> <span
					style="font-size: 25px">${bdto.bvo.ratingAvg } / 5</span>
			</div>
			<br>

			<!-- li 하나가 하나의 댓글 객체 -->
			<div class="reviewId">
				<c:set var="rvo" value="${ReviewVO.rvo }"></c:set>
				<ul id="revListArea">
					<li></li>
				</ul>
				<button class="moreReview" id="moreReview" type="button">
					더보기 <i class="fa-solid fa-chevron-down moreDown"
						style="color: #4f4f4f;"></i>
				</button>
			</div>

		</div>

	</div>
	<!-- ProductReivew끝 -->

	<br>
	<br>
	<!-- 반품 / 교환  -->
	<div class="claim">
		<table>
			<tbody>
				<tr class="tableLine">
					<th>반품/교환 방법</th>
					<td>
						<ul>
							<li>· [마이페이지] > [1:1문의] 또는 고객센터(032-719-4074)</li>
							<li>· 판매자 배송상품은 판매자와 반품/교환이 협의된 상품에 한해 가능</li>
						</ul>
					</td>
				</tr>
				<tr class="tableLine">
					<th>반품/교환 가능기간</th>
					<td>
						<ul>
							<li>· 변심반품의 경우 수령 후 7일 이내</li>
							<li>· 파본 등 상품결함 시 '문제점 발견 후 30일(단, 수령일로 부터 3개월)' 이내</li>
						</ul>
					</td>
				</tr>
				<tr class="tableLine">
					<th>반품/교환 비용</th>
					<td>
						<ul>
							<li>· 변심 혹은 구매착오의 경우에만 반송료 고객 부담</li>
							<li>· 해외직배송도서의 변심 혹은 구매착오로 인한 취소/반품은 판매가의 20% 취소수수료 고객 부담</li>
							<li><p>· 단, 아래의 주문/취소 조건인 경우, 취소 수수료 면제</p>
								<ul>
									<li>· 오늘 00시 ~ 06시 30분 주문을 오늘 오전 06시 30분 이전에 취소</li>
									<li>· 오늘 06시 30분 이후 주문을 익일 오전 06시 30분 이전에 취소</li>
								</ul></li>
						</ul>
					</td>
				</tr>
				<tr class="tableLine">
					<th>반품/교환 불가사유</th>
					<td>
						<ul>
							<li>· 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우</li>
							<li>· 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우 : 예) 화장품, 식품,
								가전제품, 전자책 단말기 등</li>
							<li>· 복제가 가능한 상품 등의 포장을 훼손한 경우 : 예) CD/LP, DVD/Blu-ray,
								소프트웨어, 만화책, 잡지, 영상 화보집</li>
							<li>· 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우</li>
							<li>· 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
							<li>· 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우</li>
						</ul>
					</td>
				</tr>
				<tr class="tableLine">
					<th>소비자 피해보상<br> 환불 지연에 따른 배상
					</th>
					<td>
						<ul>
							<li>· 상품의 불량에 의한 반품, 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은
								소비자분쟁해결기준 (공정거래위원회 고시)에 준하여 처리됨</li>
							<li>· 대금 환불 및 환불 지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에
								관한 법률에 따라 처리함</li>
						</ul>
					</td>
				</tr>
			</tbody>

		</table>
	</div>
	<br>

	            <a href="#"><button class="eventTop" type="button"
                  data-is-hidden="false">
                  <svg width="1em" height="1em" viewBox="0 0 30 30" fill="none"
                     xmlns="http://www.w3.org/2000/svg" aria-label="맨 위로 스크롤">
    <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M6.582 13.436a.8.8 0 01-1.164-1.098l9-9.54a.8.8 0 011.164 0l9 9.54a.8.8 0 11-1.164 1.098L15.8 5.36v20.483a.8.8 0 11-1.6 0V5.36l-7.618 8.075z"
                        fill="currentColor"></path>
  </svg>
               </button></a>





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

	<script>
    const body = document.querySelector("body");
    const popup = document.getElementById("popup");

    let modalMessage = document.getElementById('modalMessage');

    function setMessage(text) {
       modalMessage.innerText = text;
    }

    function closePopup() {
       popup.style.display = "none";
       body.style.overflow = "auto";
       window.location.reload();
    }

    document.querySelector(".popupCloseBtn").addEventListener(
          "click", closePopup);
	</script>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<script type="text/javascript" src="/resources/js/CartRegister.js"></script>
	<script type="text/javascript" src="/resources/js/FavoriteRegister.js"></script>

	<script type="text/javascript">
		const ratingAvgVal = '<c:out value="${bdto.bvo.ratingAvg}" />';
		console.log("평점 > " + ratingAvgVal);
	</script>
	<script type="text/javascript">
		const roleVal = '<c:out value="${ses.uvo.role}" />';
		console.log("회원등급 roleVal > " + roleVal);
	</script>
	<script type="text/javascript">
		const idVal = '<c:out value="${ses.uvo.id}" />';
		console.log("현재 로그인되어 있는 id > " + idVal);
	</script>
	<script type="text/javascript">
		const bnoVal = '<c:out value="${bdto.bvo.bno}" />';
		console.log("글번호 bno > " + bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/ProductReview.js"></script>
	<script type="text/javascript">
		getReviewList(bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/ProductDetail.js"></script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = '';
							// 참고 항목 변수

							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("deliveryAddress").innerText = roadAddr
									+ " 기준";

							updateDelivery();

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							}
						}
					}).open();

		}
	</script>
</body>

</html>