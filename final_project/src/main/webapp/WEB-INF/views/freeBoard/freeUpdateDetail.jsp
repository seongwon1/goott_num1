<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


let btnUpdate = document.querySelector('#btnReplyUpdate');
let closeUpdate = document.querySelector('#btnReplyClose');

btnUpdate.addEventListener('click',function(){
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
	let content = document.querySelector('#detail_replytext').value;
	$.ajax({
		type:"POST",
		url:"/reply/update/${dto.replyId}",
		headers:{"Content-Type":"application/json;charset=UTF-8"},
		data:JSON.stringify({content:content}),
		dataType:"text",
		success:function(result){
			if(result == "success"){
				alert('수정완료');
				$('#modifyReply').css("visibility","hidden");
				
			}
		}
	});
});

</script>
</head>
<body>
		<div id="reply_InsertWrap">
			<div id="reply_InsertCon">
				<div id="reply_title">
					<p>댓글</p>
				</div>
				<div id="reply_Content">
					<div>${dto.content}</div>
				</div>
				<div id="reply_userID">
					<input type="text" name="reply_ID" id="reply_ID">
				</div>
				<div id="reply_Content2">
					<textarea id="detail_replytext" rows="5" cols="116" style="resize: none">${dto.content}</textarea>
				</div>
				<div id="replyBtn">
					<button class="replyBtnEle modify">댓글 수정</button>
					<button class="replyBtnEle insert">댓글 작성</button>
					<button class="replyBtnEle close">취소</button>
				</div>
			</div>
		</div>
		
		
	<div id="modifyDiv" style="text-align: center;">
		<button class="updateBtn" id="btnReplyUpdate">수정</button>
		<button class="updateBtn" id="btnReplyClose">닫기</button>
	</div>
</body>
</html>