<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개발차</title>
<script src="https://kit.fontawesome.com/ec5d781ab7.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resource/css/home.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>
<body>
	<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	Integer MASTER_ = (Integer)session.getAttribute("master");

	%>
	<nav>
		<a href="#" class="logo"><span>개발</span>차</a>
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
	<div class="banner">
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="ban_wrap">
						<img src="resource/img/ban1.png" width="100%" height="100%">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="ban_wrap">
						<img src="resource/img/ban2.png" width="100%" height="100%">
					</div>
				</div>
				<div class="swiper-slide">
					<div class="ban_wrap">
						<img src="resource/img/ban3.png" width="100%" height="100%">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="wrapper">
			<div class="product">
				<div class="p_btn">
					<button onclick="Switch('Audi')" name="car_type" value="audi">
						<div>
							<img src="resource/img/Audi.png" width="40%" height="100%" />
							<div>AUDI</div>
						</div>
					</button>
					<button onclick="Switch('Toyota')" name="car_type" value="toyota">
						<div>
							<img src="resource/img/toyota.png" width="40%" height="100%" />
							<div>TOYOTA</div>
						</div>
					</button>
					<button onclick="Switch('Hyundai')" name="car_type" value="hyundai">
						<div>
							<img src="resource/img/Hyundai.png" width="50%" height="100%" />
							<div>HYUNDAI</div>
						</div>
					</button>
					<button onclick="Switch('Vw')" name="car_type" value="vw">
						<div>
							<img src="resource/img/vw.png" width="28%" height="100%" />
							<div>VW</div>
						</div>
					</button>
					<button onclick="Switch('Bmw')" name="car_type" value="bmw">
						<div>
							<img src="resource/img/BMW.png" width="50%" />
							<div>BMW</div>
						</div>
					</button>
				</div>
				<span id="c_title">AUDI</span>
				<div class="p_img" id="Audi" style="display: block;">
					<div class="swiper mySwiper2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/Audi_A1.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/Audi_A3.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/Audi_A4.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/Audi_A5.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/Audi_A6.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/Audi_A7.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/Audi_A8.png" width="100%" height="100%">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="p_img" id="Bmw">
					<div class="swiper mySwiper2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_1_Series.png" width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_2_Series.png" width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_3_Series.png" width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_4_Series.png" width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_5_Series.png" width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_6_Series.png" width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_7_Series.png" width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/BMW_8_Series.png" width="100%"
										height="100%">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="p_img" id="Hyundai">
					<div class="swiper mySwiper2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/그랜저.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/넥쏘.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/베뉴.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/쏘나타.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/아반떼.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/아이오닉5.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/아이오닉6.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/캐스퍼.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/코나.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/투싼.png" width="100%" height="100%">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="p_img" id="Vw">
					<div class="swiper mySwiper2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/golf.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/passat.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/polo.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/up.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/tiguan.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/sharan.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/tcross.png" width="100%" height="100%">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="p_img" id="Toyota">
					<div class="swiper mySwiper2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/gr86.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/supra.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/prius.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/yaris.png" width="100%" height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/proace.png      " width="100%"
										height="100%">
								</div>
							</div>
							<div class="swiper-slide">
								<div class="car_wrap">
									<img src="resource/img/rav4.png" width="100%" height="100%">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="bottom">
					<div class="wrapper">
						<div class="flex_con">
							<div class="notice">
								<div class="n_top">
									<h3>공지사항</h3>
									<a href="notice_h.jsp"><i class="fa-solid fa-plus"></i></a>	
								</div>
								<div class="n_bottom">
									<p>
										.title <span>.date</span>
									</p>
								</div>
							</div>
							<div class="event">
								<div class="swiper mySwiper3">
									<div class="swiper-wrapper">
										<div class="swiper-slide">
											<div class="evt_wrap">
												<img src="resource/img/evt1.png" width="100%" height="100%">
											</div>
										</div>
										<div class="swiper-slide">
											<div class="evt_wrap">
												<img src="resource/img/evt2.png" width="100%" height="100%">
											</div>
										</div>
										<div class="swiper-slide">
											<div class="evt_wrap">
												<img src="resource/img/evt3.png" width="100%" height="100%">
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="detail">
			<h3>상세조회</h3>
			<div class="side">
				<form method="post" action="findcarForm">
					<div class="menu" onclick="Showandhide('size','fa')">
						<span>차종</span><i class="fa-solid fa-caret-down"></i>
					</div>
					<div class="box" id="size">
						<input type="radio" value="경차" name="car_type" checked="checked">경차 <input
							type="radio" value="소형" name="car_type">소형 <input
							type="radio" value="중형" name="car_type">중형 <input
							type="radio" value="대형" name="car_type">대형 <input
							type="radio" value="스포츠카" name="car_type">스포츠카
					</div>
					<div class="menu" onclick="Showandhide('year','sa')">
						<span>연식</span><i class="fa-solid fa-caret-down"></i>
					</div>
					<div class="box" id="year">
						<input type="text" name="car_min_year" id="min_year" onblur="chk_value()"> ~ <input
							type="text" name="car_max_year" id="max_year" onblur="chk_value()">
					</div>
					<div class="menu" onclick="Showandhide('km','ta')">
						<span>주행거리</span><i class="fa-solid fa-caret-down"></i>
					</div>
					<div class="box" id="km">
						<input type="text" name="car_min_mileage" id="mileage_year" onblur="chk_value()"> ~ <input
							type="text" name="car_max_mileage" id="mileage_year" onblur="chk_value()">
					</div>
					<div class="menu" onclick="Showandhide('price','foa')">
						<span>가격</span><i class="fa-solid fa-caret-down"></i>
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
			<div class="reserved">© 2023. Kim Tae Young , Park Jun Beom.
				All rights reserved.</div>
		</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="resource/js/swiper.js"></script>
<script src="resource/js/func.js"></script>
<script language="javascript">
	function closePage() {
		session.removeAttribute("user_id");
	}
</script>
</html>