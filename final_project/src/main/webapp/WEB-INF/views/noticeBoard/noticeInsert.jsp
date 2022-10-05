<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/freeInsertStyle..css?var=1" rel="stylesheet" type="text/css">
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/js/magnify.js"></script>
<script src="${path}/resources/js/script.js"></script>
<script src="${path}/resources/js/html2canvas.js"></script>
</head>
<script>
	window.onload = function() {
		let title = document.querySelector('#title');
		let content = document.querySelector('#content');
		let user_id = document.querySelector('#user_id');
		let submit = document.querySelector("input[type='button']");
		let form1 = document.querySelector('form'); 
		
		submit.addEventListener('click',function(){
			if(title.value === ""){
				alert('제목을 입력해주세요.');
				title.focus();
				return false;
			};
			if(user_id.value === ""){
				alert('아이디를 입력해주세요.');
				user_id.focus();
				return false;	
			};
			if(content.value === ""){
				alert('내용을 입력해주세요.');
				content.focus();
				return false;	
			};
			form1.action = "/board/merge/noticeInsert?${_csrf.parameterName}=${_csrf.token}";
			form1.submit();
			});
		}
</script>
<body>
<div id="wrap">
	<div id="container">
        <div id="header">
            <div>
                <p><a href="/board/noticeList">로고</a></p>
                <span>글 작성</span>
        	
                <ul>
        		    <li>로그인</li>
        		    <li><a href="/board/noticeList">커뮤니티 링크</a></li>
        	    </ul>
            </div>
        </div>
        
        <div id="a11yMenu" class="a11y_menu" aria-label="접근성메뉴">
			<h2 class="blind">접근성메뉴<span><i class="fa-solid fa-x"></i></span></h2>
        	
        	<ul id="ally_Menu_Ul">
        		<li class="a11y_invert"><button id="setInvert" aria-pressed="false"><span>색상반전</span></button></li>
				<li class="a11y_zoomin"><button id="setZoomin"><span>확대</span></button></li>
				<li class="a11y_zoomout"><button id="setZoomout"><span>축소</span></button></li>
				<li class="a11y_magnify"><button id="setMagnify" aria-pressed="false"><span>돋보기</span></button></li>
			</ul>
			
			<dl aria-live="polite"></dl> 
		</div>
			
        <div id="section">
        	<div id="section_Con">
        		<form id="form1" name="form1" method="POST" enctype="multipart/form-data">
        			<div class="section_Con_Select">
        				<select name="category" id="category">
        					<option>전체</option>
        					<option>시각장애인</option>
        					<option>청각장애인</option>
        					<option>지체장애인</option>
        				</select>
        			</div>

        			<div class="section_Con_Input">
						<input type="text" name="title" id="title" size="80" class="txtInput" placeholder="제목입력">
					</div>
				
					<div class="section_Con_Input">
						<input type="text" id="user_id" class="txtInput" value="${data.user_id}" disabled>
						<input type="hidden" name="user_id" value="${data.user_id}">
					</div>
			
					<div class="section_Con_Input">
						<textarea rows="5" cols="80" id="content" name="content" class="txtInput" placeholder="내용입력" ></textarea>
					</div>
					
					파일 선택 : <input type="file" name="file">
					
					<div id="article2">
						<div>
							<a href="/board/noticeList">글 목록</a>
						</div>
			
						<div>	
							<input type="button" value="작성하기">
						</div>
					</div>
				</form>
        	</div>    
        </div>
        
        <div id="pageNation">
			
        </div>

        <div id="footer">

        </div>
	</div>
</div>	
    <div id="magnifyImg" class="magnify_area">
        <div id="magnifyLense" class="magnify_lense"></div>
	</div>
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
</html>