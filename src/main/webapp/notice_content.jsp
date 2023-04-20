<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="DB.db_con"%>
<%@ page import="Board.boarder"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="bbs" class="Board.boarder" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="resource/css/notice_con.css">
<title>개발차 : 공지</title>
</head>
<body>
	<%
	 // ID 체크 
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	Integer MASTER_ = (Integer)session.getAttribute("master");
	
	// SEQ 해당게시글 번호 찾기
		int seq = 0;
		if(request.getParameter("seq")!= null){
			seq = Integer.parseInt(request.getParameter("seq"));
		}
		// 해당 번호에 맞는 게시글 정보 가져오기 
		boarder con = new db_con().getboarder(seq);
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
	<div class="container">
		<div class="row">
			<div class="title">
				<h1>
					제목 :
					<%= con.getTitle() %></h1>
			</div>
			<div class="sub">
				작성자 :
				<%=con.getUser_id() %><span>시간 : <%= con.getRegdate().substring(5,10) +"일"+ con.getRegdate().substring(11,13)+"시" %></span>
			</div>
			<div class="content"><%=con.getContent() %></div>

		</div>
	</div>
</body>
</html>