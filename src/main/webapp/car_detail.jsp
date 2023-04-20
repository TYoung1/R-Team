<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.DB_Conn"%>
<%@ page import="DataClass.CarData"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resource/css/cardetail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<title>개발차</title>
</head>
<body>
	<%
// ID 확인
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	Integer MASTER_ = (Integer)session.getAttribute("master");
// 차량 아이디 가져오기 
	String id = "";
	if(request.getParameter("carid")!= null){
		id = (String)(request.getParameter("carid"));
	}
	// 해당 차량 아이디에 해당하는 차량 정보 가져오기 
	CarData con = new DB_Conn().findDetail(id);
	String price = Integer.toString(con.PRICE);

 %>

	<nav>
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
			if(MASTER_ == 0) {
		%>
		<ul>
			<li>
				<%
				out.println("회원 : " + ID_value);
				%>
			</li>
			<li><a href="./Logout.jsp">로그아웃</a></li>
			<li><a href="./Delete.jsp">회원탈퇴</a></li>
		</ul>
		<%
		} else { 
		%>
		<ul>
			<li>
				<%
				out.println("회원 : " + ID_value);
				%>
			</li>
			<li><a href="Write.jsp">어드민</a></li>
			<li><a href="./Logout.jsp">로그아웃</a></li>
			<li><a href="./Delete.jsp">회원탈퇴</a></li>
		</ul>
		<% 
		}} %>
	</nav>
	<div class="main">
		<div class="wrapper">
			<div class="title">
				<h1 class="car_name">
					모델 :
					<%=con.MODEL %></h1>
				<%if(price.length()==4){ %>
				<h2 class="car_price">
					차랑가격 :<%=price.substring(0,3)%>만원
				</h2>
				<% }  else if(price.length() == 5){%>
				<h2 class="car_price">
					차랑가격 :<%=price.substring(0,4)%>만원
				</h2>
				<% } %>
			</div>

			<div class="bigcon">
				<div class="l_con">
					<img src="<%=con.URL %>" width="100%" height="100%">
				</div>
				<div class="r_con">
					<div class="people">
						<h3>박준영 딜러</h3>
					</div>
					<div class="info">
						<div class="car">

							<ul>
								<li><h4>
										차종 :
										<%=con.TYPE %></h4></li>
								<li><h4>
										모델 :
										<%=con.MODEL %>
									</h4></li>
								<li><h4>
										연료 :
										<%=con.FUELTYPE %>
									</h4></li>
								<li><h4>
										연식 :
										<%=con.YEAR %>
									</h4></li>
								<li><h4>
										연비 :
										<%=con.MPG %>
									</h4></li>
							</ul>
						</div>
						<div class="accident">
							<h4>
								사고이력 :
								<%= con.ACCIDENT %></h4>
							<h4></h4>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap">
				<div class="swiper mySwiper4">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="else_wrap">
								<img src="resource/img/sub1.png" width="100%" height="100%">
							</div>
						</div>
						<div class="swiper-slide">
							<div class="else_wrap">
								<img src="resource/img/sub2.png" width="100%" height="100%">
							</div>
						</div>
						<div class="swiper-slide">
							<div class="else_wrap">
								<img src="resource/img/sub3.png" width="100%" height="100%">
							</div>
						</div>
					</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="resource/js/swiper.js"></script>
</body>
</html>