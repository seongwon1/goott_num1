<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/freeDetailStyle.css?var=1" rel="stylesheet" type="text/css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/magnify.js"></script>
<script src="resources/js/script.js"></script>
<script src="resources/js/html2canvas.js"></script>
</head>
<style>

  
</style>
<body>
<div id="wrap">
	<div id="container">
		<div id="header">
            <div>
                <p><a href="/">로고</a></p>
                <span>상세보기</span>
        	
                <ul>
        		    <li>로그인</li>
        		    <li><a href="/freeList">커뮤니티 링크</a></li>
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
        		<div class="section_Con_Ele1">
        			<div>${data.category}</div>
        			<div>${data.title}</div>
        		</div>
        		
        		<div class="section_Con_Ele2">
        			<div>${data.user_id}</div>
        			<fmt:parseDate value="${data.regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" 
						var="date1" type="both" />
					<div>작성일자 : <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /></div>
        		</div>
        	
        		<div class="section_Con_Ele3">
        			<div>${data.content}</div>
        		</div>
        	</div>
        </div>
       
		<div id="article2">
			<div>
				<a href="/freeList">목록</a>
			</div>
			
			<div>
				<a href="/freeDelete?free_board_id=${data.free_board_id}">글 삭제</a>
			</div>
			
			<div>
				<a href="/freeUpdate?free_board_id=${data.free_board_id}">글 수정</a>
			</div>
			
			<div id="reply_Modal">
				<button>댓글작성</button>
			</div>
		</div>
		
		<div id="reply_ListCon">
		
		
		</div>
		
		<div id="reply_InsertWrap">
			<div id="reply_InsertCon">
				<div id="reply_title">
					<p>댓글</p>
				</div>
				<div id="reply_Content">
					<div>${data.content}</div>
				</div>
				<div id="reply_userID">
					<input type="text" name="reply_ID" id="reply_ID">
				</div>
				<div id="reply_Content2">
					<textarea rows="5" cols="116" placeholder="내용"></textarea>
				</div>
				<div id="replyBtn">
					<button class="replyBtnEle modify">댓글 수정</button>
					<button class="replyBtnEle insert">댓글 작성</button>
					<button class="replyBtnEle close">취소</button>
				</div>
			</div>
		</div>
		<div class="reply_not_div"></div>
		<ul class="reply_content_ul">
			<li>
				<div class="comment_wrap">
					<div class="reply_top">
						<span class="id_span"></span>
						<span class="date_span"></span>
						<a class="update_reply_btn">수정</a>
						<a class="delete_reply_btn">삭제</a>
					</div>
					<div class="reply_bottom">
						<div class="reply_bottom_txt"></div>
					</div>	
				</div>
			</li>
		</ul>
			<div class="repy_pageInfo_div">
				<ul class="pageMaker">
				</ul>
			</div>
        <div id="footer">

        </div>
	</div>
</div>	
    <div id="magnifyImg" class="magnify_area">
        <div id="magnifyLense" class="magnify_lense"></div>
	</div>

	<input type="hidden" value="${data.free_board_id}"/>
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>	

<script>
const cri = {
		free_board_id : '${data.free_board_id}',
		pageNum : 1,
		amount : 5
}

$(document).ready(function(){
	const free_board_id = '${data.free_board_id}';

	$.ajax({
		type:'GET',
		url:'replyList',
		dataType:'JSON',
		data:{
			free_board_id:free_board_id,
			pageNum : 1,
			amount : 5,
		},
		success:function(obj){
			makeReplyContent(obj);
			
			
		}
	})
		
});
$(document).on('click', '.delete_reply_btn', function(e){
	e.preventDefault();
	let replyId = $(this).attr("href");	
	
	$.ajax({
		data : {
			replyId : replyId,
			free_board_id : '${data.free_board_id}'
		},
		url : '/replyDelete',
		type : 'POST',
		success : function(result){
			replyListInit();
			alert('삭제가 완료되엇습니다.');
		}
	});		
		
 });	
function updateBtn(replyId,user_id){
	$.ajax({
		url:"reply/detail/"+replyId,
		success:function(result){
			$('#modifyReply').html(result);
		}
	});
}

$(".insert").on("click", function(e){
	const free_board_id = '${data.free_board_id}'
	const userID = $('#reply_ID').val();
	const content = $("textarea").val();
	$.ajax({
		type:'POST',
		url:'replyInsert',
		data:{
			user_id:userID,
			content:content,
			free_board_id:free_board_id
		},
		success:function(data){
			  window.close();
		},
		error: function (request, status, error) {
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
	
});

$(document).on('click', '.pageMaker_btn a', function(e){
	e.preventDefault();
	
	let page = $(this).attr("href");	
	cri.pageNum = page;		
	
	
	replyListInit();
		
 });
let replyListInit = function(){
	$.getJSON("replyList", cri , function(obj){
		
		makeReplyContent(obj);
		
	});		
}


function makeReplyContent(obj){
	
	if(obj.list.length === 0){
		$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
		$(".reply_content_ul").html('');
		$(".pageMaker").html('');
	}
	else{
		$(".reply_not_div").html('');
		let list = obj.list;
		let pf = obj.pageInfo;
		let free_board_id = '${data.free_board_id}'
		let reply_list = '';			
		$(list).each(function(i,obj){
			console.log(obj)
			reply_list += '<li>';
			reply_list += '<div class="comment_wrap">';
			reply_list += '<div class="reply_top">';
			reply_list += '<span class="id_span">'+ obj.user_id+'</span>';
			reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
			reply_list += '<button class="update_reply_btn" onclick=updateBtn('+obj.replyId + ',\''+ obj.user_id + ',\')>수정</button><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
			reply_list += '</div>'; 
			reply_list += '<div class="reply_bottom">';
			reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
			reply_list += '<div id="modifyReply"></div>'
			reply_list += '</div>';
			reply_list += '</div>';
			reply_list += '</li>';
		});		
		
		$(".reply_content_ul").html(reply_list);			
		let reply_pageMaker = '';
		if(pf.prev){
			let prev_num = pf.startPage -1;
			reply_pageMaker += '<li class="pageMaker_btn prev">';
			reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
			reply_pageMaker += '</li>';	
		}
		for(let i = pf.startPage; i < pf.endPage+1; i++){
			reply_pageMaker += '<li class="pageMaker_btn ';
			if(pf.cri.pageNum === i){
				reply_pageMaker += 'active';
			}
			reply_pageMaker += '">';
			reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
			reply_pageMaker += '</li>';
		}
		if(pf.next){
			let next_num = pf.endPage +1;
			reply_pageMaker += '<li class="pageMaker_btn next">';
			reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
			reply_pageMaker += '</li>';	
		}	
		
		
	$(".pageMaker").html(reply_pageMaker);			
	
	};

};




</script>
</html>