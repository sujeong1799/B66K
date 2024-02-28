// 사이드바 디테일박스 크기 맞추기
function syncSidebarAndorderListBoxHeights_orderDetailContent() {
    const sideBar = document.querySelector('.SideBar');
    const orderListBox = document.querySelector('.orderDetailContent');
  
    // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
    const maxHeight = Math.max(sideBar.offsetHeight, orderListBox.offsetHeight);
    sideBar.style.height = maxHeight + 50 + 'px';
    orderListBox.style.height = maxHeight + 'px';
  }
  
  window.addEventListener('load', syncSidebarAndorderListBoxHeights_orderDetailContent);
  window.addEventListener('resize', syncSidebarAndorderListBoxHeights_orderDetailContent);
