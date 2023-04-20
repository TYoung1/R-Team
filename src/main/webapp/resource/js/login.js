
// 접었다 폈다
function guide_sub_login() {
    var view = document.getElementById('guide');
    if (view.style.display === 'none') {
        view.style.display = 'block';
      } else {
        view.style.display = 'none';
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
function search_id() {
    var pageup = document.getElementById('id_page');
    if (pageup.style.display === 'none') {
        pageup.style.display = "block"
        document.documentElement.style.pointerEvents = "none";
        pageup.style.pointerEvents = "auto";
    }
}

function search_pw() {
    var page = document.getElementById('pw_page');
    if (page.style.display === 'none') {
        page.style.display = "block"
        document.documentElement.style.pointerEvents = "none";
        page.style.pointerEvents = "auto";
    }
}

function close_page() {
    // iframe을 숨김
    parent.document.getElementById('id_page').style.display = 'none';
    parent.document.getElementById('pw_page').style.display = 'none';
    var pageup = parent.document.getElementById('id_page');
    var page = parent.document.getElementById('pw_page');
    pageup.style.pointerEvents = 'auto';
    
    page.style.pointerEvents = 'auto';

    // 부모 요소를 활성화
    var parentDoc = parent.document.documentElement;
    parentDoc.style.pointerEvents = "auto";
    parentDoc.style.opacity = "1";
}
