



function checkFormValidity() {
   const titleInput = document.getElementById('exampleFormControlInput1');
   const contentTextarea = document.getElementById('exampleFormControlTextarea1');
   const submitBtn = document.getElementById('faqrgsSubmitBtn');

   // title 또는 content 중 하나라도 비어있을 경우 버튼 비활성화
   if (titleInput.value.trim() === '' || contentTextarea.value.trim() === '') {
       submitBtn.disabled = true;
   } else {
       submitBtn.disabled = false;
   }
}

// input과 textarea의 입력이 변경될 때마다 유효성 검사 함수 호출
document.getElementById('exampleFormControlInput1').addEventListener('input', checkFormValidity);
document.getElementById('exampleFormControlTextarea1').addEventListener('input', checkFormValidity);

// 페이지 로드 시에도 한 번 유효성 검사 함수 호출
checkFormValidity();





async function getFaqListFromServer(fno) {
    try {
       // 컨트롤러로 보낼거여
       // 데이터가 controller로 이동한 후 컨트롤러 처리를 하고 응답데이터를 가져와서 resp에 저장한다.
       const resp = await fetch('/faq/list/' + fno); //  cmt/list/1
       const faqList = await resp.json(); // 댓글 객체가 리턴된다.
       return faqList;
 
    } catch (error) {
       console.log(error);
    }
 }


 // 임시호출.
 // result == cmtList 이름을 뭘로 받던지    상관없음.
 // 통신 완료 후 가져온 리스트를 콘솔에 찍어본 작업
 
 function printfaqList(fno) {
    getFaqListFromServer(fno).then(result => { // 아까는 바로 뿌릴꺼라서 bnoVal로 받았지만 호출해서 하는거면 bno로 받아
       console.log(result);
       if (result?.length > 0) {
          spreadfaqList(result);
       } else {
          let div = document.getElementById('accordionFlushExample'); // 글이 없으면 아래가 실행
          div.innerText = "글이 없습니다.";
       } 
    })
 }



function spreadfaqList(result) { // 여기 들어가는건 댓글 List
   console.log(result);
   let div = document.getElementById('accordionFlushExample'); // 전체 div는 그대로 있고 나머지 div만 반복해야함
   div.innerHTML = ""; // 밑에 div 값을 다 날려 > 댓글이 여러개면 이걸 반복해야함
   for (let i = 0; i < result.length; i++) {
      let html = `<div class="accordion-item">`;
      html += `<h2 class="accordion-header" id="heading${i}">`; // one을 지우고 ${i} 추가
      html += `<button class="accordion-button" type="button"
               data-bs-toggle="collapse" `
      html += `data-bs-target="#collapse${i}";
               aria-expanded="false" aria-controls="collapse${i}">`
      html += `${result[i].title} </button></h2> `; // 제목
      html += `<div id="collapse${i}" class="accordion-collapse collapse show"`;
      html += `aria-labelledby="heading${i}"
            data-bs-parent="#accordionExample">`;
      html += `<div class="accordion-body"">`;
      html += `<input type="text" class="form-control" value="${result[i].content}">`; // 댓글 담을 공간 부트스트랩에서 가져옴ㅋ
      html += `</div></div></div>`;
      div.innerHTML += html; // 누적해서 담기
   }
} 


function syncSidebarAndfaqrgsdivHeights_faqrgsdiv() {
    const sideBar = document.querySelector('.SideBar');
    const faqrgsdiv = document.querySelector('.faqrgsdiv');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, faqrgsdiv.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    faqrgsdiv.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndfaqrgsdivHeights_faqrgsdiv);
  window.addEventListener('resize', syncSidebarAndfaqrgsdivHeights_faqrgsdiv);

