var userId = document.getElementById("userId").value;
var userName = document.getElementById("userName").value;

console.log("userId: " + userId);
console.log("userName: " + userName);

function message_make() {
    var page = document.getElementById('message_page');
    if (page.style.display === 'none') {
        page.style.display = "block"
    }
    else {
        page.style.display = "none"
    }
}