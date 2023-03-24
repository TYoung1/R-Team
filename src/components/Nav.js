import React from 'react';
import "./Nav.css"

function Nav() {
  return (
    <nav>
        <a href="#" class="logo"><span>Mu</span>gu</a>
        <form><input type="text" class="search"></input><button class="search_btn"><i class="fa-solid fa-magnifying-glass"></i></button></form>
        <ul>
            <li><a href="#">이용권</a></li>
            <li><a href="login.html">로그인</a></li>
            <li><a href="#" onclick="show()"><i class="fa-solid fa-bars"></i></a></li>
        </ul>
        <div class="hidemenu" id="hide">
            <a href="#" onclick="hide()">❌</a>
            <ul>
                
                <li>마이페이지</li>
                <li>팬 게시판</li>
                <li>#인기</li>
            </ul>
        </div>
    </nav>
  )
}

export default Nav