
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

// 검색 조건 
function active(){
    let a = document.getElementById("min_year").value;
    let b = document.getElementById("max_year").value;
    let c = document.getElementById("min_mileage").value;
    let d = document.getElementById("max_mileage").value;
    let e = document.getElementById("min_price").value;
    let f = document.getElementById("max_price").value;
    let btn = document.getElementById("search");
    if(a!="" && b!="" && c!="" && d!="" && e!="" && f!=""){
        btn.removeAttribute("disabled");
    }else{
        btn.setAttribute("disabled","disabled")
    }
}
// 버튼 색깔 변경
function color(tar){
	let sbtn = document.getElementsByClassName("sbtn");
	let target = document.getElementById(tar);
	for(let i=0; i<sbtn.length;i++){
	sbtn[i].style.border="1px solid skyblue";
	}
	target.style.border ="2px solid red";
	
}
