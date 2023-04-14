let title = document.getElementById("c_title");
let img = document.getElementsByClassName("p_img");
let now = document.getElementById("c_title");
function Switch(car){
    for(var i=0;i<img.length;i++){
        img[i].style.display="none";
    }
    now.innerText=car;
    document.getElementById(car).style.display="block";
}

function Showandhide(val,i){
    let icon = document.getElementById(i); 
    let target =document.getElementById(val);
    if(target.style.display == "block"){
        target.style.display="none";
        icon.className = icon.className.replace(" fa-caret-up"," fa-caret-down");

    }else{
        target.style.display="block";
        icon.className = icon.className.replace(" fa-caret-down"," fa-caret-up");
    }
}
// 위로가기 버튼
let topbtn = document.getElementById("gotop");
topbtn.addEventListener('click',function(){
    window.scrollTo({top:0,behavior:"smooth"});
})

window.onscroll = ()=>window.scrollY > 500 ? topbtn.style.opacity=1 : topbtn.style.opacity=0;

function chk_value() {
    const min_year = document.getElementById("min_year").value;
    const max_year = document.getElementById("max_year").value;
    const min_mileage = document.getElementById("min_year").value;
    const max_mileage = document.getElementById("max_year").value;
    const min_price = document.getElementById("min_year").value;
    const max_price = document.getElementById("max_year").value;
    }
    if (min_year !== "" && max_year !== "" && min_mileage !== "" && max_mileage !== "" && min_price !== "" && max_price !== "") {
        document.querySelector("button[type=submit]").removeAttribute("disabled")
    } else {
        document.querySelector("button[type=submit]").setAttribute("disabled", "disabled")
    };

