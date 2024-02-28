async function postAnswerToServer(answerData){

    try {
        const url = '/answer/post'
        const config = {
            method:"post",
            headers:{
                'content-type':'application/json; charser=utf-8'
            },
            body:JSON.stringify(answerData)
        }
        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;

    } catch (err){
        console.log(err);
    }
}


document.getElementById('myanswerBtn').addEventListener('click',()=>{
    const answertxt = document.getElementById('answertxt').value;
    console.log(answertxt);

    if(answertxt =="" || answertxt==null){
        alert("입력값이없습니다.")
        document.getElementById('answertxt').focus();
        return false;
    }else{
        let answerData={
            qno : qnoVal,
            content : answertxt
    };

    console.log(answerData);
    postAnswerToServer(answerData).then(result=>{

        if(result>0){
            alert("답변이 등록되었습니다.");
            window.location.reload();
            getAnswerList(answerData.qno);
        }
    })
    }
})


async function spreadAnswerFromServer(qno){
    console.log(qno);
    try{
        const resp = await fetch('/answer/'+qno);
        const result = await resp.json();
        return result;
    } catch(err){
        console.log(err);
    }
}


function getAnswerList(qno){
    spreadAnswerFromServer(qno).then(result =>{
        const role = roleVal;
        const ul = document.getElementById('answerArea');
        if(result.length > 0){
            ul.innerHTML = "";


            if(role != 'admin'){
           
                for(let avo of result){
                
                let li = `<div id="andiv"><li data-ano="${avo.ano}"><div>`;
                li += `<textarea id="answerTextMod">${avo.content}</textarea>`;
                li += `<div class="answerBtndiv" align="right"> <div id="answerDate">${avo.regDate}</div>`;
                li += `</div></div>`;
                ul.innerHTML+=li;
            }
        } else{

            for(let avo of result){
                
                let li = `<li data-ano="${avo.ano}"><div>`;
                li += `<div id="answerBtn"><button type="button" class="answermodBtn" id="answermodBtn">Mod</button>`;
                li += `<button type="button" class="answerdelBtn" id="answerdelBtn">Del</button><br>`;
                li += `<textarea id="answerTextMod">${avo.content}</textarea>`;
                li += `<div class="answerBtndiv" align="right"> <div id="answerDate">${avo.regDate}</div></li></div></div>`;
                li += `</div>`;
                ul.innerHTML+=li;
            }


        }
        

        }else{
            let li =`<li></li>`
            ul.innerHTML+=li;
        }
    })
}



async function updateAnswerToServer(answerDataMod){
    try{
        const url = "/answer/"+answerDataMod.ano;
        const config = {
            method : "PUT",
            headers : {
                'Content-Type':'application/json; charset=utf-8'
            },
            body : JSON.stringify(answerDataMod)
        };

        const resp = await fetch(url, config);
        const result = await resp.text();

        return result;

    }catch(error){
        console.log(error);
    }
}




async function removeAnswerToServer(ano){
    try{
        const url = '/answer/'+ano;
        const config={
            method:'delete'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    }catch(err){
        console.log(err);
    }
}




document.addEventListener('click',(e)=>{
    console.log(e.target);
    if(e.target.classList.contains('answermodBtn')){
        console.log("수정버튼 클릭");
        let li = e.target.closest('li');
        //내가 클릭한 버튼의 댓글 뭉치
        let anoVal = li.dataset.ano;
        let textContent = li.querySelector('#answerTextMod').value;
        console.log("ano/content"+anoVal+"  "+textContent);


        let answerDataMod = {
            ano : anoVal,
            content : textContent
        };
        console.log(answerDataMod);

        //서버연결-->> updateComment멧서드 작성하기~
        updateAnswerToServer(answerDataMod).then(result=>{
            if(result>0){
                alert('댓글이 수정되었습니다.');
                window.location.reload();
                
                
            }else{
                alert('댓글 수정이 실패했습니다.');
                
            }
  
            getAnswerList(anoVal);
        })


 

        
    }else if(e.target.classList.contains('answerdelBtn')){
        console.log("삭제버튼클릭시");
        let li = e.target.closest('li');
        let anoVal = li.dataset.ano;

        removeAnswerToServer(anoVal).then(result=>{
            if(result>0){
                alert('삭제되었습니다.');
                window.location.reload();
            }
            getAnswerList(anoVal);
        })
    }

})
