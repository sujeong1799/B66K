/* 위지윅 적용 */

	/* 책 소개 */
	/* ClassicEditor
		.create(document.querySelector('#bookIntro_textarea'), {
            ClassicEditor.config.allowedContent : "true"
        })
		.catch(error=>{
			console.error(error);
		}); */
    
    



/* 파일 등록*/
document.getElementById('trigger').addEventListener('click', () => {
    document.getElementById('files').click();
});

const regExp = new RegExp("\.(exe|sh|bat|msi|dll|js)$") // 실행파일 X
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif|bmp)$") // 이미지 파일만 가능
const maxSize = 1024*1024*20;

function fileSizeValidation(fileName, fileSize){ 
    if(!regExpImg.test(fileName)){
        return 0;
    }else if(regExp.test(fileName)){
       return 0;
   }else if(fileSize > maxSize){
       return 0;
   }else{
       return 1;
   }
}

// 첨부 file에 따라서 체크 하여 등록 가능한지 체크
document.addEventListener('change', (e)=>{
    console.log(e.target);
    if(e.target.id == 'files'){ 
        document.getElementById('regBtn').disabled = false;
        const fileObject = document.getElementById('files').files; 
        console.log(fileObject);

        let div = document.getElementById('fileZone');
        div.innerHTML ='';
        let ul = `<ul>`;
        let isOk = 1;
        for(let file of fileObject){
            let vaildResult = fileSizeValidation(file.name, file.size);
            isOk *= vaildResult;
            ul+= `<li>`; 
            ul+= `<div> ${vaildResult ? '업로드 가능 ' : '업로드 불가능 '} ${file.name} <span class="badge rounded-pill text-bg-${vaildResult ? 'primary' : 'danger'}">${file.size}bytes</span></div></li>`;
        }
        ul+= `</ul>`;
        div.innerHTML =ul;
        if(isOk==0){ 
            document.getElementById('regBtn').disabled = true;
        }
    }
})


// 위치 맞추기
function syncSidebarAndRegisterBoxHeights_RegisterContent() {
    const sideBar = document.querySelector('.SideBar');
    const RegisterBox = document.querySelector('.RegisterContent');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, RegisterBox.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    RegisterBox.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndRegisterBoxHeights_RegisterContent);
  window.addEventListener('resize', syncSidebarAndRegisterBoxHeights_RegisterContent);