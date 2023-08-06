<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/order.css">
</head>
<body>
   <jsp:include page="../layout/header.jsp"></jsp:include>


<div class="all" align="center">

   <div class="wrapper">
   <c:set var = "total" value = "0" />
   
   
   <div class="tbDiv" >
   <div align="left" id="h3"><h3>주문 정보</h3></div>
      <table class="table">
         <thead>
            <tr align="center">
               <th scope="col"></th>
               <th scope="col">상품명</th>
               <th scope="col">작가</th>
               <th scope="col">가격</th>
               <th scope="col">수량</th>
            </tr>
         </thead>
         <tbody>

            <c:forEach items="${list}" var="cdto">
               <tr align="center">
                  <th><img alt="사진없음"   
                        src="/upload/${fn: replace(cdto.bivo.saveDir, '\\','/')}/${cdto.bivo.uuid }_${cdto.bivo.fileName}"></th>
                  <th>${cdto.cvo.title}</th>
                  <th>${cdto.cvo.author}</th>
                  <th>${cdto.cvo.price}</th>
                  <th>${cdto.cvo.count}</th>
               </tr>
               <c:set var= "total" value="${total + cdto.cvo.price*cdto.cvo.count}"/>
            </c:forEach>
            
         </tbody>
      </table>
   </div>   <!-- tbDiv -->
      
      
      
      
      

      
      <div class="Detail">
      <div align="left" id="h3"><h3>배송 정보</h3></div>
      <div class="userDetail" align="left">
      
      <form action="/bookorder/order" name="check_submit" method="post">
         <input type="hidden" name="id" value="${ses.uvo.id}"> 

      
      <table class="usertable">
         <tr>
         <th>받는분 성함</th>
         <th><input type="text" name="name"></th>
         </tr>
         
         <tr>
         <th>우편번호</th>
         <th><input type="text" id="sample4_postcode" placeholder="우편번호" name="addressCode">
         <input id="addBtn" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
         </th>
         </tr>
         
         <tr>
         <th>도로명주소</th>
         <th><input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addressJuso"></th>
         </tr>
         
         <tr>
         <th>지번주소</th>
         <th><input type="text" id="sample4_jibunAddress" placeholder="지번주소"><span id="guide" style="color:#999;"></span></th>
         </tr>
         
         
         <tr>
         <th></th>
         <th><input type="text" id="sample4_detailAddress" placeholder="나머지 주소를 입력하세요." name="addressDetail"></th>
         </tr>
         
         
         <tr>
         <th>요청사항</th>
         <th><textarea rows="1" name="etc" style="resize:none"></textarea></th>
         </tr>
         
         
         </table>
   
         
         
      <div class="payDiv">
      
      <div align="left" id="h3"><h3>결제 정보</h3></div>   
         
      <div class="payinfo">
      
       
       <div id="pay_div">상품금액 : ${total}원</div> 
       
        <div class="deliveryPriceValue" id="extra_div">
        배송비 : 
         <c:if test="${total > 15000}">
             0
            </c:if>
           <c:if test="${total <= 15000}">
               3000
            </c:if>
          </div>
   
      <div class="totalPriceValue" id="total_div">
           <c:if test="${total>15000}">결제금액 : <fmt:formatNumber value="${total}" /></c:if>
           <c:if test="${total<15000}">결제금액 : <fmt:formatNumber value="${total+3000}" /></c:if>
        </div>
                     

      <div style="margin-top: 10px;">
         <select name="payType" id="payType">
             <option value="">결제수단</option>
             <option value="신용카드">신용카드</option>
             <option value="계좌이체">계좌이체</option>
             <option value="무통장입금">무통장입금</option>
             <option value="휴대폰결제">휴대폰결제</option>
         </select>
         </div>
         
         </div> <!--payinfo  -->
   
                
         <div class="paybtn">
         <button type="button" id="submitBtn">결제하기</button>   
         </div>
      </div>
      </form>
      
      
      
      </div><!-- UserDetail -->
      
      
      </div>   <!-- Detail -->
      
      
   </div> <!-- wrapper -->
</div> <!-- all-->

   
   
   
   <jsp:include page="../layout/footer.jsp"></jsp:include>   
   
   
   
   
   
   
   
   
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const submitBtn = document.getElementById('submitBtn');
const form = document.querySelector('.userDetail').querySelector('form');
const input = form.querySelectorAll('input');
const select = form.querySelector('select');

submitBtn.addEventListener('click', ()=>{
  for(let i=0; i<input.length; i++){
    let item = input.item(i);
   console.log(item);
    if(item.value === ""){
      alert("빈칸을 모두 작성해야합니다");
      return false;
    }
  }

  if(select.value === ""){
    alert("결제 방식을 선택해주세요");
      return false;
  }
  
  document.check_submit.submit()
})
   

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
 
</script>


<script>
const btn = document.querySelector('.submitBtn')

btn.onmousemove = function (e) {
  const x = e.pageX - btn.offsetLeft
  const y = e.pageY - btn.offsetTop
  
  btn.style.setProperty('--x', x + 'px')
  btn.style.setProperty('--y', y + 'px')
}
</script>


</body>
</html>