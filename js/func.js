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
        icon.className = icon.className.replace(" fa-caret-down"," fa-caret-up")
    }
}
// 상세 기능
function guide_sub_login() {
    var view = document.getElementById('guide');
    if (view.style.display === 'none') {
        view.style.display = 'block';
      } else {
        view.style.display = 'none';
      }
}