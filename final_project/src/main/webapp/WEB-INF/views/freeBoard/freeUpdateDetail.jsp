<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DreamDream 자유게시판</title>
<link rel="shortcut icon" href="${path}/resources/image/siteLogopavi.ico">
</head>
<style>
#modifyDiv{
	width: 30%;
	margin-top : 10px;
	display: flex;
	justify-content: flex-start;
}
textarea {
	margin-top : 10px;
}
.updateBtn{
	width: 50px;
	height: 20px;
	margin-right: 10px;
	border: 1px solid rgba(207 207 207);
	background-color: #fff;
	cursor: pointer;
}

</style>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


var btnUpdate = document.querySelector('#btnReplyUpdate');
var closeUpdate = document.querySelector('#btnReplyClose');

closeUpdate.addEventListener('click',function(){
	$('.modifyReply').css("display","none");
	replyListInit();
});

btnUpdate.addEventListener('click',function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
	let content = document.querySelector('#detail_replytext').value;
	$.ajax({
		type:"POST",
		url:"/board/reply/update/${dto.replyId}",
		headers:{"Content-Type":"application/json;charset=UTF-8"},
		data:JSON.stringify({content:content}),
		dataType:"text",
		success:function(result){

				alert('수정완료');
				$('#modifyReply').css("display","none");
				replyListInit();
				
			}
		});
	});

</script>
</head>
<body>
	<textarea id="detail_replytext" rows="5" cols="110" style="resize: none; padding:10px; font-size:0.8rem">${dto.content}</textarea>
	<div id="modifyDiv" style="text-align: center;">
		<button class="updateBtn" id="btnReplyUpdate">수정</button>
		<button class="updateBtn" id="btnReplyClose">닫기</button>
	</div>

</body>
</html>