<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resource/css/find.css">
    <title>Document</title>
</head>

<body>
    <div class="main">
        <div class="content">
            <h1><a href="#"><span>개발</span>차</a></h1>

        <form method="post" action="findpwForm">
            <input type="text" placeholder="아이디를 입력하세요" name=user_id>
            <input type="text" placeholder="이름을 입력하세요" name=user_name>
            <input type="text" placeholder="생년월일 6자리" name=user_birth>
            <input type="text" placeholder="성별입력" name=user_gender>
            <button type="submit">비밀번호 찾기</button>
        </form>
        </div>
    </div>
</body>
</html>