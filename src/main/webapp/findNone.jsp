<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://kit.fontawesome.com/ec5d781ab7.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resource/css/findcar.css">
<body>
	<nav style="margin-bottom: 120px">
		<%
		Object ID_ = session.getAttribute("user_id");
		String ID_value = (String) ID_;
		%>
		<a href="Home.jsp" class="logo"><span>개발</span>차</a>
		<!-- ID_ 가 Null 이면 navbar 상단에 로그인 / 회원가입 표시 -->
		<%
		if (ID_ == null) {
		%>
		<ul>
			<li><a href="Login.jsp">로그인</a></li>
			<li><a href="Signup.jsp">회원가입</a></li>
		</ul>
		<!-- ID_ 가 Null이 아니면 navbar 상단에 섹션에 담긴 ID값과 로그아웃 / 회원탈퇴 표시 -->
		<%
		} else {
		%>
		<ul>
			<li>
				<%
				out.println("회원 : " + ID_value);
				%>
			</li>
			<li><a href="./logout.jsp">로그아웃</a></li>
			<li><a href="./Delete.jsp">회원탈퇴</a></li>
		</ul>
		<%
		}
		%>
	</nav>
	<div class="main">
		<div class="wrapper">
			<img src="resource/img/notfound.png" />
		</div>
		<div class="detail">
			<h3>상세조회</h3>
			<div class="side">
				<form method="post" action="findcarForm">
					<div class="menu" onclick="Showandhide('make','ma')">
						<span>브랜드</span><i class="fa-solid fa-caret-down" id="ma"></i>
					</div>
					<div class="box" id="make">
						<select name="car_make" class="menu_sel">
							<option value="audi" selected="selected" name="car_make">
								AUDI</option>
							<option value="BMW" name="car_make">BMW</option>
							<option value="Hyundai" name="car_make">HYUNDAI</option>
							<option value="toyota" name="car_make">TOYOTA</option>
							<option value="vw" name="car_make">VW</option>
						</select>
					</div>
					<div class="menu" onclick="Showandhide('size','ra')">
						<span>차종</span><i class="fa-solid fa-caret-down" id="ra"></i>
					</div>
					<div class="box" id="size">
						<select name="car_type" class="menu_sel">
							<option value="경차" selected="selected" name="car_type">
								ㅡ 경차 ㅡ</option>
							<option value="소형" name="car_type">ㅡ 소형 ㅡ</option>
							<option value="중형" name="car_type">ㅡ 중형 ㅡ</option>
							<option value="대형" name="car_type">ㅡ 대형 ㅡ</option>
							<option value="스포츠카" name="car_type">ㅡ 스포츠카 ㅡ</option>
						</select>
					</div>
					<div class="menu" onclick="Showandhide('year','sa')">
						<span>연식</span><i class="fa-solid fa-caret-down" id="sa"></i>
					</div>
					<div class="box" id="year">
						<input type="text" name="car_min_year" id="min_year"
							onblur="active()"> ~ <input type="text"
							name="car_max_year" id="max_year" onblur="active()">
					</div>
					<div class="menu" onclick="Showandhide('km','ta')">
						<span>주행거리</span><i class="fa-solid fa-caret-down" id="ta"></i>
					</div>
					<div class="box" id="km">
						<input type="text" name="car_min_mileage" id="min_mileage"
							onblur="active()"> ~ <input type="text"
							name="car_max_mileage" id="max_mileage" onblur="active()">
					</div>
					<div class="menu" onclick="Showandhide('price','foa')">
						<span>가격</span><i class="fa-solid fa-caret-down" id="foa"></i>
					</div>
					<div class="box" id="price">
						<input type="text" name="car_min_price" id="min_price"
							onblur="active()"> ~ <input type="text"
							name="car_max_price" id="max_price" onblur="active()">
					</div>
					<button type="submit" id="search" disabled>검색하기</button>
				</form>
			</div>
		</div>
	</div>
	<script src="resource/js/func.js"></script>
</body>
</html>