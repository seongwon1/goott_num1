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
<style>
<!--
*{
            margin:0;
            padding:0;
            box-sizing: border-box;
        }
        #container{
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction:column;
            align-items: center;
        }
        #header{
            width: 100%;
            border: 1px solid black;
        }
       #section{
            width: 41%;
            display: flex;
            flex-direction: column;
            align-items: center;
            position:relative;
            top: 25%;
            border: 1px solid #DADADA;
        }
        th,td{
            padding: 10px 5px;
        }
</style>
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
							<th class="table_title">아이디</th>
							<th class="table_writer">이름</th>
							<th class="table_regdate">회원 상태</th>
							<th class="table_regdate">등급</th>
							<th class="table_regdate">정지 해제일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="row" items="${userList}">
							<tr>
								<td class="table_cate"><a
									href="/admin/userDetail?user_id=${row.user_id}">${row.user_id}</a></td>
								<td class="table_title">${row.user_name}</td>
								<td>
								<c:choose>
										<c:when test="${row.del_YN == 'N'}">
											 <span style="color:crimson;">탈퇴</span>
										</c:when>
										<c:when test="${row.authority == 'ROLE_PAUSE'}">
											<span style="color:blue">정지</span>
										</c:when>
										<c:otherwise>
									 		<span style="color:green">정상</span>
									 	</c:otherwise>	
									</c:choose>
									</td>
								<td class="table_writer">${row.authority == 'ROLE_USER' ? "일반 회원" : "**관리자**"}</td>
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