<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="DB.DB_Conn" %>
    <%@ page import="DataClass.CarData" %>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resource/css/cardetail.css">
    <title>Document</title>
</head>
<body>
<% String id = "";
	if(request.getParameter("carid")!= null){
		id = (String)(request.getParameter("carid"));
	}
	CarData con = new DB_Conn().findDetail(id);
 %>

    <nav>
        <a href="Home.jsp" class="logo"><span>개발</span>차</a>
        
        <ul>
            <li><a href="./Login.jsp">로그인</a></li>
            <li><a href="./Signup.jsp">회원가입</a></li>
        </ul>
    </nav>
    <div class="main">
        <div class="wrapper">
            <div class="title"><h1 class="car_name"></h1><h2 class="car_price">차랑가격 : 만원</h2></div>
            <div class="bigcon">
                <div class="l_con">
                    <img src="<%=con.URL %>" width="100%" height="100%">
                </div>
                <div class="r_con">
                    <div class="people">
                        <h3>박준영 딜러</h3>
                    </div>
                    <div class="info">
                        <div class="car">
                 
                            <ul>
                                <li><h4>차종 : <%=con.TYPE %></h4></li>
                                <li><h4>모델 : <%=con.MODEL %> </h4></li>
                                <li><h4>연료 : <%=con.FUELTYPE %> </h4></li>
                                <li><h4>연식 : <%=con.YEAR %> </h4></li>
                                <li><h4>연비 : <%=con.MPG %> </h4></li>
                            </ul>
                        </div>
                        <div class="accident">
                            <h4>사고이력 : <%= con.ACCIDENT %></h4>
                            <h4></h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn_wrap">
                <button>구매하기</button>
                <button>시승예약하기</button>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer_fot">
            <ul>
                <li>고객 센터</li>
                <li>이용 약관</li>
                <li>개인 정보 처리 방침</li>
                <li>쿠키 설정</li>
                <li>회사 정보</li>
            </ul>
            </div>
            <div class="reserved">
                © 2023. Kim Tae Young , Park Jun Beom. All rights reserved.
            </div>
    </footer>
</body>
</html>