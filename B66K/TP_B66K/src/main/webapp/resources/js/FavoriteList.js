async function DeleteFavoriteFromServer(fno){
	try{
		const url = "/favorite/"+fno;
		const config = {
			method:"delete"
		};
		const resp = await fetch(url, config);
		const result = await resp.text();
		return result;
	}catch(error){
		console.log(error);
	}
}

async function RegisterCartList(cartData){

    try{
        const url = '/cart/register';
        const config = {
            method:"post",
            headers:{
                'Content-Type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cartData)
        }
        const resp = await fetch(url, config);
        const result = await resp.text(); //isOk
        return result;

    }catch(err){
        console.log(err);
    }
}

document.addEventListener('click', (e)=>{

	if(e.target.classList.contains('FavoriteDeleteBtn')){ // 테이블 줄 삭제
		let tr = e.target.closest('tr');
		let fnoVal = tr.dataset.fno;
		console.log(fnoVal);
		DeleteFavoriteFromServer(fnoVal).then(result =>{
			if(result>0){
                popup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('찜 삭제 완료!');
                tr.remove(); // 삭제 완료되면 해당 tr줄 삭제
                window.location.reload();
			}
		})		
	}

	if(e.target.classList.contains('CartRegisterBtn')){
        let bnoVal = e.target.dataset.bno;
        console.log(bnoVal);
        let cartData = {
            id : idVal,
            bno : bnoVal,
            count : 1
        };
        console.log(cartData);
        RegisterCartList(cartData).then(result => {
            //여기서 받는 값은 isOk 잘 들어갔는지 확인 데이터
            if(result > 0){
                popup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('장바구니에 등록되었습니다.');
            }else{
                popup.style.display = "block";
                body.style.overflow = "hidden";
                setMessage('이미 장바구니에 등록되어있는 상품입니다.');
            }

        })
    }
	
})


// 팝업 
const body = document.querySelector("body");
const popup = document.getElementById("popup");

let modalMessage = document.getElementById('modalMessage');

function setMessage(text) {
   modalMessage.innerText = text;
}

function closePopup() {
   popup.style.display = "none";
   body.style.overflow = "auto";
   window.location.reload();
}

document.querySelector(".popupCloseBtn").addEventListener(
    "click", closePopup);
