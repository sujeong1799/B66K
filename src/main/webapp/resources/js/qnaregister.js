document.getElementById('trigger').addEventListener('click',()=>{
   document.getElementById('files').click();
})


const regExp = new RegExp("\.(exe|sh|bat|msi|dll|js)$"); //실행파일 막기
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|bmp)$"); //이미지 파일
const maxSize = 1024*1024*20; 

function fileSizeValidation(fileName, fileSize){
   if(regExp.test(fileName)){ //실행파일
       return 0;
   }else if(fileSize > maxSize){
       return 0;
   } else{
       return 1;
   }
}

// 첨부 file에 따라서 체크 하여 등록 가능한지 확인

document.addEventListener('change',(e)=>{

   console.log(e.target);
   if(e.target.id=='files'){
   
       document.getElementById('regBtn').disabled = false;
       const fileObject = document.getElementById('files').files;
       console.log(fileObject);

       let div = document.getElementById('fileZone');
       div.innerHTML='';
       let ul =`<ul>`;

       let isOk = 1; 
       for(let file of fileObject){
           let vaildResult = fileSizeValidation(file.name, file.size);
           isOk *= vaildResult; //모든 첨부파일의 결과가 1이여야 통과
           ul+=`<li>`;
           // ul+=`${file.name} `
           ul+=`${vaildResult ? '<div class="imgOk">' : '<div class="imgNo">'}</div>`
           ul+=`<span class="badge text-bg-${vaildResult ? 'primary' : 'danger'}"></span></li>`; //${file.size}Bytes
       }

       ul+=`</ul>`
       div.innerHTML =ul;


       if(isOk == 0){
           document.getElementById('regBtn').disabled = true;
       }
       
       

   }
})








// title, content에 내용이 없으면 버튼 비활성화

function checkFormValidity() {
    const content = document.getElementById('exampleFormControlTextarea1').value;
    const title = document.getElementById('floatingInput').value;
    const regBtn = document.getElementById('regBtn');

    if (content.trim() !== '' && title.trim() !== '') {
        regBtn.disabled = false;
    } else {
        regBtn.disabled = true;
    }
}



function handleTitleInput() {
    const title = document.getElementById('floatingInput').value;
    const regBtn = document.getElementById('regBtn');

    if (title.trim() === '') {
        regBtn.disabled = true;
    }
}


//썸네일불러오기
function setThumbnail(event) {
    const fileZone = document.getElementById('fileZone');
    fileZone.innerHTML = "";

    for (let i = 0; i < event.target.files.length; i++) {
        const reader = new FileReader();
        reader.onload = function(event) {
            const img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.style.width = "60px";
            img.style.height = "60px";
            fileZone.appendChild(img);
            checkFormValidity();
        };
        reader.readAsDataURL(event.target.files[i]);
    }
}





  const SubmitBtn = document.getElementById('regBtn');
  SubmitBtn.addEventListener('click', function() {
    alert('등록되었습니다.');
  });



  // 사이드바, 컨텐츠 높이 동일하게 설정하기

  function syncSidebarAndrgsBoxHeights_rgsalldiv() {
    const sideBar = document.querySelector('.SideBar');
    const rgsBox = document.querySelector('.rgsalldiv');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, rgsBox.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    rgsBox.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndrgsBoxHeights_rgsalldiv);
  window.addEventListener('resize', syncSidebarAndrgsBoxHeights_rgsalldiv);