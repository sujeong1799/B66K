
// 리뷰 박스 클릭시 로그인 안했으면 alert창 뜨기 

document.getElementById('ReviewWriteBox').addEventListener('click', ()=>{
    const userId = idVal;
    if(userId == null || userId == ""){
        popup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('로그인 후 이용해주세요!');
    }
})



// 리뷰평점
async function postReviewToServer(revData){

    try {
        const url = '/review/post';
        const config = {
            method: 'post',
            headers: {
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(revData)
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;

    } catch (err) {
        console.log(err);
    }
}

// 리뷰 등록
document.getElementById('revPostBtn').addEventListener('click', () => {
    const revText = document.getElementById('revText').value;
    const id = document.getElementById('revid').innerText;

    if (revText === "" || revText === null) {
        popup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('내용이 없습니다. 리뷰를 남겨주세요.');
        document.getElementById('revText').focus();
        return false;
    }else if(revText.length > 50) {

        /* alert("50글자를 넘었네요 캯"); */
        popup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('50자 이내로 작성해주세요.');
        
        
        
    }else{
        let revData = {
            bno: bnoVal,
            id: document.getElementById('revid').innerText,
            content: revText,
            rating: document.querySelector('.rating:checked').value
        };
        console.log(revData);
        postReviewToServer(revData).then(result=>{
            if(result > 0){
                popup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('리뷰를 등록했습니다.');
                getReviewList(revData.bno);
                getStars();
            }
        })
    }
})



async function spreadReviewFromServer(bno){
    console.log(bno);
    try{
        const resp = await fetch('/review/'+bno);
        const result = await resp.json();
        return result;
    }catch(err){
        console.log(err);
    }
}




// 등록된 리뷰 불러오기 
const initReviewCount = 5; // 5개씩 리뷰 보여주기
let currentReviewCount = initReviewCount; // 버튼을 누를때마다 current값 증가시켜서 추가 리큐 가져오기

function getReviewList(bno){
    spreadReviewFromServer(bno).then(result =>{
        const ul = document.getElementById('revListArea');
        const userId = idVal;
        const role = roleVal;
        const reviewCount = document.getElementById('reviewCount');


        console.log(`그래서 크기가 몇이야 >> "${result.length}"`);

        if(result.length > 0){
          let resultLen = `${result.length}명의 b66k 회원이 평가한 평균 별점`;
            reviewCount.innerHTML = resultLen;
        }else{
            let resultLen = `아직 등록된 평점이 없습니다.`;
            reviewCount.innerHTML = resultLen;
        }

        if(result?.length > 0){

            ul.innerHTML = "";

            
            const endIndex = currentReviewCount <= result.length ? currentReviewCount : result.length;

            for(let i=0; i < endIndex; i++){
                const rvo = result[i];
                let li = `<div class="reviewAreaBox"><li data-rno ="${rvo.rno}">`;
                li += `<span class="starRating">`;
                const star = `${rvo.rating}`;
                for(let k=1; k<6; k++){
                    if(k<=star){
                        li += `<i class="fas fa-star"></i>`;
                    }else{
                        li += '<i class="far fa-star"></i>';
                    }
                }
                
                li += `</span>`;
                if(userId == rvo.id || role == 'admin'){
                    li += `<button type="button" class="delBtn"><i class="fa-solid fa-xmark" style="color: #787878;"></i></button></li>`;
                }
                li += `<div class="revTextBox"><span id="revTextMod">${rvo.content}</div>`;
                li += `<div><span class="rvoId">${rvo.id}</span><span class="regDate"> ${formatDate(rvo.regDate)}</span></div>`;
            
                li += `</div>`;
                ul.innerHTML += li;
            }

        }else{
            let li = `<li class="ReviewZero"> 등록된 리뷰가 없습니다. </li>`;
            ul.innerHTML = li;
        }
        
    });
}

// 더보기 버튼 이벤트
document.getElementById('moreReview').addEventListener('click', function(){
    currentReviewCount += initReviewCount; // 추가로 보여질 리뷰 개수 증가
    getReviewList(bnoVal); // 변경된 개수로 다시 리뷰 불러오기
})



// 리뷰 삭제하기
async function removeReviewToServer(rno){
    try{
        const url = '/review/'+rno;
        const config={
            method:'delete'
        };
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;
    }catch(err){
        console.log(err);
    }
}

document.addEventListener('click', (e)=>{
    console.log(e.target);
    if(e.target.classList.contains('delBtn')){
        console.log("삭제버튼 클릭시");
        let li = e.target.closest('li');
        let rnoVal = li.dataset.rno;
        console.log(rnoVal);
        removeReviewToServer(rnoVal).then(result => {
            if(result > 0){
                popup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('리뷰를 삭제했습니다.');
            }
            window.location.reload();
            getReviewList(rnoVal);
            getStars();
        })

    }
})


// 평점 가져오기
function getStars() {
const averageRating = ratingAvgVal;
    console.log(averageRating);
  
  
    for (var i = 1; i < 6; i++) {
      if (i < averageRating) {
        divbox.innerHTML += `<span class="stars">&#9733;</span>`;
      } else {
        divbox.innerHTML += `<span class="stars">&#9734;</span>`;
      }
    }
  }



// 년도, 월, 일만 뽑아오기
function formatDate(dateStr) {
    const dateObj = new Date(dateStr);
    const year = dateObj.getFullYear();
    const month = String(dateObj.getMonth() + 1).padStart(2, '0');
    const day = String(dateObj.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }

// 리뷰 평점 별로 표현하기
  // 평점을 가져오는 함수 (여기서는 임의로 4.5를 사용)
  const rating = ratingAvgVal; // 여기서는 서버에서 평점을 받아와서 사용합니다.

  // 별 아이콘을 표시할 div 요소를 가져옵니다.
  const starIconsDiv = document.getElementById('starIcons');
  const starIconsDiv2 = document.getElementById('starIcons2');

  // 평점에 따라 별 아이콘을 생성하여 div에 추가합니다.
  function displayStarIcons(rating, targetDiv) {
    const fullStars = Math.floor(rating); // 평점의 정수 부분만 구합니다.
    const emptyStars = 5 - fullStars; // 빈 별의 개수를 구합니다.


    // 정수 부분의 평점만큼 채워진 별 아이콘을 생성하여 div에 추가합니다.
    for (let i = 0; i < fullStars; i++) {
      const starIcon = document.createElement('i');
      starIcon.className = 'fas fa-star';
      targetDiv.appendChild(starIcon);
    }

    // 남은 빈 별 아이콘을 생성하여 div에 추가합니다.
    for (let i = 0; i < emptyStars; i++) {
      const starIcon = document.createElement('i');
      starIcon.className = 'far fa-star';
      targetDiv.appendChild(starIcon);
    }
  }

 // 첫 번째 별 아이콘 표시
displayStarIcons(rating, starIconsDiv);

// 두 번째 별 아이콘 표시
displayStarIcons(rating, starIconsDiv2);


