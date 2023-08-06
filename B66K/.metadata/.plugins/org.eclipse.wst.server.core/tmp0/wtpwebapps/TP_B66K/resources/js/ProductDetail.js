// 지역변경
let addressInput = document.getElementById('deliveryAddress');
let delivery = document.getElementById('delivery');
let postBtn = document.querySelector('.PostBtn');

function updateDelivery() {
  let local = addressInput.innerText;
  let city = local.substring(0, 2);

  if (city === '서울' || city === '인천' || city === '경기') {
    delivery.innerText = '지금 주문 시 내일 도착';
  } else {
    let now = new Date();
    const month = now.getMonth() + 1;
    const day = now.getDate() + 2;
    delivery.innerText = `지금 주문 시 ${month}.${day}일 도착`;
  }
}

// 슬라이드 구현

const carousel = document.querySelector(".carousel");
firstImg = carousel.querySelectorAll("img")[0];
arrowIcons = document.querySelectorAll(".slide_wrapper i");

let firstImgWidth = (firstImg.clientWidth * 4) + 48;

arrowIcons.forEach(icon => {
  icon.addEventListener("click", () => {
    carousel.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
  })
})
