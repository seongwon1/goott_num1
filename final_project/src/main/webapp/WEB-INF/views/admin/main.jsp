<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>관리자.</h2>
	<!-- 유저 삭제, 유저 삭제시 로그인 했을 때 알림, 유저 정지, 유저 자동 정지 해제 -->
	<div id="wrap">
		<div id="container">
			<div id="header">
				<div>
					<p>
						<a href="/main">로고</a>
					</p>
				</div>
			</div>

			<div id="section">
				<table>
					<thead>
						<tr>
							<th class="table_no">번호</th>
							<th class="table_title">아이디</th>
							<th class="table_writer">이름</th>
							<th class="table_regdate">회원 상태</th>
							<th class="table_regdate">정지 해제일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="row" items="${userList}">
							<tr>
								<td class="table_no">${row.count}</td>
								<td class="table_cate"><a
									href="/admin/userDetail?user_id=${row.user_id}">${row.user_id}</a></td>
								<td class="table_title">${row.user_name}</td>
								<td class="table_writer">${row.user_state}</td>
								<td class="table_writer">${row.pause_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
	})
</script>
</html>