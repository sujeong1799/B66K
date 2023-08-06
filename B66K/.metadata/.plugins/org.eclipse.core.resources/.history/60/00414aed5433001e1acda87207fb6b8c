// 위치 맞추기
function syncSidebarAndadminBoxHeights_adminContent() {
    const sideBar = document.querySelector('.SideBar');
    const adminBox = document.querySelector('.adminContent');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, adminBox.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    adminBox.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndadminBoxHeights_adminContent);
  window.addEventListener('resize', syncSidebarAndadminBoxHeights_adminContent);