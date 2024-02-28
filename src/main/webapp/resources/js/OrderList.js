
const checkbox = document.querySelector('#itemCheckbox');
let order = document.querySelectorAll('.status');

itemHide();

checkbox.addEventListener('change', function(){
    if(this.checked) {
        for(let i=0; i<order.length; i++){
            console.log(order[i].value);
            if(order[i].value === '주문취소'){
                let tr = order[i].closest('tr')
                tr.style.display="";
            }
        }
    } else {
        itemHide();
    }
})


function itemHide(){
    for(let i=0; i<order.length; i++){
        console.log(order[i].value);
        if(order[i].value === '주문취소'){
            let tr = order[i].closest('tr')
            tr.style.display="none";
        }
    }
}
