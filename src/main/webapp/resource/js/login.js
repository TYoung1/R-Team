
// 접었다 폈다
function guide_sub_login() {
    var view = document.getElementById('guide');
    if (view.style.display === 'none') {
        view.style.display = 'block';
      } else {
        view.style.display = 'none';
      }
}

function search_id() {
    var page = document.getElementById('id_page');
    if (page.style.display === 'none') {
        page.style.display = "block"
    }
    else {
        page.style.display = "none"
    }
}

function search_pw() {
    var page = document.getElementById('pw_page');
    if (page.style.display === 'none') {
        page.style.display = "block"
    }
    else {
        page.style.display = "none"
    }
}


// 언어 변경
function change_language() {
   var select_lang = document.getElementById("lang-change").value;
   if(select_lang == "EN"){
      location.href = "http://localhost:8080/Team/Login_en.jsp"
   } else {
      location.href = "http://localhost:8080/Team/Login.jsp"
   }
}