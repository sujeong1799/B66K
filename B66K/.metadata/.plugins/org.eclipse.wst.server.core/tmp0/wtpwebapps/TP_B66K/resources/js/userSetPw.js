let pw = document.querySelector('#pw');
let pwMsg = document.querySelector('#pwMsg');
let pwc = document.querySelector('#pwc');
let pwcMsg = document.querySelector('#pwcMsg');
let pwflag = false;
let setPwBtn = document.getElementById('setPwBtn');


function pwCheck(){
    
        const pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
    
        if(pw.value === ''){
            if(pwc.value != ''){
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
            }else if((pattern.test(pw.value)) && pw.value !== pwc.value){
                pwflag = false;
                pwcMsg.innerHTML = `비밀번호가 일치하지 않습니다.`;
            }
        }
        setPw();
    }
    
    pw.addEventListener('keyup', pwCheck);
    pwc.addEventListener('keyup', pwCheck);



function setPw(){
    if(pwflag === false){
        setPwBtn.disabled = true;
    }else if(pwflag === true){
        setPwBtn.disabled = false;
        setPwBtn.style.background = '#212529';
        setPwBtn.style.color = 'white';
    }
}

//비밀번호 password ->text

$(document).ready(function () {
    $('.pwVisibility').on('click', function () {
        let pwArea = $(this).prev('input');
        let pwAreaType = pwArea.attr('type');

        if (pwAreaType === 'password') {
            pwArea.prop('type', 'text');
            $(this).html('visibility_off');
        } else {
            pwArea.prop('type', 'password');
            $(this).html('visibility');
        }

    });
});

$(document).ready(function () {
    $('.pwcVisibility').on('click', function () {
        let pwcArea = $(this).prev('input');
        let pwcAreaType = pwcArea.attr('type');

        if (pwcAreaType === 'password') {
            pwcArea.prop('type', 'text');
            $(this).html('visibility_off');
        } else {
            pwcArea.prop('type', 'password');
            $(this).html('visibility');
        }
    });
});

