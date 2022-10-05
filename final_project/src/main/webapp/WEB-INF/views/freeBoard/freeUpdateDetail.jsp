<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
let btnUpdate = document.querySelector('#btnReplyUpdate');
btnUpdate.addEventListener('click',function(){
	let content = document.querySelector('#detail_replytext').value;
	$.ajax({
		type:"POST",
		url:"/noticeReply/noticeUpdate/${dto.replyId}",
		headers:{"Content-Type":"application/json;charset=UTF-8"},
		data:JSON.stringify({content:content}),
		dataType:"text",
		success:function(result){
			if(result == "success"){
				console.log(result)
				alert('수정완료');
				$('#modifyReply').css("visivility","hidden");
				makeReplyContent(obj)
			}
		}
	});
});
</script>
</head>
<body>
	<textarea id="detail_replytext">${dto.content}</textarea>
	<div style="text-align: center;">
			<button id="btnReplyUpdate">수정</button>
		<button id="btnReplyClose">닫기</button>
	</div>
</body>
</html>