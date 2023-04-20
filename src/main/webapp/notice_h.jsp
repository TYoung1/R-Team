<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Board.*"%>
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
<link rel="stylesheet" href="resource/css/noticehome.css">
<title>개발차 : 공지</title>
</head>
<body>
	<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	Integer MASTER_ = (Integer)session.getAttribute("master");
    int pag = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("npage") != null)
    {
       pag = Integer.parseInt(request.getParameter("npage"));
     }   
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
			<table>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
           db_con bcon = new db_con();
			ArrayList<boarder> list = bcon.getList(pag);
           for(int i = 0; i < list.size(); i++)
          {
     %>
					<tr>
						<td><%= list.get(i).getSeq() %></td>
						<td><a
							href="notice_content.jsp?seq=<%=list.get(i).getSeq() %>"><%= list.get(i).getTitle() %></a></td>
						<td><%= list.get(i).getUser_id() %></td>
						<td><%= list.get(i).getRegdate().substring(5,10) +"일 "+ list.get(i).getRegdate().substring(11,13)+"시" %></td>
					</tr>
					<%
                    }
                %>
				</tbody>
			</table>
			<!-- 관리자 계정일 경우에만 공지쓰기 버튼 활성화 -->
			<% if(ID_ == null) {
		
		}
		else if(MASTER_ != 0){
			%>
			<button onClick="location.href='Write.jsp'">공지쓰기</button>
			<% 
		}
			%>
			<div class="page">
				<ul style="list-style: none;">
					<% 
			int dp1 = 1;
			int dp2 = 5;
			int lastpage=0;
			// 전체 게시글 카운트 개수 
			int count =  bcon.countNotice(); 
			// 한페이지에 10개 표시 한다는 전제하에 10의배수보다 많으면 마지막페이지 +1
			if(count% 10 !=0 ){
				lastpage = count/10+1;
			}else{
				lastpage = count/10;
				
			}
			for(int pageNum = dp1; pageNum<=lastpage;pageNum++){
	 	%>
					<li><a href="notice_h.jsp?npage=<%=pageNum %>"><%= pageNum  %></a></li>
					<%
			}	
		%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>