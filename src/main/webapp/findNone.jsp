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
<nav>
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
		 <h4 style="text-align:center;">검색하신 조건에 맞는 차량이 없습니다.</h4>
		</div>
		<div class="detail">
			<h3>상세조회</h3>
			<div class="side">
				<form method="post" action="findcarForm">
					<div class="menu" onclick="Showandhide('size','fa')">
						<span>차종</span><i class="fa-solid fa-caret-down" id="fa"></i>
					</div>
					<div class="box" id="size">
						<input type="radio" value="경차" name="car_type" checked="checked">경차 
						<input type="radio" value="소형" name="car_type">소형 
							<input type="radio" value="중형" name="car_type">중형 
							<input type="radio" value="대형" name="car_type">대형 
							<input type="radio" value="스포츠카" name="car_type">스포츠카
					</div>
					<div class="menu" onclick="Showandhide('year','sa')">
						<span>연식</span><i class="fa-solid fa-caret-down" id="sa"></i>
					</div>
					<div class="box" id="year">
						<input type="text" name="car_min_year" id="min_year" onblur="chk_value()"> ~ <input
							type="text" name="car_max_year" id="max_year" onblur="chk_value()">
					</div>
					<div class="menu" onclick="Showandhide('km','ta')">
						<span>주행거리</span><i class="fa-solid fa-caret-down" id="ta"></i>
					</div>
					<div class="box" id="km">
						<input type="text" name="car_min_mileage" id="mileage_year" onblur="chk_value()"> ~ <input
							type="text" name="car_max_mileage" id="mileage_year" onblur="chk_value()">
					</div>
					<div class="menu" onclick="Showandhide('price','foa')">
						<span>가격</span><i class="fa-solid fa-caret-down" id="foa"></i>
					</div>
					<div class="box" id="price">
						<input type="text" name="car_min_price" id="min_price" onblur="chk_value()"> ~ <input
							type="text" name="car_max_price" id="min_price" onblur="chk_value()">
					</div>
						<button type="submit">검색하기</button>
				</form>
			</div>
		</div>
		</div>
		<script src="resource/js/func.js"></script>
</body>
</html>