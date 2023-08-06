async function deleteBookImgToServer(uuid){
    try{
        const url = '/book/file/'+uuid;
        const config ={
            method: 'delete'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    }catch(err){
        console.log(err);
    }

}

document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('file-x')){
        let uuid = e.target.dataset.uuid;
        console.log(uuid);
        // 비동기로 데이터 삭제
        deleteBookImgToServer(uuid).then(result =>{
            console.log(result);
            alert('파일 삭제'+(parseInt(result) >0 ? '성공' : '실패'));
            if(result > 0){
                e.target.closest('li').remove();
            }
        })
    }
})

// 사이드바 디테일박스 크기 맞추기
function syncSidebarAndmodifyBoxHeights_ModifyContent() {
    const sideBar = document.querySelector('.SideBar');
    const modifyBox = document.querySelector('.ModifyContent');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, modifyBox.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    modifyBox.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndmodifyBoxHeights_ModifyContent);
  window.addEventListener('resize', syncSidebarAndmodifyBoxHeights_ModifyContent);