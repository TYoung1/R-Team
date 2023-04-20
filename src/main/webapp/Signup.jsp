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
<%
Object chk_ = session.getAttribute("chk");
String chk_value = (String) chk_;
%>
<%
if (chk_value != null) {
   session.removeAttribute("chk");
%>
<script>
   alert("아이디가 중복됩니다.");
</script>
<%
}
%>
<script src="resource/js/input_info.js"></script>

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
				<div class="title">
					<h1>회원가입</h1>
				</div>
				<div class="content">
					<form action="insertForm" method="post" enctype="utf-8"
						onsubmit="return validateForm()">
						<label>아이디</labe> <input type="text" name="user_id" id="ID_in"
							onblur="ID_input()">
							<div id="id_inner" class="c_red"></div> <label>비밀번호</label> <input
							type="password" name="user_pw" id="PW_" onblur="PW_input()">
							<div id="pw_inner" class="c_red"></div> <label>비밀번호 확인</label> <input
							type="password" name="Chk_pw" id="RPW_" onblur="RPW_input()">
							<div id="rpw_inner" class="c_red"></div> <label>이름</label> <input
							type="text" name="user_name" id="NAME_" onblur="NAME_input()">
							<div id="name_inner" class="c_red"></div> <label>생년월일</label><br>
							<input type="text" placeholder="생년월일 8자리를 입력해주세요."
							name="user_birth" id="BIRTH_" onblur="BIRTH_input()"
							maxlength="8">
							<div id="birth_inner" class="c_red"></div> <label>성별</label> <select
							name="user_gender" id="gen" onblur="GENDER_input()">
								<option selected disabled value="0">성별선택</option>
								<option value="male">남</option>
								<option value="female">여</option>
						</select>
							<div id="gender_inner" class="c_red"></div>
							<button type="submit" onclick="submit_btn()" id="btn_">가입하기</button>
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
		<div class="reserved">© 2023. Kim Tae Young , Park Jun Beom. All
			rights reserved.</div>
	</footer>
</body>
<script>
	
</script>
</html>