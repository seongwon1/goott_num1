<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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

a {
	text-decoration: none;
	color: black;
}

.header {
	display: flex;
	align-items: center;
}

.header_logo {
	width: 10%;
	display: flex;
	align-items: center;
}

.header_logo img {
	width: 155px;
	height: 150px;
}

.header_menu {
	width: 80%;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
	list-style: none;
	font-size: 1.5rem;
}

.header_menu li {
	padding: 0 30px;
}

.header_regist {
	width: 10%;
	height: 100px;
	line-height: 100px;
	text-align: right;
	margin-right: 50px;
	font-weight: bold;
	font-size: 1.5rem;
}
</style>
<body>
	<div class="header">
		<a class="header_logo"><img
			src="${path}/resources/image/siteLogo.png" alt=""></a>
		<ul class="header_menu">
			<li><a href="/board/travelHome">여행지추천</a></li>
			<li><a href="/board/facilityList">편의시설 조회</a></li>
			<li><a href="/board/card">급식카드 가맹점</a></li>
			<li><a href="/board/freeList">자유게시판</a></li>
			<li><a href="/board/reportBoardList">신고게시판</a></li>
			<li><a href="/board/noticeList">공지사항</a></li>
		</ul>
		<sec:authorize access="isAnonymous()">
			<div class="header_regist">
				<a href="/login">로그인</a>
			</div>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<div class="header_regist">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="/admin/main">관리자 페이지</a>
				</sec:authorize>
				<a href="/login">로그아웃</a>
			</div>
		</sec:authorize>
	</div>
</body>
</html>

<%-- <jsp:include page="../include/menu.jsp"/> --%>
