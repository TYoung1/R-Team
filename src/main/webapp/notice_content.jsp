<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="DB.db_con" %>
<%@ page import="Board.boarder" %>
<%@ page import="java.util.ArrayList" %>
    <jsp:useBean id="bbs" class="Board.boarder"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >
<link rel="stylesheet" href="resource/css/notice_con.css">
<title>공지사항</title>
</head>
<body>
	<%
		String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	    if (session.getAttribute("user_id") != null)
	    {
	        userID = (String)session.getAttribute("user_id");
    	}
		
		int seq = 0;
		if(request.getParameter("seq")!= null){
			seq = Integer.parseInt(request.getParameter("seq"));
		}
		
		boarder con = new db_con().getboarder(seq);
	%>
	<div class="container">
		<div class= "row">
			<div class="title"><h1>제목 : <%= con.getTitle() %></h1></div>
			<div class="sub">작성자 : <%=con.getUser_id() %><span>시간 : <%= con.getRegdate().substring(5,10) +"일"+ con.getRegdate().substring(11,13)+"시" %></span></div>
			<div class = "content"><%=con.getContent() %></div>
			
		</div>
	</div>
</body>
</html>