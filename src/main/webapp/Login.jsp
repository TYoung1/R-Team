<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개발차 : 로그인</title>
<link rel="stylesheet" href="resource/css/login.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<% String Chk = (String)session.getAttribute("chk"); 
		if(Chk =="1"){
			session.removeAttribute("chk");
		%>
	<script>
			alert("존재하지 않는 아이디 입니다.");
		</script>
	<%
		}
	else if(Chk == "2"){
		session.removeAttribute("chk");
	%>
	<script>
			alert("비밀번호가 틀립니다.");
		</script>
	<%
		}
	%>
	<div id="app">
		<section class="lay_out">
			<div class="ko">
				<div class="login-bg">
					<h2>
						<a href="Home.jsp"><img src="resource/img/내 프로젝트-1.png"></a>
					</h2>
					<div class="bg-content">
						<div class="logo-warp">
							<a href="Home.jsp"><img src="resource/img/내 프로젝트-1.png"></a>
						</div>
						<p class="welcome-message">
							차량을 더 싸게!<br> 개발차 통합 회원 가입 서비스로<br> 편리하게 로그인하세요!
						</p>
					</div>
					<div class="bg-footer">
						<nav class="terms-links">
							<span class="fot_span">개인정보처리방침</span> <span class="fot_span">서비스
								이용 약관</span> <span class="fot_span">공지사항</span>
						</nav>
						<em class="fot_em">© 2023 Kim Tae Young , Park Jun Beom. All
							Rights Reserved.</em>
					</div>
					<label class="language" style="width: 200px;"> <select
						onchange="change_language()" id="lang-change">
							<option value="KO">한국어</option>
							<option value="EN">영어</option>
					</select>
					</label>
				</div>

				<div class="login-container">
					<div class="login-main">
						<section class="login-form">
							<p class="guide-text">기존 이용자인가요?</p>
							<form name="form_Login" method="post" action="selectForm"
								enctype="utf-8">
								<input type="text" placeholder="아이디를 입력하세요"
									style="padding-left: 20px;" name="User_id"> <input
									type="password" placeholder="비밀번호를 입력하세요"
									style="padding-left: 20px;" name="User_pw">
								<button type="submit" class="submit_form">로그인</button>
							</form>
						</section>
						<div class="social-login-form">

							<div class="etc-login">
								<div more-button>
									<div class="text-button" onclick="guide_sub_login()">
										<span>다른 서비스 이용하기</span>
									</div>
									<div class="login-con" id="guide">
										<div class="more-content">
											<div class="primary-center">
												<button class="message_button" onclick="search_id()">아이디
													찾기</button>
												<iframe title="help scout beacon" class="frame"
													style="display: none;" id="id_page" src="findid.jsp"
													width="600px" height="600px" frameborder="0"> </iframe>
											</div>
										</div>
										<div class="more-content">
											<div class="primary-center">
												<button class="message_button" onclick="search_pw()">비밀번호
													찾기</button>
												<iframe title="help scout beacon" class="frame"
													style="display: none;" id="pw_page" src="findpw.jsp"
													width="600px" height="600px" frameborder="0"> </iframe>
											</div>
										</div>
										<div class="more-content">
											<div class="primary-center">
												<a href="Signup.jsp" id="link"
													style="text-decoration: none;">회원가입</a>
											</div>
										</div>
									</div>
									<div class="fot-message">개발차 통합 아이디로 다양한 서비스를 이용해 보세요.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script src="resource/js/login.js"></script>
</html>