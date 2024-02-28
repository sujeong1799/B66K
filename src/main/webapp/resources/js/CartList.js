
const plusButtons = document.querySelectorAll('.plus')
const minusButtons = document.querySelectorAll('.minus')


plusButtons.forEach((button) => {
button.addEventListener('click', () => {
const parent = button.closest('.count_row') // 버튼의 부모 요소인 .count_row를 찾음
const countElement = parent.querySelector('.count') // 부모 요소 내에서 .count 요소를 찾음
const countValue = parent.querySelector('input')

// 현재 count 값을 가져와서 1을 더한 후 다시 적용
let count = parseInt(countElement.textContent)
let cnoVal = countValue.dataset.cno;
if(count<99){
    count += 1
    countElement.textContent = count;
    countValue.value = count;
    console.log(cnoVal)
    console.log(count)

    let tr = button.closest('tr');
    let price = tr.querySelector('.price').value;
    console.log(price);
    total = parseInt(total) + parseInt(price);
        const formattedNumber = new Intl.NumberFormat('en-US', {
	  		useGrouping: true,
  			minimumFractionDigits: 0,
  			maximumFractionDigits: 0,
		}).format(total);
    document.getElementById('pay_div').innerHTML =  formattedNumber;
		if(total < 15000){
			document.getElementById('extra_div').innerHTML =  '3,000';		
		}
		
		document.getElementById('total_div').innerHTML =  formattedNumber;
		
    cartCountData = {
        cno : cnoVal,
        count : count
    };

    CartCountToServer(cartCountData).then(result=>{
        if(result>0){
            console.log('개수 반영 완료');

        }else{
            console.log('개수 반영 실패');
        }
    })


}
  })
})

minusButtons.forEach((button) => {
    button.addEventListener('click', () => {
    const parent = button.closest('.count_row') // 버튼의 부모 요소인 .count_row를 찾음
    const countElement = parent.querySelector('.count') // 부모 요소 내에서 .count 요소를 찾음
    const countValue = parent.querySelector('input')
    
    // 현재 count 값을 가져와서 1을 더한 후 다시 적용
    let count = parseInt(countElement.textContent)
    let cnoVal = countValue.dataset.cno;
    if(count>1){
        count += -1
        countElement.textContent = count;
        countValue.value = count;
        console.log(cnoVal)
        console.log(count)

        let tr = button.closest('tr');
        let price = tr.querySelector('.price').value;
        console.log(price);
        total = parseInt(total) - parseInt(price);
        console.log(total);
        const formattedNumber = new Intl.NumberFormat('en-US', {
	  		useGrouping: true,
  			minimumFractionDigits: 0,
  			maximumFractionDigits: 0,
		}).format(total);

      document.getElementById('pay_div').innerHTML =  formattedNumber;
		if(total < 15000){
			document.getElementById('extra_div').innerHTML =  '3,000';		
		}
		
		document.getElementById('total_div').innerHTML =  formattedNumber;
		
        cartCountData = {
            cno : cnoVal,
            count : count
        };
    
        CartCountToServer(cartCountData).then(result=>{
			if(result>0){
				console.log('개수 반영 완료');
			}else{
				console.log('개수 반영 실패');
			}
		})
    }
      })
    })

document.addEventListener('click', (e)=>{

        if(e.target.classList.contains('CartDeleteImg')){ // 카트에 담긴 상품 삭제
            let img = e.target.closest('img');
            let tr = e.target.closest('tr');
            let cnoVal = img.dataset.cno;
            console.log(cnoVal);
            DeleteCartItemFromServer(cnoVal).then(result =>{
                if(result>0){
                    alert('상품 삭제 완료!');
                    tr.remove(); // 삭제 완료되면 해당 상품줄 삭제
                    window.location.reload();
                }
            })		
        }
        
    })


async function DeleteCartItemFromServer(cno){
	try{
		const url = "/cart/"+cno;
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

async function CartCountToServer(cartCountData){

    try{
        const url = '/cart/changeCount';
        const config = {
            method:"put",
            headers:{
                'Content-Type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cartCountData)
        }
        const resp = await fetch(url, config);
        const result = await resp.text(); //isOk
        return result;

    }catch(err){
        console.log(err);
    }
}
//window.location.href = "/bookorder/order"; 
// document.getElementById('orderBtn').addEventListener('click', ()=>{
//     let count = document.querySelectorAll('input[name="count"]'); // name이 count인 input 찾아서 배열로 저장
//     let bno = document.querySelectorAll('input[name="bno"]'); // name이 bno인 input 찾아서 배열로 저장
//     let ItemCountList = [];
//     for(let i=0; i<count.length; i++){
//         let tmp = {
//             bno : bno[i].value,
//             count : count[i].value
//         };
//         ItemCountList.push(tmp);
//     }
  
//         console.log(ItemCountList);
    
    
//     AmountCheck(ItemCountList).then(result=>{
//         if(result>0){
//             console.log('됨');
//         }else{
//             console.log('안됨');
//         }
//     })


// })

// async function AmountCheck(ItemCountList){

//     try{
//         const url = '/cart/AmountCheck';
//         const config = {
//             method:"post",
//             headers:{
//                 'Content-Type':'application/json; charset=utf-8'
//             },
//             body:JSON.stringify(ItemCountList)
//         }
//         const resp = await fetch(url, config);
//         const result = await resp.text(); //isOk
//         return result;

//     }catch(err){
//         console.log(err);
//     }
// }
