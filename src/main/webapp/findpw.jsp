<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resource/css/find.css">
<script src="resource/js/login.js"></script>
<title>Document</title>
</head>
<body>
	<div class="main">
		<div class="content">
			<h1>
				<a href="#"><span>개발</span>차</a><span class="spacing"
					onclick="close_page()">X</span>
			</h1>
			<form method="post" action="findpwForm">
				<input type="text" placeholder="아이디를 입력하세요" name=user_id> <input
					type="text" placeholder="이름을 입력하세요" name=user_name> <input
					type="text" placeholder="생년월일 6자리" name="user_birth"> <select
					name="user_gender" class="menu_sel">
					<option value="male" selected="selected" name="car_type">
						ㅡ 남성 ㅡ</option>
					<option value="female" name="car_type">ㅡ 여성 ㅡ</option>
				</select>
				<button type="submit">비밀번호 찾기</button>
			</form>
		</div>
		<div class="inner" id="innerText">
			<%
			Object PW_ = session.getAttribute("user_pw");
			String PW_value = (String) PW_;
			%>
			<%
			if (PW_ != null) {
			%>
			<div>
				<%
				out.println("회원 비밀번호 : " + PW_value);
				%>
			</div>
			<%
			} else {
			%>
			<div></div>
			<%
			}
			session.removeAttribute("user_pw");
			%>
		</div>
	</div>
</body>
</html>