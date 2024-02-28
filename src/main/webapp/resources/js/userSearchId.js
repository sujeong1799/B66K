let SearchBtn = document.getElementById('SearchBtn');
let email = document.querySelector('#email');
let emailMsg = document.querySelector('#emailMsg');


const body = document.querySelector("body");
const searchIdPopup = document.getElementById("searchIdPopup");

let modalMessage = document.getElementById('modalMessage');

function setMessage(text){
    modalMessage.innerText =  text;
}

function closePopup() {
    searchIdPopup.style.display = "none";
    body.style.overflow = "auto";
}

searchIdPopup.addEventListener('click', e =>{
        const eTarget = e.target
        if(eTarget.classList.contains('searchIdPopup')){
            searchIdPopup.style.display = 'none';
            body.style.overflow = 'auto';
}
    })

document.querySelector(".searchIdCloseBtn").addEventListener("click", closePopup);


SearchBtn.addEventListener('click', function(){
    
    const pattern = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
    
    
    $.ajax({
        url : "/member/searchId",
        type : "POST",
        dataType : "JSON",
        data : {"email" : $("#email").val()},
        success : function(data){
            
            if(email.value === ''){
                searchIdPopup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('이메일을 입력해주세요.');
                
            }else if(!pattern.test(email.value)){
                searchIdPopup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('올바른 이메일을 입력해주세요.');
                
            }else if(pattern.test(email.value)){
                
                if(data===1){
                    console.log("이메일 존재여부 : "+data);
                    searchIdPopup.style.display = "block";
                    body.style.overflow = "hidden";
                    setMessage('입력한 이메일로 인증번호를 전송했습니다.');
                    sendEmail();
                    //emailflag = true;
                }else if(data === 0){
                    console.log("이메일 존재여부 : "+data);
                    searchIdPopup.style.display = "block";
                    body.style.overflow = "hidden";
                    setMessage('입력한 정보와 일치하는 회원이 없습니다.');
                }else{
                    console.log("이것도 아니고 저것도 아니야 그럼 data 값이 몬데 : "+data);
                    searchIdPopup.style.display = "block";
                    body.style.overflow = "hidden";
                    setMessage('이메일을 전송할 수 없습니다. 고객센터에 문의해주세요.');
                }
            }
            
        },
        error : function(request, status, error){
            alert("error발생! "+requestAnimationFrame.status+"\n"+"message"+request.responseText+"\n"+"error"+error);
        }
    });
});

//if emailflag= true면 이메일을 보내는형식..

let emailCheckNum = document.getElementById('emailCheckNum');

let SearchIDBtn = document.getElementById('SearchIDBtn');

function sendEmail(){
    
    console.log("인증메일 발송했음");
    
    //인증번호를 입력하는 창,인증번호 입력 버튼 보이게
    emailCheckNum.style.display = "inline-block";
    SearchIDBtn.style.display = "inline-block";
    
    //인증번호 받기 버튼은 안보이게
    SearchBtn.style.display = "none";
    
    const emailInput = document.querySelector('#email').value;
    
    console.log("이메일주소 :"+emailInput);
    
    const userEmail = {
        email : emailInput
    }
    
    const url = "/member/searchIdMail";
    fetch(url,{
        method : "POST",
        body : JSON.stringify(userEmail),
        headers : {
            "Content-Type" : "application/json"
        }
    })
    
    .then((response)=>response.json())
    .then((json)=>{
        
        if(json !== null){
            //alert("입력한 이메일로 인증번호를 발송했습니다.");
            authNum2 = json;
            console.log("아이디찾기 인증번호 : "+authNum2);
            
        }else{
            searchIdPopup.style.display = "block";
            body.style.overflow = "hidden";
            setMessage('인증메일 전송에 실패했습니다. 고객센터로 문의해 주세요.');
        }
    });
    
    
}

SearchIDBtn.addEventListener('click', function(){
    
    let email = document.querySelector('#email').value;
    const emailCheckNum2 = document.querySelector('#emailCheckNum').value;
    if(emailCheckNum2 != authNum2){
        searchIdPopup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('인증번호가 다릅니다.');
        console.log("입력할때 인증번호 >>"+authNum2+" || 내가 입력한 번호 >>"+emailCheckNum2)
    }else if(emailCheckNum2 == authNum2){
        searchIdPopup.style.display = "block";
        body.style.overflow = "hidden";
        setMessage('인증이 완료되었습니다.');
        window.location.href = '/member/findID?email='+encodeURIComponent(email);
    }
});
