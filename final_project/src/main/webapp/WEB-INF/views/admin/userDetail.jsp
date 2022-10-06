<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form" method="POST" id="actionForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div>
		<p>아이디: <c:out value="${user.user_id}"/></p>
		<p>이름: <c:out value="${user.user_name}"/></p>
		<p>상태: <c:out value="${user.authority == 'ROLE_PAUSE' ? '정지' : '정상'}"/></p>
		<p>정지 해제일: <input type="text" value="${user.pause_date}" name="count"/>
		<input  type="button" id="pauseBtn" onclick="doSubmit(this.id)" value="정지 적용"></p>
		 <p><input type="button" id="userDelBtn" onclick="doSubmit(this.id)" value="회원 삭제"></p>
	</div>
	<input type="hidden" value="${user.user_id}" name="user_id"/>
</form>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	function doSubmit(id) {
		debugger;
		if (id == "pauseBtn") {
			document.querySelector('#actionForm').action = "/admin/pause";
			document.querySelector('#actionForm').submit();
		} else {
			document.querySelector('#actionForm').action = "/admin/userDel";
			document.querySelector('#actionForm').submit();
		}
	}

	$(document).ready(function() {

	})
</script>
</html>