function syncSidebarAndDetailBoxHeights() {
  const sideBar = document.querySelector('.SideBar');
  const detailBox = document.querySelector('.detailBox');

  // 사이드바와 디테일 박스 중 더 큰 높이를 계산하여 두 요소의 높이를 동일하게 설정
  const maxHeight = Math.max(sideBar.offsetHeight, detailBox.offsetHeight);
  sideBar.style.height = maxHeight + 50 + 'px';
  detailBox.style.height = maxHeight + 'px';
}

// 페이지 로드시 실행 (두 JSP 파일이 로드된 후 높이 동기화 수행)
window.addEventListener('load', syncSidebarAndDetailBoxHeights);

// 창 크기 변경시 실행 (창 크기가 변경될 때도 높이 동기화 수행)
window.addEventListener('resize', syncSidebarAndDetailBoxHeights);