let AuthNumBtn = document.getElementById('AuthNumBtn');
let email = document.querySelector('#email');

const body = document.querySelector("body");
const searchPwPopup = document.getElementById("searchPwPopup");

let modalMessage = document.getElementById('modalMessage');

function setMessage(text){
    modalMessage.innerText =  text;
}

function closePopup() {
    searchPwPopup.style.display = "none";
    body.style.overflow = "auto";
}

searchPwPopup.addEventListener('click', e =>{
        const eTarget = e.target
        if(eTarget.classList.contains('searchPwPopup')){
            searchPwPopup.style.display = 'none';
            body.style.overflow = 'auto';
}
    })

document.querySelector(".searchPwCloseBtn").addEventListener("click", closePopup);

AuthNumBtn.addEventListener('click', function(){

    $.ajax({
        url : "/member/searchPw",
        type : "POST",
        dataType : "JSON",
        data : {"email" : $("#email").val()},
        success : function(data){
            if(data === 1){
                console.log("이메일 존재? "+data);
                searchPwPopup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('입력한 이메일로 인증번호를 전송했습니다.');
                //이메일 보내는 메서드..
                sendPwEmail();
            }else if(data === 0){
                console.log("이메일 존재?"+data);
                searchPwPopup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('입력한 정보와 일치하는 회원이 없습니다.');
            }else{
                searchPwPopup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('이메일을 전송할 수 없습니다. 고객센터에 문의해주세요.');
            }
        },
        error : function(request, status, error){
            alert("error발생! >>> "+requestAnimationFrame.status+"\n"+"message"+request.responseText+"\n"+"error"+error)
        }
    });
});

//이메일을 보내는 function
let emailCheckNum = document.getElementById('emailCheckNum'); //유저가 입력한 인증번호
let SearchPwBtn = document.getElementById('SearchPwBtn');

function sendPwEmail(){
    console.log("인증메일 발송했습니다~");

    //인증번호 입력창, 인증번호 입력 버튼 보이게 바꾸기
    emailCheckNum.style.display = "inline-block";
    SearchPwBtn.style.display = "inline-block";
    //인증번호 받기 버튼 숨기기
    AuthNumBtn.style.display = "none";

    let emailInput = document.querySelector('#email').value;

    console.log("이메일 주소 :"+emailInput);

    const userEmail = {
        email : emailInput
    }

    const url = "/member/searchPwMail";
    fetch(url, {
        method : "POST",
        body : JSON.stringify(userEmail),
        headers : {
            "Content-Type" : "application/json"
        }
    })

    .then((response)=>response.json())
    .then((json)=>{

        if(json !== null){
            authNum3 = json;
            console.log("비밀번호 찾기 인증번호 : "+authNum3);
        }else{
            searchPwPopup.style.display = "block";
            body.style.overflow = "hidden";
            setMessage('이메일을 전송할 수 없습니다. 고객센터에 문의해주세요.');
        }
    });

}

///인증번호 입력 후 확인버튼을 누르는 경우
SearchPwBtn.addEventListener('click', function(){

    let emailCheckNum2 = document.querySelector('#emailCheckNum').value;
    let email2 = document.getElementById('email').value;
    if(emailCheckNum2 != authNum3){
        searchPwPopup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('인증번호가 다릅니다.');
        console.log("인증번호 :"+authNum3+" || 유저가 입력한 번호 :"+emailCheckNum2);
    }else if(emailCheckNum2 == authNum3){
        // searchPwPopup.style.display = "block";
        // body.style.overflow = "hidden";
        // setMessage('인증이 완료되었습니다.');
        window.location.href = '/member/findPw?email='+encodeURIComponent(email2);
    }
})