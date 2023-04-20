<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resource/css/login.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
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
							Cheaper vehicles!<br> As an integrated membership
							subscription service for "Gaebal Cha"<br> Log in
							conveniently!
						</p>
					</div>
					<div class="bg-footer">
						<nav class="terms-links">
							<span class="fot_span"> Privacy Policy</span> <span
								class="fot_span">Terms of Service</span> <span class="fot_span">Announcement</span>
						</nav>
						<em class="fot_em">© 2023 Kim Tae Young , Park Jun Beom. All
							Rights Reserved.</em>
					</div>
					<label class="language" style="width: 200px;"> <select
						onchange="change_language()" id="lang-change">
							<option value="KO">KOREAN</option>
							<option value="EN" selected="selected">ENGLISH</option>
					</select>
					</label>
				</div>

				<div class="login-container">
					<div class="login-main">
						<section class="login-form">
							<p class="guide-text">Are you an existing user?</p>
							<form name="form_Login" method="post" action="selectForm"
								enctype="utf-8">
								<input type="text" placeholder="Please enter your ID"
									style="padding-left: 20px;" name="User_id"> <input
									type="password" placeholder="Please enter your PW"
									style="padding-left: 20px;" name="User_pw">
								<button type="submit" class="submit_form">Login</button>
							</form>
						</section>
						<div class="social-login-form">

							<div class="etc-login">
								<div more-button>
									<div class="text-button" onclick="guide_sub_login()">
										<span> Use other services</span>
									</div>
									<div class="login-con" id="guide">
										<div class="more-content">
											<div class="primary-center">
												<button class="message_button" onclick="search_id()">Find
													Id</button>
												<iframe title="help scout beacon" class="frame"
													style="display: none;" id="id_page" src="findid.jsp"
													width="600px" height="600px" frameborder="0"> </iframe>
											</div>
										</div>
										<div class="more-content">
											<div class="primary-center">
												<button class="message_button" onclick="search_pw()">Find
													Password</button>
												<iframe title="help scout beacon" class="frame"
													style="display: none;" id="pw_page" src="findpw.jsp"
													width="600px" height="600px" frameborder="0"> </iframe>
											</div>
										</div>
										<div class="more-content">
											<div class="primary-center">
												<a href="Signup.jsp" id="link"
													style="text-decoration: none;">Register</a>
											</div>
										</div>
									</div>
									<div class="fot-message">Enjoy various services with the
										'development car' integrated ID.</div>
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