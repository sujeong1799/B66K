const btn = document.getElementById("btn");
const pwInput = document.getElementById("pw");
const popup = document.getElementById("popup");
const body = document.querySelector("body");

btn.addEventListener("click", function () {
    const pwValue = pwInput.value;

    $.ajax({
    url: "/member/pwCheck",
    type: "POST",
    data: { "pw": pwValue },
    success: function (data) {
    if (data === "1") {
        window.location.href = "/member/remove";
    } else if (data === "0") {
        popup.style.display = "block";
        body.style.overflow = "hidden";
    }
    },
    error: function (data) {
    popup.style.display = "block";
    body.style.overflow = "hidden";
    }
    });
});

function closePopup() {
    popup.style.display = "none";
    body.style.overflow = "auto";
}

popup.addEventListener('click', e =>{
    const eTarget = e.target
    if(eTarget.classList.contains('popup')){
        popup.style.display = 'none';
        body.style.overflow = 'auto';
   }
})

document.querySelector(".closeBtn").addEventListener("click", closePopup);