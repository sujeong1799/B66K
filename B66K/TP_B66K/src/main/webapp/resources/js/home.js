let currentSlideIndex = 0;
const movieDivs = document.querySelectorAll('.movieDiv');

function showSlide(index) {
    movieDivs.forEach((div, idx) => {
        if (idx === index) {
            div.classList.add('active');
        } else {
            div.classList.remove('active');
        }
    });

    // 현재 영상을 처음부터 재생
    const activeVideo = movieDivs[index].querySelector('video');
    activeVideo.currentTime = 0;
}

function prevSlide() {
    const currentVideo = movieDivs[currentSlideIndex].querySelector('video');
    currentVideo.muted = true;

    // 이전 슬라이드로 이동합니다.
    currentSlideIndex = (currentSlideIndex - 1 + movieDivs.length) % movieDivs.length;
    showSlide(currentSlideIndex);
}

function nextSlide() {
    const currentVideo = movieDivs[currentSlideIndex].querySelector('video');
    currentVideo.muted = true;

    currentSlideIndex = (currentSlideIndex + 1) % movieDivs.length;
    showSlide(currentSlideIndex);


}

// 초기 슬라이드 표시
showSlide(currentSlideIndex);





// 음소거/음소거 해제를 처리하는 함수입니다.
function toggleMute(video, musicSoundOn, musicSoundOff) {
  if (video.muted) {
    video.muted = false;
    musicSoundOff.style.display = 'none';
    musicSoundOn.style.display = 'block';
  } else {
    video.muted = true;
    musicSoundOn.style.display = 'none';
    musicSoundOff.style.display = 'block';
  }
}

// 각 movieDiv에 대해 클릭 이벤트 리스너를 설정합니다.
movieDivs.forEach((movieDiv) => {
  const video = movieDiv.querySelector('video');
  const musicSoundOn = movieDiv.querySelector('.musicSoundOn');
  const musicSoundOff = movieDiv.querySelector('.musicSoundOff');

  // 각 musicSoundOn 요소에 클릭 이벤트 리스너를 추가합니다.
  musicSoundOn.addEventListener('click', () => {
    toggleMute(video, musicSoundOn, musicSoundOff);
  });

  // 각 musicSoundOff 요소에 클릭 이벤트 리스너를 추가합니다.
  musicSoundOff.addEventListener('click', () => {
    toggleMute(video, musicSoundOn, musicSoundOff);
  });
});



// 신작 슬라이드 
let slideIndex = 0;

	function showSlides() {
	    const slides = document.getElementsByClassName("slideBox");
	    const slideGroupSize = 5; // 한 그룹에 보여줄 슬라이드 개수
	    const totalGroups = Math.ceil(slides.length / slideGroupSize);

	    let startIndex = slideIndex * slideGroupSize;
	    let endIndex = startIndex + slideGroupSize;

	    // 슬라이드 그룹에 해당하는 슬라이드들만 보이도록 설정
	    for (let i = 0; i < slides.length; i++) {
	        if (i >= startIndex && i < endIndex) {
	            slides[i].style.display = "block";
	        } else {
	            slides[i].style.display = "none";
	        }
	    }
	}

	function nextNewSlide() {
	    const slides = document.getElementsByClassName("slideBox");
	    const slideGroupSize = 5; // 한 그룹에 보여줄 슬라이드 개수
	    const totalGroups = Math.ceil(slides.length / slideGroupSize);

	    slideIndex = (slideIndex + 1) % totalGroups;
	    showSlides();
	}

	function prevNewSlide() {
	    const slides = document.getElementsByClassName("slideBox");
	    const slideGroupSize = 5; // 한 그룹에 보여줄 슬라이드 개수
	    const totalGroups = Math.ceil(slides.length / slideGroupSize);

	    slideIndex = (slideIndex - 1 + totalGroups) % totalGroups;
	    showSlides();
	}

	// 페이지 로드 시 슬라이드 초기화
	showSlides();
	
	
	
	// 판매순, 평점순, 리뷰순
 function showSalesRank() {
    document.querySelector(".saleAmountContent").style.display = "block";
    document.querySelector(".ratingAvgRank").style.display = "none";
    document.querySelector(".reviewRank").style.display = "none";

    document.getElementById('saleAmountRank').style.color = "black";
    document.getElementById('ratingAvgRank').style.color = "#bcbcbc";
    document.getElementById('reviewRank').style.color = "#bcbcbc";
    
  }

  function showRatingRank() {
    document.querySelector(".saleAmountContent").style.display = "none";
    document.querySelector(".ratingAvgRank").style.display = "block";
    document.querySelector(".reviewRank").style.display = "none";

    document.getElementById('saleAmountRank').style.color = "#bcbcbc";
    document.getElementById('ratingAvgRank').style.color = "black";
    document.getElementById('reviewRank').style.color = "#bcbcbc";
    
  }
  
 function showReviewRank() {
  document.querySelector(".saleAmountContent").style.display = "none";
  document.querySelector(".ratingAvgRank").style.display = "none";
  document.querySelector(".reviewRank").style.display = "block";

  document.getElementById('saleAmountRank').style.color = "#bcbcbc";
  document.getElementById('ratingAvgRank').style.color = "#bcbcbc";
  document.getElementById('reviewRank').style.color = "black";
}

