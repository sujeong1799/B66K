<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/home.css">
<link
	href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.css'
	rel='stylesheet' />
<!-- <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/
bootstrap.min.css'> -->
<link
	href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<jsp:include page="./layout/header.jsp"></jsp:include>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>

	<div id="wrap">


		<!-- @@@@ 메인 비디오 @@@@  -->
		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<a href="/book/ProductDetail?bno=76"><img
					src="/resources/img/나의히어로아카데미아_logo.png"></a>
			</div>
			<a href="/book/ProductDetail?bno=76"><video id="mainVideo"
					autoplay loop muted>
					<source src="/resources/img/나의히어로아카데미아.mp4" id="mainMovie">
				</video></a>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<a href="/book/ProductDetail?bno=45"><img
					src="/resources/img/최애의아이_logo.png"></a>
			</div>
			<a href="/book/ProductDetail?bno=45"><video id="mainVideo"
					autoplay loop muted>
					<source src="/resources/img/최애의아이.mp4" id="mainMovie">
				</video></a>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<a href="/book/ProductDetail?bno=169"><img
					src="/resources/img/주술회전_logo.png"></a>
			</div>
			<a href="/book/ProductDetail?bno=169"><video id="mainVideo"
					autoplay loop muted>
					<source src="/resources/img/주술회전.mp4" id="mainMovie">
				</video></a>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<a href="/book/ProductDetail?bno=129"><img
					src="/resources/img/헌터헌터_logo.png"></a>
			</div>
			<a href="/book/ProductDetail?bno=129"><video id="mainVideo"
					autoplay loop muted>
					<source src="/resources/img/헌터헌터.mp4" id="mainMovie">
				</video></a>
		</div>

		<div class="movieDiv">
			<div class="musicSoundOn" id="musicSoundOn">
				<img src="/resources/img/sound_on.png">
			</div>
			<div class="musicSoundOff" id="musicSoundOff">
				<img src="/resources/img/sound_off.png">
			</div>
			<div class="logo">
				<a href="/book/ProductDetail?bno=170"><img
					src="/resources/img/나루토_logo.png"></a>
			</div>
			<a href="/book/ProductDetail?bno=170"><video id="mainVideo"
					autoplay loop muted>
					<source src="/resources/img/나루토.mp4" id="mainMovie">
				</video></a>
		</div>
		<a class="slideButton prevButton" onclick="prevSlide()"><i
			class="fa-solid fa-chevron-left" style="color: #cccccc;"></i></a> <a
			class="slideButton nextButton" onclick="nextSlide()"><i
			class="fa-solid fa-chevron-right" style="color: #cccccc;"></i></a> <br>
		<br>


		<!-- @@@@ 신작 슬라이드 @@@@ -->


		<div class="homeContent">
			<div class="newBook">
				<div class="newBookText">
					<span>2023년 7월 신작</span>
				</div>
				<div class="slideNewBook">
					<i class="fa-solid fa-chevron-left slidePrevBtn"
						onclick="prevNewSlide()"></i>
					<c:forEach items="${monthlylist}" var="bdto">
						<div class="slideBox">
							<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
								class="titlePic" alt="표지가 없어요"
								src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
							<p>${bdto.bvo.title }</p>
						</div>

					</c:forEach>
					<i class="fa-solid fa-chevron-right slideNextBtn"
						onclick="nextNewSlide()"></i>
				</div>
			</div>
			<br> <br> <br>
			<div class="rankArea">
				<div class="rankCover">
					<hr>
					<div class="rankSide">
						<p>RANKING</p>
						<div class="rankCategory">
							<div class="saleAmountRankName">
								<span id="saleAmountRank" onclick="showSalesRank()">판매순</span>
							</div>
							<div class="ratinAvgRankName">
								<span id="ratingAvgRank" onclick="showRatingRank()">평점순</span>
							</div>
							<div class="reviewRankName">
								<span id="reviewRank" onclick="showReviewRank()">리뷰순</span>
							</div>
						</div>
					</div>
					<div class="saleAmountRank">
						<div class="saleAmountContent">
							<div class="imgBox">
								<div class="rank">
									<img alt="순위없음" src="/resources/img/rank1.png">
								</div>
								<div class="rank">
									<img alt="순위없음" src="/resources/img/rank2.png">
								</div>
								<div class="rank">
									<img alt="순위없음" src="/resources/img/rank3.png">
								</div>
								<div class="rank">
									<img alt="순위없음" src="/resources/img/rank4.png">
								</div>
								<div class="rank">
									<img src="/resources/img/rank5.png">
								</div>
							</div>

							<c:forEach items="${salelist}" var="bdto">
								<div class="saleAmountBox">
									<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"> <img
										class="titlePic" alt="표지가 없어요"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
									<p>${bdto.bvo.title }</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="ratingAvgRank">
						<div class="ratingAvgContent">
							<div class="imgBox">
								<div class="rank1">
									<img alt="순위없음" src="/resources/img/rank1.png">
								</div>
								<div class="rank1">
									<img alt="순위없음" src="/resources/img/rank2.png">
								</div>
								<div class="rank1">
									<img alt="순위없음" src="/resources/img/rank3.png">
								</div>
								<div class="rank1">
									<img alt="순위없음" src="/resources/img/rank4.png">
								</div>
								<div class="rank1">
									<img src="/resources/img/rank5.png">
								</div>
							</div>
							<c:forEach items="${ratinglist}" var="bdto">
								<div class="ratingAvgBox">
									<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
										class="titlePic" alt="표지가 없어요"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
									<p>${bdto.bvo.title }</p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="reviewRank">
						<div class="reviewContent">
							<div class="imgBox2">
								<div class="rank2">
									<img alt="순위없음" src="/resources/img/rank1.png">
								</div>
								<div class="rank2">
									<img alt="순위없음" src="/resources/img/rank2.png">
								</div>
								<div class="rank2">
									<img alt="순위없음" src="/resources/img/rank3.png">
								</div>
								<div class="rank2">
									<img alt="순위없음" src="/resources/img/rank4.png">
								</div>
								<div class="rank2">
									<img src="/resources/img/rank5.png">
								</div>
							</div>
							<c:forEach items="${reviewlist}" var="bdto">
								<div class="reviewBox">
									<a href="/book/ProductDetail?bno=${bdto.bvo.bno}"><img
										class="titlePic" alt="표지가 없어요"
										src="/upload/${fn: replace(bdto.bivo.saveDir, '\\','/')}/${bdto.bivo.uuid }_${bdto.bivo.fileName}"></a>
									<p>${bdto.bvo.title }</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>

		<a href="#"><button class="eventTop" type="button"
				data-is-hidden="false">
				<svg width="1em" height="1em" viewBox="0 0 30 30" fill="none"
					xmlns="http://www.w3.org/2000/svg" aria-label="맨 위로 스크롤">
    <path fill-rule="evenodd" clip-rule="evenodd"
						d="M6.582 13.436a.8.8 0 01-1.164-1.098l9-9.54a.8.8 0 011.164 0l9 9.54a.8.8 0 11-1.164 1.098L15.8 5.36v20.483a.8.8 0 11-1.6 0V5.36l-7.618 8.075z"
						fill="currentColor"></path>
  </svg>
			</button></a> <br>

		<!-- 달력부분  -->

		<div class="calendarArea">

			<span>신작 일정</span>

			<div id='calendar' class="calendar"></div>

		</div>




		<!-- 달력모달창  -->



		<div class="modal fade" id="event-modal-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title1">화산귀환 3 - 7월 16일</h4>
					</div>
					<div class="modal-body">
						<p>매화검존의 은신처에서 설매단을 복용하나 흐름을 통제하지 못하는 청명.</p>
						<p>주화입마가 오기 직전, 장문 사형의 가르침을 깨닫는다.</p>
						<img src="/resources/img/cal_화산귀환3.png" alt="Image 1"
							style="max-width: 100%;"> <a
							href="/book/ProductDetail?bno=123"><button type="button"
								class="productBtn">보러가기</button></a>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="event-modal-2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title2">최애의아이 11 - 7월 31일</h4>
					</div>
					<div class="modal-body">
						<p>아이와 고로를 죽음으로 몰아넣은 진범에게 강한 분노를 품은 루비는 여러 곳에 균열을 만들면서도 연예계
							정상을 향해 달려간다. 또한 아쿠아도 사이토 이치고와 대화하며 자신의 논리에 착오가 있음을 깨닫고 다시금 복수심에
							불이 붙는다.</p>
						<p>한편, 아이돌 활동에 대해 고민하기 시작한 아리마 카나는 연기 일을 받을 수 있지 않을까 하는 생각으로
							참가한 회식에서 거물 영화 감독과 인맥이 생기게 된다. 그러나 이것이 '스캔들'로 발전하게 되고...</p>
						<p>대소동이 일어나는 제11권!!</p>
						<img src="/resources/img/cal_최애의아이11.jpg" alt="Image 2"
							style="max-width: 100%;"> <a
							href="/book/ProductDetail?bno=45"><button type="button"
								class="productBtn">보러가기</button></a>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="event-modal-3">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title3">스파이 패밀리 - 7월 26일</h4>
					</div>
					<div class="modal-body">
						<p>'가족'의 힘으로 세상을 구하라!!</p>
						<p>입시&세계 위기에 맞서는 통쾌한 홈코미디</p>
						<img src="/resources/img/cal_스파이패밀리11.jpg" alt="Image 2"
							style="max-width: 100%;"> <a
							href="/book/ProductDetail?bno=44"><button type="button"
								class="productBtn">보러가기</button></a>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="event-modal-4">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title4">나의 히어로 아카데미아 38 - 7월 28일</h4>
					</div>
					<div class="modal-body">
						<p>깨어난 쿠로기리의 ‘개성(워프)’으로 다비와 트와이스의 피를 사용한 토가 히미코가 군가 산장 터에 집결하게
							되면서 히어로들의 분단 작전은 거의 와해될 지경이다. 여기서 적에게 굴복하면 세계는 끝장날지도 몰라.</p>
						<p>미도리야 소년, 넌 여전히 누군가의 미소를 위해 싸우고 있는 거니? 나도 사실은 누군가를 위해….</p>
						<img src="/resources/img/cal_나의히어로아카데미아38.jpg" alt="Image 2"
							style="max-width: 100%;"> <a
							href="/book/ProductDetail?bno=38"><button type="button"
								class="productBtn">보러가기</button></a>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="event-modal-5">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title5">스킵과 로퍼 - 7월 25일</h4>
					</div>
					<div class="modal-body">
						<p>도쿄에서의 첫 고교 생활, 겨울의 도래.</p>
						<p>밸런타인에 마음이 들썩이고, 화이트데이에 가슴 설레는 천연 해피 바이러스 미츠미의 고1 라이프는 진급을
							앞두고 봄을 향해간다!</p>
						<img src="/resources/img/cal_스킵과로퍼6.jpg" alt="Image 2"
							style="max-width: 100%;"> <a
							href="/book/ProductDetail?bno=46"><button type="button"
								class="productBtn">보러가기</button></a>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="event-modal-6">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title6">환괴지대:에테르의 마을 - 7월 27일</h4>
					</div>
					<div class="modal-body">
						<p>《먼지의 마왕》, 《에테르의 마을》, 《괴기 히키즈리 남매 제3화 케타노스케 삼촌》, 《만쥬늪의 등딱지》
							명작 《히키즈리 남매》시리즈의 시작을 비롯해 이토준지의 정수를 담은 총 4편의 단편 수록!!</p>

						<img src="/resources/img/cal_환괴지대_에테르의마을.jpg" alt="Image 2"
							style="max-width: 100%;"> <a
							href="/book/ProductDetail?bno=50"><button type="button"
								class="productBtn">보러가기</button></a>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="event-modal-7">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title7">꿈빛 파티시엘 11, 12 - 8월 9일</h4>
					</div>
					<div class="modal-body">
						<p>아마노 이치고는 케이크를 좋아하는 14세 소녀. 우연히 이치고의 뛰어난 미각을 알게 된 제과 학교 성 마리
							학원의 강사 앙리는 이치고에게 성 마리 학원으로 전학할 것을 제안하고, 파티시에가 되는 것이 꿈이었던 이치고는 이를
							받아들여 파티시에가 되기 위한 발걸음을 내딛는다.</p>
						<p>제과에는 초보인 이치고는 모든 게 생소할 뿐이었지만, 학교에서 전설로만 전해져 온 과자의 정령 바닐라와
							만나 파트너를 이루게 되면서...?!</p>

						<img src="/resources/img/cal_꿈빛파티시엘12.png" alt="Image 2"
							style="max-width: 100%;"> <a
							href="/book/ProductDetail?bno=50"><button type="button"
								class="productBtn">보러가기</button></a>
					</div>
				</div>
			</div>
		</div>



		<div class="mainEventPic">
			<hr>
			<br> <br>
			<div>
				<a href="/book/event"><img alt=""
					src="resources/img/메인_이벤트_화산귀환.png"></a>
			</div>

			<div>
				<a href="/book/event2"><img alt=""
					src="resources/img/메인_이벤트_최애의아이.png"></a>
			</div>
		</div>
	</div>

	<jsp:include page="./layout/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/js/home.js"></script>


	<script
		src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
	<script
		src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/jquery.min.js'></script>
	<script
		src='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.js'></script>
	<script
		src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min
.js'></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


	<script>
		$(document).ready(function() {
			$('#calendar').fullCalendar({
				initialView : 'dayGridMonth',
				defaultDate : "2023-07-01",

				events : [ {
					title : '화산귀환 3',
					start : '2023-07-16',
					backgroundColor : 'black',
					color : 'white',
					eventModal : 'event-modal-1'
				}, {
					title : '최애의아이 11',
					start : '2023-07-31',
					backgroundColor : '#af8ee0',
					color : '#af8ee0',
					eventModal : 'event-modal-2'
				}, {
					title : '스파이 패밀리 11',
					start : '2023-07-26',
					backgroundColor : '#e2e27d',
					color : '#e2e27d',
					textColor : 'black',
					eventModal : 'event-modal-3'
				}, {
					title : '나의 히어로 아카데미아 38',
					start : '2023-07-28',
					backgroundColor : '#e22117',
					color : '#e22117',
					textColor : 'wihte',
					eventModal : 'event-modal-4'
				}, {
					title : '스킵과 로퍼 6',
					start : '2023-07-25',
					backgroundColor : '#b7ebf4',
					color : '#b7ebf4',
					textColor : 'black',
					eventModal : 'event-modal-5'
				}, {
					title : '환괴지대 : 에테르의 마을',
					start : '2023-07-27',
					backgroundColor : '#b99b92',
					color : '#b99b92',
					textColor : 'black',
					eventModal : 'event-modal-6'
				}, {
					title : '꿈빛 파티시엘 11, 12',
					start : '2023-08-09',
					backgroundColor : '#ccf9d5',
					color : '#ccf9d5',
					textColor : 'black',
					eventModal : 'event-modal-7'
				},

				],
				eventClick : function(calEvent, jsEvent, view, resourceObj) {
					var eventModalId = calEvent.eventModal;
					$('#' + eventModalId).modal('show');
				}
			});
		});
	</script>
</body>
</html>