let pw = document.querySelector('#pw');
let pwc = document.querySelector('#pwc');
let pwMsg = document.querySelector('#pwMsg');
let pwcMsg = document.querySelector('#pwCheckMsg');
let updateBtn = document.getElementById('updateBtn');

let pwflag = true;
pwMsg.innerHTML = ``;
pwcMsg.innerHTML = ``;



const profile_div = document.getElementById('profileImgDiv')
   
const imgChoiceBtn = document.getElementById('imgChoiceBtn');

const imgBox = document.querySelectorAll('.imgBox');
const profile_img = document.querySelectorAll('.profile_img');
const uuid = document.querySelector('#uuid');

   let selectedImage = null;
   const checkmarkIcon = document.getElementById("checkmarkIcon");
   const selectedImageWrapper = document.getElementById("selectedImageWrapper");

let str = "";
let img_src ="";
document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('profile_img')){
        let title = e.target.dataset.title;
        let click_uuid = e.target.value;
        
        console.log(click_uuid); // 선택된 이미지의 uuid
        console.log(title); // 선택된 이미지의 title
        if(title == '히로아카'){
            console.log("히로아카 진입");
            console.log('이미지클릭함');

           img_src = document.getElementById(click_uuid).getAttribute("src");
           console.log(img_src); // 선택된 이미지의 src             
            str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
            console.log("선택전 uuid >>>>>>>>>>>>>>>"+uuid.value);
            uuid.setAttribute('value', click_uuid);


            console.log("선택한선택한선택한hiddenuuid>>>>"+uuid.value);
            
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
                
        }else if(title == '화산귀환'){
            console.log('화산귀환 이미지 선택');
           img_src = document.getElementById(click_uuid).getAttribute("src");
           console.log(img_src); // 선택된 이미지의 src
           str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
           uuid.setAttribute('value', click_uuid);
           
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
            console.log('헌터헌터 이미지 선택');
           img_src = document.getElementById(click_uuid).getAttribute("src");
           console.log(img_src); // 선택된 이미지의 src
           str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
           uuid.setAttribute('value', click_uuid);
           
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
            console.log('주술회전 이미지 선택');
           img_src = document.getElementById(click_uuid).getAttribute("src");
           console.log(img_src); 
           str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
           uuid.setAttribute('value', click_uuid);
           
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

        } else if(title == '나루토'){
            console.log('나루토 이미지 선택');
           img_src = document.getElementById(click_uuid).getAttribute("src");
           console.log(img_src); 
           str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
           uuid.setAttribute('value', click_uuid);
           
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
            console.log('최애의아이 이미지 선택');
           img_src = document.getElementById(click_uuid).getAttribute("src");
           console.log(img_src); // 선택된 이미지의 src
           str = `<img class="" alt="없음" src="" id="select_img" style="width:150px; height:150px; border-radius:50%;">`
           uuid.setAttribute('value', click_uuid);
           
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

imgChoiceBtn.addEventListener('click', ()=>{
     profile_div.innerHTML = str;
     document.getElementById("select_img").src = img_src;
       modal.style.display = 'none'; // modal창 close
       body.style.overflow = 'auto';
});



function pwCheck(){
    
    const pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;

    if(pw.value === ''){
        if(pwc.value === ''){
            pwflag = true;
            pwMsg.innerHTML = ``;
            pwcMsg.innerHTML = ``;
            console.log("pw 빈값, pwc 빈값 >> pwflag = "+pwflag);
        }else if(pwc.value != ''){
            pwflag = false;
            pwcMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
            console.log("pw 빈값 , pwc 값 있음 >> pwflag ="+pwflag);
        }
    }else if(pattern.test(pw.value)){
        if(pw.value === pwc.value){
            pwflag = true;
            pwMsg.innerHTML = ``;
            pwcMsg.innerHTML = ``;
            console.log("pw 정규식 통과 , pw랑 pwc 값 같음 >>>pwflag : "+pwflag);
        }else if(pw.value !== pwc.value){
            pwflag = false;
            pwMsg.innerHTML = ``;
            pwcMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
            console.log("pw정규식 통과, pw랑 pwc값 다름 >>>pwflag : "+pwflag);
        }
    }else if(!(pattern.test(pw.value))){
        pwflag =  false;
        pwMsg.innerHTML = `영문, 숫자, 특수문자로 조합된 8~20자리여야 합니다.`;
        console.log("pw 정규식 X >> pwflag >> "+pwflag);
    }


    if(pwc.value !== ''){
        if((pattern.test(pw.value)) && pw.value === pwc.value){
            pwflag = true;
            pwMsg.innerHTML = ``;
            pwcMsg.innerHTML = ``;
        }
    }else if(pwc.value === ''){
        if(pw.value===''){
            pwflag = true;
            pwMsg.innerHTML = ``;
            pwcMsg.innerHTML = ``;
        }
    }

}

pw.addEventListener('keyup', pwCheck);
pwc.addEventListener('keyup', pwCheck);

let nickname = document.querySelector('#nickname');
let nickMsg = document.querySelector('#nickMsg');
let nickflag = true;

nickname.addEventListener('keyup', function(){

        const pattern = /^[가-힣a-zA-Z0-9]{2,20}$/;
        //2-20글자 한글,영어,숫자 
    
        $.ajax({
            url : "/member/nicknameCheck",
            type : "POST",
            dataType : "JSON",
            data : {"nickname" : $("#nickname").val()},
            success : function(data){
                if(nickname.value === ''){
                    nickMsg.innerHTML = `입력한 내용이 없습니다.`;
                    nickMsg.style.color= 'rgb(86, 83, 83)';
                    nickflag = false;
                }else {
                    if(data == 1){
                        nickMsg.innerHTML = `이미 존재하는 닉네임입니다.`;
                        nickMsg.style.color = 'rgb(86, 83, 83)';
                        nickflag = false;
                    }else if(!pattern.test(nickname.value)){
                        nickMsg.innerHTML = `닉네임은 한글,영문,숫자를 이용한 2~20글자만 사용 가능합니다`;
                        nickMsg.style.color = 'rgb(86, 83, 83)';
                        nickflag = false;
                    }else if(data == 0 && pattern.test(nickname.value)){
                        nickMsg.innerHTML = ``;
                        nickMsg.style.color = 'rgb(86, 83, 83)';
                        nickflag = true;
                        console.log("nickname flag : "+nickflag);
                    }
    
                }
            }
        });
    });


//모달창 부분

const body = document.querySelector("body");
const userUpdatePopup = document.getElementById("userUpdatePopup");

let modalMessage = document.getElementById('modalMessage');

function setMessage(text){
    modalMessage.innerText =  text;
}

function closePopup() {
    userUpdatePopup.style.display = "none";
    body.style.overflow = "auto";
}

document.querySelector(".userUpdateCloseBtn").addEventListener("click", closePopup);

userUpdatePopup.addEventListener('click', e =>{
    const eTarget = e.target
    if(eTarget.classList.contains('userUpdatePopup')){
        userUpdatePopup.style.display = 'none';
        body.style.overflow = 'auto';
   }
})

function update(){

    $.ajax({
        url : "/member/edit",
        type : "POST",
        dataType : "JSON",
        data : {
            "id" : $("#id").val(),
            "pw" : $("#pw").val(),
            "email" : $("#email").val(),
            "nickname" : $("#nickname").val(),
            "birth" : $("#birth").val(),
            "uuid" : uuid.value
        },
        success : function(data){
                console.log("회원정보수정!!!!!!!!!!");
                
                userUpdatePopup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('회원정보가 수정되었습니다.');

                // alert('회원정보가 수정되었습니다');
                window.location.href = '/member/info'


        },
        error : function(request, status, error){
            alert("error발생! "+requestAnimationFrame.status+"\n"+"message"+request.responseText+"\n"+"error"+error);
        }
    
    });

};



function validation(){

    if(pwflag === true && nickflag == true){
        console.log('버튼눌렀을때 pwflag ===>> '+pwflag)
        console.log("hiddenUuid>>>>>>>>>>>>>>>>>>>>>>"+$("#uuid").val());
        console.log("hiddenUuid>>>>>>>>>>>>>>>>>>>>>>"+uuid.value);
        update();
    }else if(pwflag === false){
        userUpdatePopup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('비밀번호를 다시 입력해주세요.');
        // alert('비밀번호를 다시 입력해주세요.');
        console.log('버튼눌렀을때 pwflag ===>> '+pwflag)
        console.log("nickname>>>>>>>>>>>>>>>>>>>>>>>"+$("#nickname").val());
        console.log("hiddenUuid>>>>>>>>>>>>>>>>>>>>>>"+$("#uuid").val());
    }else if(nickflag == false){
        userUpdatePopup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('닉네임을 다시 입력해주세요.');
        // alert('닉네임을 다시 입력해주세요.');
        console.log("nickname>>>>>>>>>>>>>>>>>>>>>>>"+$("#nickname").val());
        console.log("hiddenUuid>>>>>>>>>>>>>>>>>>>>>>"+$("#uuid").val());
        console.log('버튼눌렀을때 nicknameflag ===>> '+nickflag);
    }
};

updateBtn.addEventListener('click', validation);



$(document).ready(function () {
  $('.pwVisibility').on('click', function () {
    let pw = $(this).siblings('ul').find('input');
    let pwInputType = pw.attr('type');

    if (pwInputType === 'password') {
      pw.prop('type', 'text');
      $(this).html('visibility_off');
    } else {
      pw.prop('type', 'password');
      $(this).html('visibility');
    }
  });

  $('.pwcVisibility').on('click', function () {
    let pw = $(this).siblings('ul').find('input');
    let pwcInputType = pw.attr('type');

    if (pwcInputType === 'password') {
      pw.prop('type', 'text');
      $(this).html('visibility_off');
    } else {
      pw.prop('type', 'password');
      $(this).html('visibility');
    }
  });
});


//프로필

const modal = document.getElementById('modal');
const closeBtn = document.getElementById('closeBtn');

const profileImgDiv = document.getElementById('profileImgDiv');


profileImgDiv.addEventListener('click', ()=>{
    modal.style.display = 'block';
    body.style.overflow = 'hidden';
})


closeBtn.addEventListener('click', ()=>{
    modal.style.display = 'none';
    body.style.overflow = 'auto';
})

modal.addEventListener('click', e =>{
    const eTarget = e.target
    if(eTarget.classList.contains('modal-overlay')){
        modal.style.display = 'none';
        body.style.overflow = 'auto';
    }
})


const content = document.querySelector('.wrapper');  //content
const carousel = document.querySelector('.carousel');  //line
const carousel2 = document.querySelector('.carousel2');
const carousel3 = document.querySelector('.carousel3');
const carousel4 = document.querySelector('.carousel4');
const carousel5 = document.querySelector('.carousel5');

let isDragStart = false, prevPageX, prevScrollLeft;
let isDragStart2 = false, prevPageX2, prevScrollLeft2;
let isDragStart3 = false, prevPageX3, prevScrollLeft3;
let isDragStart4 = false, prevPageX4, prevScrollLeft4;
let isDragStart5 = false, prevPageX5, prevScrollLeft5;

const dragStart = (e) => {
    isDragStart = true;
    prevPageX = e.pageX;
    prevScrollLeft = carousel.scrollLeft;
}

const dragStart2 = (e) => {
    isDragStart2 = true;
    prevPageX2 = e.pageX;
    prevScrollLeft2 = carousel2.scrollLeft;
}

const dragStart3 = (e) => {
    isDragStart3 = true;
    prevPageX3 = e.pageX;
    prevScrollLeft3 = carousel3.scrollLeft;
}

const dragStart4 = (e) => {
    isDragStart4 = true;
    prevPageX4 = e.pageX;
    prevScrollLeft4 = carousel4.scrollLeft;
}

const dragStart5 = (e) => {
    isDragStart5 = true;
    prevPageX5 = e.pageX;
    prevScrollLeft5 = carousel5.scrollLeft;
}
///============================
const dragging = (e) => {
    if(!isDragStart) return;
    e.preventDefault();
    let positionDiff = e.pageX - prevPageX;
    carousel.scrollLeft = prevScrollLeft - positionDiff;
    console.log(e.pageX);

}

const dragging2 = (e) => {
    if(!isDragStart2) return;
    e.preventDefault();
    let positionDiff2 = e.pageX - prevPageX2;
    carousel2.scrollLeft = prevScrollLeft2 - positionDiff2;
    console.log(e.pageX);

}

const dragging3 = (e) => {
    if(!isDragStart3) return;
    e.preventDefault();
    let positionDiff3 = e.pageX - prevPageX3;
    carousel3.scrollLeft = prevScrollLeft3 - positionDiff3;
    console.log(e.pageX);

}
const dragging4 = (e) => {
    if(!isDragStart4) return;
    e.preventDefault();
    let positionDiff4 = e.pageX - prevPageX4;
    carousel4.scrollLeft = prevScrollLeft4 - positionDiff4;
    console.log(e.pageX);

}

const dragging5 = (e) => {
    if(!isDragStart5) return;
    e.preventDefault();
    let positionDiff5 = e.pageX - prevPageX5;
    carousel5.scrollLeft = prevScrollLeft5 - positionDiff5;
    console.log(e.pageX);
}

//==================================

const dragStop = () => {
    isDragStart = false;
}
const dragStop2 = () => {
    isDragStart2 = false;
}

const dragStop3 = () => {
    isDragStart3 = false;
}

const dragStop4 = () => {
    isDragStart4 = false;
}

const dragStop5 = () => {
    isDragStart5 = false;
}

document.addEventListener('mousedown', dragging);



carousel.addEventListener("mousedown", dragStart);
carousel.addEventListener("mousemove", dragging);
carousel.addEventListener("mouseup", dragStop);

carousel2.addEventListener("mousedown", dragStart2);
carousel2.addEventListener("mousemove", dragging2);
carousel2.addEventListener("mouseup", dragStop2);

carousel3.addEventListener("mousedown", dragStart3);
carousel3.addEventListener("mousemove", dragging3);
carousel3.addEventListener("mouseup", dragStop3);

carousel4.addEventListener("mousedown", dragStart4);
carousel4.addEventListener("mousemove", dragging4);
carousel4.addEventListener("mouseup", dragStop4);

carousel5.addEventListener("mousedown", dragStart5);
carousel5.addEventListener("mousemove", dragging5);
carousel5.addEventListener("mouseup", dragStop5);