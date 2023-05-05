<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="resource/css/write.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
    String userID = null; 
    if (session.getAttribute("user_id") != null)
    {
        userID = (String)session.getAttribute("user_id");
    }
%>
	<div class="container">
		<div class="row">
			<form method="post" action="WriteAction.jsp">
				<table class="table"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="title" maxlength="30"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="content" maxlength="2000" style="height: 350px"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn" value="글쓰기">
			</form>
		</div>
	</div>

</body>
</html>
