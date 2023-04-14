<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Board.*"%>
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
<link rel="stylesheet" href="resource/css/noticehome.css">
<title>메인페이지</title>
</head>
<body>
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("user_id") != null)
    {
        userID = (String)session.getAttribute("user_id");
    }
    int pageNum = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
   // if (request.getParameter("pageNum") != null)
    //{
     //   pageNum = Integer.parseInt(request.getParameter("pageNum"));
    // }
   
    
%>
<div class="container">
<div class="row">
	<table>
	<thead>
		<tr>
			<th style="background-color:#eeeeee;text-align:center;">번호</th>
			<th style="background-color:#eeeeee;text-align:center;">제목</th>
			<th style="background-color:#eeeeee;text-align:center;">작성자</th>
			<th style="background-color:#eeeeee;text-align:center;">작성일</th>
		</tr>
	</thead>
	<tbody>
	<%
           db_con bcon = new db_con();
			ArrayList<boarder> list = bcon.getList(pageNum);
           for(int i = 0; i < list.size(); i++)
          {
     %>
	<tr>
	<td><%= list.get(i).getSeq() %></td>
	<td><a href="notice_content.jsp?seq=<%=list.get(i).getSeq() %>"><%= list.get(i).getTitle() %></a></td>
	<td><%= list.get(i).getUser_id() %></td>
	<td><%= list.get(i).getRegdate().substring(5,10) +"일 "+ list.get(i).getRegdate().substring(11,13)+"시" %></td>
	</tr>
	<%
                    }
                %>
	</tbody>
	</table>
	
	<ul style="list-style:none;">
	<% 
		int dp1 = 1;
		int dp2 = 5;
		int lastpage=0;
		int count =  bcon.countNotice(); 
		if(count% 10 !=0 ){
			lastpage = count/10+1;
		}else{
			lastpage = count/10;
		}
		for(pageNum = dp1; pageNum<=dp2;pageNum++){
 	%>
 	<li><a href="notice_h.jsp?npage=<%=pageNum %>"><%= pageNum  %></a></li>
	<%
		}	
	%>
	</ul>
</div>
</div>
</body>
</html>