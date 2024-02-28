document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
})

// 정규표현식을 사용하여 생성자 함수를 만들기
// 실행파일 막기, 이미지파일인지 아닌지 체크
// fileUpload시 형식제한 함수


const regExp = new RegExp("\.(exe|sh|bat|msi|dll|js)$") // 실행파일 막기
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|bmp)$") // 이미지파일 넣을 수 있는 애들
const maxSize = 1024*1024*20; // 20M 보다 큰지 확인

function fileSizeValidation(fileName, fileSize){ // 첨부 가능한 파일인지 체크
    if(regExp.test(fileName)){ //실행파일임
        return 0;
    }else if(fileSize > maxSize){
        return 0;
    // }else if(!regExpImg.test(fileName)){ // 이미지 파일인지 아닌지 확인할때  이미지가 아니면 첨부안할거임.
    //     return 0;
    }else{
        return 1;
    }
}

// 첨부 file에 따라서 체크 하여 등록 가능한지 체크
document.addEventListener('change', (e)=>{
    console.log(e.target);
    if(e.target.id == 'files'){ 
        document.getElementById('regBtn').disabled = false;
        const fileObject = document.getElementById('files').files; // 여러개가 들어오면 배열로 들어온다.
        console.log(fileObject);

        let div = document.getElementById('fileZone');
        div.innerHTML ='';
        let ul = `<ul>`;
        let isOk = 1; // fileSizeValidation의 통과 여부를 체크 
        for(let file of fileObject){  // 배열로 들어올거야.
            let vaildResult = fileSizeValidation(file.name, file.size); // 파일의 결과를 vaildResult에 체크
            isOk *= vaildResult; // 모든 첨부파일의 결과가 1이면 통과고 0이면 0으로 바뀌겠찌.
            ul+= `<li>`; 
            // 업로드 가능 표시 // 통과가 됐다면 1=true, 0=false
            // 업로드 가능이면 파란색 업로드 불가능이면 빨간색으로 주고싶을때는 div를 별도로 넣어야한다.
            ul+= `<div> ${vaildResult ? '업로드 가능' : '업로드 불가능'}</div>`;
            ul+= `${file.name}`;
            // 클래스 안에서 색을 넣을때......?
            ul+= `<span class="badge bg-${vaildResult ? 'success' : 'danger'} rounded-pill">${file.size}Bytes</span></li>`;
        }
        ul+= `</ul>`;
        div.innerHTML =ul;
        if(isOk==0){ //첨부불가 파일이 있다라는 의미 
            document.getElementById('regBtn').disabled = false;
        }
    }
})

// 사이드바 디테일박스 크기 맞추기
function syncSidebarAndprofileBoxHeights_profileContent() {
    const sideBar = document.querySelector('.SideBar');
    const profileBox = document.querySelector('.profileContent');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, profileBox.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    profileBox.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndprofileBoxHeights_profileContent);
  window.addEventListener('resize', syncSidebarAndprofileBoxHeights_profileContent);