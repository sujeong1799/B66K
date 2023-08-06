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

document.getElementById('CartRegisterBtn').addEventListener('click', ()=>{
    
        let cartData = {
            id : idVal,
            bno : bnoVal, // bnoVal Book 상세페이지에서 찍어줘야함
            count : 1
        };
        console.log(cartData);
        RegisterCartList(cartData).then(result => {
            //여기서 받는 값은 isOk 잘 들어갔는지 확인 데이터
            if(result > 0){
                // alert("장바구니에 등록되었습니다.");
                popup.style.display = "block";
                body.style.overflow = 'hidden';
                setMessage('장바구니에 상품이 등록되었습니다.');
            }else{
                popup.style.display = "block";
                body.style.overflow = 'hidden';
                setMessage('이미 장바구니에 등록된 상품입니다.');
            }

        })
    

})
