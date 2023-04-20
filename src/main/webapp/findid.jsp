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
			<form method="post" action="findidForm">
				<input type="text" placeholder="이름입력" name=user_name> <input
					type="text" placeholder="생년월일 6자리" name="user_birth"> <select
					name="user_gender" class="menu_sel">
					<option value="male" selected="selected" name="car_type">
						ㅡ 남성 ㅡ</option>
					<option value="female" name="car_type">ㅡ 여성 ㅡ</option>
				</select>
				<button type="submit">아이디 찾기</button>
			</form>
		</div>
		<div class="inner" id="innerText">
			<%
			Object ID_ = session.getAttribute("user_id");
			String ID_value = (String) ID_;
			%>
			<%
			if (ID_ != null) {
			%>
			<div>
				<%
				out.println("회원 아이디 : " + ID_value);
				%>
			</div>
			<%
			} else {
			%>
			<div></div>
			<%
			}
			session.removeAttribute("user_id");
			%>
		</div>
	</div>
</body>
</html>