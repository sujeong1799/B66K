function syncSidebarAndlistBoxHeights_listContent() {
  const sideBar = document.querySelector('.SideBar');
  const listBox = document.querySelector('.listContent');

  // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
  const maxHeight = Math.max(sideBar.offsetHeight, listBox.offsetHeight);
  sideBar.style.height = maxHeight + 50 + 'px';
  listBox.style.height = maxHeight + 'px';
}

window.addEventListener('load', syncSidebarAndlistBoxHeights_listContent);
window.addEventListener('resize', syncSidebarAndlistBoxHeights_listContent);