<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="deleteForm">
		<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	%>
		<input type="text" name="User_id" >
		<button type="submit" onClick="location.href='Logout.jsp'">네</button>
		<a href="Logout.jsp">아니오</a>
	</form>
</body>
<script language="javascript">
	function movehome() {
		response.sendRedirect("Home.jsp");
	}
</script>
</html>