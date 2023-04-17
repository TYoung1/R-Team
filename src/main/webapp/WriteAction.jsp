	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DB.db_con" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="bbs" class="Board.boarder"/>	
<jsp:setProperty name="bbs" property="title" />
<jsp:setProperty name="bbs" property="content" />	
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판 웹사이트</title>
</head>
<body>
    <%
        String userID = null;
        // 로그인 된 사람은 로그인 정보 담기
        if(session.getAttribute("user_id") != null )
        {
            userID = (String) session.getAttribute("user_id");
        }
        if(userID == null)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'Login.jsp'");
            script.println("</script>");
        } else {
        if(bbs.getTitle() == null || bbs.getContent() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            db_con db_con = new db_con();
            int result = db_con.write(bbs.getTitle(),bbs.getContent(), userID);
                if(result == -1){ // 글쓰기에 실패했을 경우
                    PrintWriter script = response.getWriter(); 
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }
                else { // 글쓰기에 성공했을 경우
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href= 'notice_h.jsp'");
                    script.println("</script>");
                    }
            }
        }
    %>
</body>
</html> 
