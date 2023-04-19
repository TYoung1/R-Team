<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resource/css/find.css">
<title>Insert title here</title>
</head>

<body>
   <div class="main">
      <div class="content">
         <h1>
            <a href="#"><span>개발</span>차</a>
         </h1>

         <form method="post" action="findidForm">
            <input type="text" placeholder="이름입력" name=user_name> <input
               type="text" placeholder="생년월일 6자리"> <input type="text"
               placeholder="성별입력">
            <button type="submit">아이디 찾기</button>
         </form>
      </div>
      <div class="inner" id="innerText">
         <%
         Object ID_ = session.getAttribute("user_id");
         String ID_value = (String) ID_;
         %>
         <%
         if (ID_ != null) {
         %>
         <div>
            <%
            out.println("회원 아이디 : " + ID_value);
            %>
         </div>
         <%
         } else {
         %>
         <div></div>
         <%
         }
         session.removeAttribute("user_id");
         %>
      </div>
   </div>
</body>
</html>