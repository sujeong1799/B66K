let idflag;
let pwflag;
let pwcflag;
let emailflag;
let emailcflag;
let nicknameflag;
let birthflag;

let signBtn = document.getElementById('signBtn');

function checkValidity(){

    if(birthYearFlag == true && birthMonthFlag == true && birthDayFlag == true){
        birthflag = true;
        console.log('birth 최중 flag ===>>'+birthflag);
        birthMsg.innerHTML = ``;
    }else{
        birthflag = false;
    }

    if(idflag == true && pwflag == true && pwcflag == true && emailflag == true && emailcflag == true && nicknameflag == true
        && birthflag == true){
        signBtn.disabled = false;

        signBtn.style.backgroundColor = "#000000";
        signBtn.style.color = "white";
        signBtn.style.cursor = "pointer";
        
    }else{
        signBtn.disabled = true;

        signBtn.style.cursor = "default";
        signBtn.style.backgroundColor = "#9F9F9F";
        //signBtn.style.color = '';

    }
}

signBtn.addEventListener('click', combineBirth);



signBtn.addEventListener("mouseover", function () {
  if (!signBtn.disabled) {
    signBtn.style.backgroundColor = "#faa307";
    
  }
});

signBtn.addEventListener("mouseout", function () {
  if (!signBtn.disabled) {
    signBtn.style.backgroundColor = "#212529";
    
  }
});


//아이디 중복, 정규식 확인

const id = document.querySelector('#id');
const idMsg = document.querySelector('#idMsg');

id.addEventListener('keyup', function(){
    
    const pattern = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{5,15}$/;
    // 영어 숫자 조합 5~15자리 영문자 최소 한개 포함되어야함

    $.ajax({
        url : "/member/idCheck",
        type : "POST",
        dataType : "JSON",
        data : {"id" : $("#id").val()},
        success : function(data) {

            if(id.value === ''){
                idMsg.innerHTML = `입력한 내용이 없습니다.`;
                idMsg.style.color = 'rgb(86, 83, 83)';
                idflag = false;
            }else {
                if(data == 1){
                    idMsg.innerHTML = `이미 존재하는 아이디입니다.`;
                    idMsg.style.color = 'rgb(86, 83, 83)';
                    idflag = false;

                }else if(!pattern.test(id.value)){
                idMsg.innerHTML = `영문, 숫자로 조합된 5~15자리여야 합니다.`;
                idMsg.style.color = 'rgb(86, 83, 83)';
                idflag = false;

            }else if(data == 0 && pattern.test(id.value)){
                idMsg.innerHTML = ``;
                idflag = true;
                console.log("id flag : "+idflag);
            } 
        }
        checkValidity();
        }
    });
});

//비밀번호 정규식

const pw = document.querySelector('#pw');
const pwMsg = document.querySelector('#pwMsg');
const pwCheck = document.querySelector('#pwCheck');
const pwCheckMsg = document.querySelector('#pwCheckMsg');


function pwCheckFunction(event){

    const pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
    //영문, 숫자, 특수문자 8-20자리 조합

    if(pw.value === ''){
        pwMsg.innerHTML = `입력한 내용이 없습니다.`;
        pwMsg.style.color = 'rgb(86, 83, 83)';;
        pwflag = false;
    }else{
        if(!pattern.test(pw.value)){
            pwMsg.innerHTML = `영문, 숫자, 특수문자로 조합된 8~20자리여야 합니다.`;
            pwMsg.style.color = 'rgb(86, 83, 83)';;
            pwflag = false;
    }else{
            pwMsg.innerHTML = ``;
            pwflag = true;
            console.log("pw flag : "+pwflag);
        }
    }
    //checkValidity();

        if(pwflag==true && pwCheck.value === ''){
            pwCheckMsg.innerHTML = `비밀번호를 재입력해주세요.`;
            pwCheckMsg.style.color = `rgb(86, 83, 83)`;
            pwcflag = false;
        }else{
            if(pwflag==true && pw.value !== pwCheck.value){
            pwCheckMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
            pwCheckMsg.style.color = 'rgb(86, 83, 83)';
            pwcflag = false;
            }else if(pwflag==true && pw.value === pwCheck.value){
            pwCheckMsg.innerHTML = ``;
            pwCheckMsg.style.color = 'rgb(86, 83, 83)';
            pwcflag = true;
            console.log("pw check flag : "+pwcflag);
            // }else if(pwflag==false && pw.value !== pwCheck.value){
            //     pwCheckMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
            //     pwCheckMsg.style.color = 'rgb(86, 83, 83)';
            //     pwcflag = false;
            //     //console.log("비밀번호 유효성검사 실패했을때>> pwflag : "+pwflag+" || pwcflag : "+pwflag);
            }else if(pw.value === '' && pw.value !== pwCheck.value){
                pwCheckMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
                pwCheckMsg.style.color = 'rgb(86, 83, 83)';
                pwcflag = false;
            }else if(pw.value !=='' && pw.value !== pwCheck.value){
                //pwCheckMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
                pwCheckMsg.style.color = 'rgb(86, 83, 83)';
                pwcflag = false;
            }

        }checkValidity();
}
        

pw.addEventListener('keyup', pwCheckFunction);
pwCheck.addEventListener('keyup', pwCheckFunction);

$(document).ready(function () {
    $('.pwVisibility').on('click', function () {
        let pwInput = $(this).prev('input');
        let pwInputType = pwInput.attr('type');

        if (pwInputType === 'password') {
            pwInput.prop('type', 'text');
            $(this).html('visibility_off');
        } else {
            pwInput.prop('type', 'password');
            $(this).html('visibility');
        }

    });
});

$(document).ready(function () {
    $('.pwcVisibility').on('click', function () {
        let pwcInput = $(this).prev('input');
        let pwcInputType = pwcInput.attr('type');

        if (pwcInputType === 'password') {
            pwcInput.prop('type', 'text');
            $(this).html('visibility_off');
        } else {
            pwcInput.prop('type', 'password');
            $(this).html('visibility');
        }
    });
});


//닉네임 중복 /정규식

const nickname = document.querySelector('#nickname');
const nicknameMsg = document.querySelector('#nicknameMsg');

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
                nicknameMsg.innerHTML = `입력한 내용이 없습니다.`;
                nicknameMsg.style.color= 'rgb(86, 83, 83)';
                nicknameflag = false;
            }else {
                if(data == 1){
                    nicknameMsg.innerHTML = `이미 존재하는 닉네임입니다.`;
                    nicknameMsg.style.color = 'rgb(86, 83, 83)';
                    nicknameflag = false;

                }else if(!pattern.test(nickname.value)){
                    nicknameMsg.innerHTML = `닉네임은 한글,영문,숫자를 이용한 2~20글자만 사용 가능합니다`;
                    nicknameMsg.style.color = 'rgb(86, 83, 83)';
                    nicknameflag = false;
                }else if(data == 0 && pattern.test(nickname.value)){
                    nicknameMsg.innerHTML = ``;
                    nicknameMsg.style.color = 'rgb(86, 83, 83)';
                    nicknameflag = true;
                    console.log("nickname flag : "+nicknameflag);
                }

            }checkValidity();
        }
    });//비동기 끝,,


});//nickname keyup function 끝..

//이메일 정규식 , 중복..

const emailInput = document.querySelector('#email');
const emailMsg = document.querySelector('#emailMsg');
const emailCheck = document.querySelector('#emailCheckBtn');

emailInput.addEventListener('keyup', function(){
    
    const pattern = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;

    $.ajax({
        url : "/member/emailCheck",
        type : "POST",
        dataType : "JSON",
        data : {"email" : $("#email").val()},
        success : function(data) {
            
            if(emailInput.value ===''){
                emailMsg.innerHTML = `입력한 내용이 없습니다.`;
                emailMsg.style.color = 'rgb(86, 83, 83)';
                emailflag = false;
                emailCheck.disabled = true;

                emailCheck.style.cursor = "default";
                emailCheck.style.backgroundColor = "#BCBCBC";

                //document.querySelector('#emailCheckBtn').setAttribute('disabled', 'disabled');
            }else{
                if(data == 1){
                    emailMsg.innerHTML = `이미 존재하는 이메일입니다.`;
                    emailMsg.style.color = 'rgb(86, 83, 83)';
                    emailflag = false;
                    emailCheck.disabled = true;

                    emailCheck.style.cursor = "default";
                    emailCheck.style.backgroundColor = "#BCBCBC";

                }else if(!pattern.test(emailInput.value)){
                    emailMsg.innerHTML = `이메일 형식이 올바르지 않습니다.`;
                    emailMsg.style.color = 'rgb(86, 83, 83)';
                    emailflag = false;
                    emailCheck.disabled = true;

                    emailCheck.style.cursor = "default";
                    emailCheck.style.backgroundColor = "#BCBCBC";

                }else if(data == 0 && pattern.test(emailInput.value)){
                    emailMsg.innerHTML = ``;
                    emailMsg.style.color = 'rgb(86, 83, 83)';
                    emailflag = true;
                    console.log("email flag : "+emailflag);
                    emailCheck.disabled = false;

					emailCheck.style.backgroundColor = "#212529";
					emailCheck.style.color = "white";
                    emailCheck.style.cursor = "pointer";
                    
                    emailCheck.addEventListener("mouseover", function() {
   					emailCheck.style.backgroundColor = "#faa307";
					});

					emailCheck.addEventListener("mouseout", function() {
    				emailCheck.style.backgroundColor = "#212529";
					});
				
                }
            }checkValidity();
        }
    });
});


//이메일 인증
const body = document.querySelector('body');

emailCheck.addEventListener("click", ()=>{

	console.log("인증번호버튼 눌림");

    const emailInput2 = document.querySelector('#email').value;
    
    const userEmail = {
        email : emailInput2
    }
    
    const url = "/member/mailAuthentication";
    fetch(url,{
        method : "POST",
        body : JSON.stringify(userEmail),
        headers : {
            "Content-Type" : "application/json"
        }
        
    })
    
    .then((response)=>response.json())
    .then((json) => {

        if(json !== null){
            // alert("인증메일이 전송되었습니다.");
            emailPopup.style.display = "block";
            body.style.overflow = "hidden";

            authNum = json;
            console.log("인증번호>>>"+authNum);
            document.querySelector('#AuthNumInput').removeAttribute('disabled');
            
        }else{
            alert("인증메일 전송에 실패했습니다.");
        }
    });

});

function closePopup() {
    emailPopup.style.display = "none";
    body.style.overflow = "auto";
}

document.querySelector(".emailCloseBtn").addEventListener("click", closePopup);



function checkAuthNum(){
    
    const AuthNumInput = document.querySelector('#AuthNumInput').value;
    const emailCheckMsg = document.querySelector('#emailCheckMsg');
    const AuthNumInputArea = document.querySelector('#AuthNumInput');

    if(AuthNumInput != authNum ){
        emailCheckMsg.innerHTML = `인증번호가 다릅니다.`;
        emailCheckMsg.style.color = 'rgb(86, 83, 83)';
        emailcflag = false;

    }else{
        emailCheckMsg.innerHTML = `인증 완료되었습니다.`;
        emailCheckMsg.style.color = 'rgb(86, 83, 83)';
        emailcflag = true;
        
        emailCheck.disabled = true;
        //emailCheck.setAttribute('disabled', 'disabled');
        emailInput.readOnly = true;
        AuthNumInputArea.disabled = true;

        //document.querySelector('#emailCheckBtn').setAttribute('disabled', 'disabled');
        console.log(emailcflag); 

    }

    checkValidity();
}


//프로필

const profileBtn = document.getElementById('profileModalBtn');
const modal = document.getElementById('modal');
const closeBtn = document.getElementById('closeBtn');

const profileImgDiv = document.getElementById('profileImgDiv');

// profileBtn.addEventListener('click', ()=>{
//     modal.style.display = 'block';
//     body.style.overflow = 'hidden';
// })
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

// for(let i=0; i<5; i++){
//     const imgBox = document.createElement('div');
//     imgBox.classList.add('imgBox');

//     carousel.appendChild(imgBox);

// }

// for(let i=0; i<5; i++){
//     const imgBox2 = document.createElement('div');
//     imgBox2.classList.add('imgBox2');

//     carousel2.appendChild(imgBox2);
// }

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

//생일부분

let birthMsg = document.querySelector('#birthMsg');
let birthYear = document.getElementById('birthYear');
let birthMonth = document.getElementById('birthMonth');
let birthDay = document.getElementById('birthDay');


// let yearValue = parseInt(birthYear.value);  //정수로 변환해서 범위 지정해야함...ㅋ
let birthYearFlag = false;
let birthMonthFlag = false;
let birthDayFlag = false;

//year 범위
function birthYearValidation(){


    if (birthYear.value === "") {
        console.log('year : 빈값 yearflag ==>>'+birthYearFlag);
        birthYearFlag = false;
        birthMsg.innerHTML = `년도를 입력해주세요.`;
        birthMsg.style.color = 'rgb(86, 83, 83)';
    } else if (birthYear.value.length < 4) {
        console.log('year : 4자리 안댐 yearflag ==>>'+birthYearFlag);
        birthYearFlag = false;
        birthMsg.innerHTML = `년도를 입력해주세요.`;
        birthMsg.style.color = 'rgb(86, 83, 83)';
    } else {
        let yearValue = parseInt(birthYear.value);
        if (yearValue >= 1950 && yearValue <= 2023) {
            birthYearFlag = true;
            console.log('year : 범위ㄱㅊㄱㅊ  yearflag ==>'+birthYearFlag);
            birthMsg.innerHTML = ``;
            birthMsg.style.color = 'rgb(86, 83, 83)';
        } else {
            console.log('year 안댐!!!!! yearflag ==>'+birthYearFlag);
            birthYearFlag = false;
            birthMsg.innerHTML = `년도를 알맞게 입력해주세요.`;
            birthMsg.style.color = 'rgb(86, 83, 83)';
        }
    }
    checkValidity();

}

function birthMonthValidation(){

    if (birthMonth.value === "") {
        console.log('month : 빈값 monthflag ==>>'+birthMonthFlag);
        birthMonthFlag = false;
        birthMsg.innerHTML = `월을 입력해주세요.`;
        birthMsg.style.color = 'rgb(86, 83, 83)';
    }else {
        let monthValue = parseInt(birthMonth.value);
        if (monthValue >= 1 && monthValue <= 12) {
            birthMonthFlag = true;
            console.log('month : 범위ㄱㅊㄱㅊ  monthflag ==>'+birthMonthFlag);
            birthMsg.innerHTML = ``;
            birthMsg.style.color = 'rgb(86, 83, 83)';
        } else {
            console.log('month 안댐!!!!! monthflag ==>'+birthMonthFlag);
            birthMonthFlag = false;
            birthMsg.innerHTML = `월을 알맞게 입력해주세요.`;
            birthMsg.style.color = 'rgb(86, 83, 83)';
        }
    }
    checkValidity();
}

function birthDayValidation(){

    if (birthDay.value === "") {
        console.log('day : 빈값 dayflag ==>>'+birthDayFlag);
        birthDayFlag = false;
        birthMsg.innerHTML = `일을 입력해주세요.`;
        birthMsg.style.color = 'rgb(86, 83, 83)';
    }else {
        let dayValue = parseInt(birthDay.value);
        if (dayValue >= 1 && dayValue <= 31) {
            birthDayFlag = true;
            console.log('day : 범위ㄱㅊㄱㅊ  dayflag ==>'+birthDayFlag);
            birthMsg.innerHTML = ``;
            birthMsg.style.color = 'rgb(86, 83, 83)';
        } else {
            console.log('day 안댐!!!!! dayflag ==>'+birthDayFlag);
            birthDayFlag = false;
            birthMsg.innerHTML = `일을 알맞게 입력해주세요.`;
            birthMsg.style.color = 'rgb(86, 83, 83)';
        }
    }
    checkValidity();
}

birthYear.addEventListener('keyup', birthYearValidation);
birthMonth.addEventListener('keyup', birthMonthValidation);
birthDay.addEventListener('keyup', birthDayValidation);

function combineBirth(){
    let birthYear = document.getElementById('birthYear').value;
    let birthMonth = document.getElementById('birthMonth').value;
    let birthDay = document.getElementById('birthDay').value;

    if(birthMonth.length === 1){
        birthMonth = '0'+birthMonth;
    }

    if(birthDay.length === 1){
        birthDay = '0'+birthDay;
    }

    let birth = `${birthYear}-${birthMonth}-${birthDay}`;

    document.getElementById('birth').value = birth;

    document.getElementById('joinForm').submit();
}
