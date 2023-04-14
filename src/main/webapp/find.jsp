<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.search_id {
	text-align: center;
}
</style>

<body>
	<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	Object PW_ = session.getAttribute("user_pw");
	String PW_value = (String) PW_;
	%>

	<div class="search_id" id="inner_text">
		<%
		if (ID_ != null || PW_ != null) {

			if (ID_ == null) {
		%>
		<div>
			<%
			out.println("회원 비밀번호 : " + PW_value);
			%>
		</div>
		<%
		} else {
		%>
		<div>
			<%
			out.println("회원 아이디 : " + ID_value);
			%>
		</div>
		<%
		}
		%>
		<%
		} else {
		%>
		<div>계정이 없거나 입력 정보를 확인해주세요</div>
		<%
		}
		session.removeAttribute("user_id");
		session.removeAttribute("user_pw");
		%>
	</div>
</body>
</html>