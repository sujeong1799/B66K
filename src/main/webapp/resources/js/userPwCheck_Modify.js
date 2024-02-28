// const pwInput = document.querySelector('#pw');
// const pwMsg = document.querySelector('#pwMsg');
// const btn = document.querySelector('#btn');

// pwInput.addEventListener('keyup', function(){
    
//     const pwInput1 = document.querySelector('#pw').value;
//     const pwInput2 = document.getElementById("pw");

//     console.log(">>>>>>>>"+pwInput2);
    
//     $.ajax({
//         url:"/member/pwCheck",
//         type : "POST",
//         data : {"pw" : $("#pw").val()},
//         success : function(data){
//         console.log("data : "+data);
            
//         if(data.length <= 0){
//             // pwMsg.innerHTML = `비밀번호를 입력해주세요.`;
//         }else{
//             if(data==="1"){ 
//                 // pwMsg.innerHTML = `비번이맞네요`;
//                 // btn.disabled = false;
//             }else{
//                 // pwMsg.innerHTML = `틀리네용`;
//                 // btn.disabled = true;
                
//             }
//         }
//     }

//     });
// });
// const body = document.querySelector('body');

// btn.addEventListener('click',()=>{
//     if(data ==="1"){
//         window.location.href = '/member/edit';
//     }else{
//         let popup = document.getElementById('loginPopup');
//         popup.style.display = "block";
//         body.style.overflow = 'hidden';

//     }
// })


// btn.addEventListener('click', function(){
    
//     const pwInput1 = document.querySelector('#pw').value;
//     const pwInput2 = document.getElementById("pw");
    
//     console.log(">>>>>>>>"+pwInput2);
    
//     $.ajax({
//         url:"/member/pwCheck",
//         type : "POST",
//         data : {"pw" : $("#pw").val()},
//         success : function(data){
//             console.log("data : "+data);
            
//             if(data==="1"){ 

//             }else if(data==="0"){
//                 let popup = document.getElementById('popup');
//                 popup.style.display = "block";
//                 body.style.overflow = 'hidden';
//             }
//         },
//         error : function(data){
//     let popup = document.getElementById('popup');
//         popup.style.display = "block";
//         body.style.overflow = 'hidden';
//     }
    
    
// });
// });


// function closePopup() {
//     let popup = document.getElementById('loginPopup');
//     popup.style.display = "none";
//     body.style.overflow = 'auto';
// }

// document.querySelector(".closeBtn").addEventListener("click", closePopup);


const btn = document.getElementById("btn");
const pwInput = document.getElementById("pw");
const popup = document.getElementById("popup");
const body = document.querySelector("body");

btn.addEventListener("click", function () {
    const pwValue = pwInput.value;

    $.ajax({
    url: "/member/pwCheck",
    type: "POST",
    data: { "pw": pwValue },
    success: function (data) {
    if (data === "1") {
        window.location.href = "/member/edit";
    } else if (data === "0") {
        popup.style.display = "block";
        body.style.overflow = "hidden";
    }
    },
    error: function (data) {
    popup.style.display = "block";
    body.style.overflow = "hidden";
    }
    });
});

function closePopup() {
    popup.style.display = "none";
    body.style.overflow = "auto";
}



popup.addEventListener('click', e =>{
    const eTarget = e.target
    if(eTarget.classList.contains('popup')){
        popup.style.display = 'none';
        body.style.overflow = 'auto';
    }
})


document.querySelector(".closeBtn").addEventListener("click", closePopup);