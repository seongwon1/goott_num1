<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="top-menu">
		<div class="logo">
			<img src="${path}/resources/image/logo.png" alt="">
		</div>
		<div class="regist" id="regist">
			<a href="/login">로그인</a>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {
		if (getCookie()) {
			$("#regist").text("로그아웃")
		}
	})

	function getCookie() {
		var result = false;
		var cookie = document.cookie.split(';');
		cookie.some(function(item) {
			item = item.replace(' ', '');

			var dic = item.split('=');

			if ("JSESSIONID" === dic[0]) {
				result = true;
				return true; // break;
			}
		});
		return result;
	}
</script>

</html>