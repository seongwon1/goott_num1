<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body{
    
}

a{
    text-decoration: none;
    color: black;
}
.top-menu{
    height: 5%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.logo{
    width: 100%;
    flex-grow: 1;
}

.logo img{
    height: 100px;
    margin-left: 50px;
    padding: 15px;
}
.regist{
    width: 100%;
    flex-grow: 1;
    text-align: right;
    margin-right: 50px;
    font-weight: bold;
    font-size: 1.5rem;
}
</style>
<body>
	    <div class="top-menu">
            <div class="logo"><img src="${path}/resources/image/logo.png" alt=""></div>
            <div class="regist"> <a href="/login">로그인</a></div>
        </div>
</body>
</html>