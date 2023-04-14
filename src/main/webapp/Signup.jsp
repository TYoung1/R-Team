<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resource/css/signup.css">
</head>
<body>
    <nav>
        <a href="Home.jsp" class="logo"><span>개발</span>차</a>
        
        <ul>
            <li><a href="Login.jsp">로그인</a></li>
        </ul>
    </nav>
    <div class="main">
        <div class="wrap">
            <div class="sign_box">
                <div class="title"><h1>회원가입</h1></div>
                <div class="content">
                    <form action="insertForm" method="post" enctype="utf-8">
                        <label>아이디</labe><br>
                        <input type="text" name="user_id"><br>
                        <label>비밀번호</label><br>
                        <input type="password" name="user_pw"><br>
                        <label>비밀번호 확인</label><br>
                        <input type="password" name="Chk_pw"><br>
                        <label>이름</label><br>
                        <input type="text" name="user_name"><br>
                        <label>생년월일</label><br>
                        <input type="text" placeholder="생년월일 8자리를 입력해주세요." name="user_birth"><br>
                        <label>성별</label><br>
                        <select name="user_gender" id="gen">
                            <option selected disabled>성별선택</option>
                            <option value="male" >남</option>
                            <option value="female">여</option>
                        </select>
                        <button type="submit">가입하기</button>   
                    </form>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer_fot">
            <ul>
                <li>고객 센터</li>
                <li>이용 약관</li>
                <li>개인 정보 처리 방침</li>
                <li>쿠키 설정</li>
                <li>회사 정보</li>
            </ul>
            </div>
            <div class="reserved">
                © 2023. Kim Tae Young , Park Jun Beom. All rights reserved.
            </div>
    </footer>
    </body>
    <script>
 
    </script>
   </html>