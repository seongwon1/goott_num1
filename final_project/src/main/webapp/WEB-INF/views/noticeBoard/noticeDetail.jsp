<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/freeDetailStyle.css?var=1" rel="stylesheet" type="text/css">
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/js/magnify.js"></script>
<script src="${path}/resources/js/script.js"></script>
<script src="${path}/resources/js/html2canvas.js"></script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="header">
            <div>
                <p><a href="/main">로고</a></p>
                <span>상세보기</span>
        	
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
				<a href="/board/noticeList">목록</a>
			</div>
			
			<div>
				<a href="/board/merge/noticedelete?nboard_id=${data.nboard_id}">글 삭제</a>
			</div>
			
			<div>
				<a href="/board/merge/noticeUpdate?nboard_id=${data.nboard_id}">글 수정</a>
			</div>
			첨부파일 : <a href="/board/merge/noticeBoardFileDownload.do?fileName=${data.file_name}">${data.file_name}</a>
		
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
						<div id="modifyReply"></div>
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

	<input type="hidden" value="${data.nboard_id}"/>

	<input type="hidden" value="${data.nboard_id}"/>
</body>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>	
<script>
////////////////////////////////////////////////////
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
///////////////////////////////////////////////

const cri = {
		nboard_id : '${data.nboard_id}',
		pageNum : 1,
		amount : 5
}

$(document).ready(function(){
	const nboard_id = '${data.nboard_id}';
	
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	});
	$.ajax({
		type:'GET',
		url:'/board/noticeReplyList',
		dataType:'JSON',
		data:{
			nboard_id :nboard_id,
			pageNum : 1,
			amount : 5,
		},
		success:function(obj){
			makeReplyContent(obj);
			$(document).on('click', '.update_reply_btn', function(e){
				showModify(obj.replyId);
				
			});
			
		}
	})
		
});

$(".insert").on("click", function(e){
	const nboard_id = '${data.nboard_id}'
	const userID = $('#reply_ID').val();
	const content = $("textarea").val();
	
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
		});
	
	$.ajax({
		type:'POST',
		url:'/board/noticeReplyInsert',
		data:{
			user_id:userID,
			content:content,
			nboard_id:nboard_id
		},
		success:function(data){
			console.log(data);
			 window.open('','_self').close(); 
		},
		error: function (request, status, error) {
			console.log("code: " + request.status)
			console.log("message: " + request.responseText)
			console.log("error: " + error);
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	})
	
});
$(document).on('click','.delete_reply_btn',function(e){
	e.preventDefault();
	let replyId = $(this).attr("href");	
	$.ajax({
		data : {
			replyId : replyId,
			nboard_id : '${data.nboard_id}'
		},
		url : '/board/noticeReplyDelete',
		type : 'POST',
		success : function(result){
			alert('삭제가 완료되엇습니다.');
			replyListInit();
		}
	});	
})

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
		let nboard_id = '${data.nboard_id}'
		let reply_list = '';			
		$(list).each(function(i,obj){
			
			reply_list += '<li>';
			reply_list += '<div class="comment_wrap">';
			reply_list += '<div class="reply_top">';
			reply_list += '<span class="id_span">'+ obj.user_id+'</span>';
			reply_list += '<span class="date_span" style="margin-left:50px">'+ obj.regDate +'</span>';
			reply_list += '<button class="update_reply_btn" onclick=showModify()>수정</button><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
			reply_list += '</div>'; 
			reply_list += '<div class="reply_bottom">';
			reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
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

$(document).on('click', '.pageMaker_btn a', function(e){
	e.preventDefault();
	
	let page = $(this).attr("href");	
	cri.pageNum = page;		
	
	
	replyListInit();
		
 });

let replyListInit = function(){
	$.getJSON("/board/noticeReplyList", cri , function(obj){
		
		makeReplyContent(obj);
		
	});		
}


</script>
</html>