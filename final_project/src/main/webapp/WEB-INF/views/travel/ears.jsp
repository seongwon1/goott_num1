<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style.css?var=1" rel="stylesheet" type="text/css">
  <script src="resources/js/jquery-3.6.0.min.js"></script>
  <script src="resources/js/script.js"></script>
  <script src="resources/js/magnify.js"></script>
  <script src="resources/js/html2canvas.js"></script>
	<title>Home</title>
</head>

<body>
<div id="wrap">
   <!-- 컨테이너 -->
    <div id="container">
        <!-- 헤더 -->
        <div id="header">
            <div>
        		<p><a href="/">로고</a></p>
        		
        		<ul>
        			<li>로그인</li>
        			<li><a href="/freeList">커뮤니티 링크</a></li>
        		</ul>
        	</div>
        </div>
        
        <div id="a11yMenu" class="a11y_menu" aria-label="접근성메뉴">
			<h2 class="blind">접근성메뉴<span><i class="fa-solid fa-x"></i></span></h2>
        	
        	<ul>
        		<li class="a11y_invert"><button id="setInvert" aria-pressed="false"><span>색상반전</span></button></li>
				<li class="a11y_zoomin"><button id="setZoomin"><span>확대</span></button></li>
				<li class="a11y_zoomout"><button id="setZoomout"><span>축소</span></button></li>
				<li class="a11y_magnify"><button id="setMagnify" aria-pressed="false"><span>돋보기</span></button></li>
			</ul>
			
			<dl aria-live="polite"></dl> 
		</div>	
        <!-- 카테고리선텍 div -->
        <div id="category">
            <div class="category_Con">
                <div class="category_Ele cateEle_1">
                    <input type="radio" name="type" id="radio1" class="radio">
                    
                    <label for="radio1" class="label1">
                        <i class="fa-solid fa-wheelchair"></i>
                        <span>지체장애</span>
                    </label>
                </div>

                <div class="category_Ele cateEle_2">
                    <input type="radio" name="type" id="radio2"class="radio">
                    
                    <label for="radio2" class="label1">
                        <i class="fa-solid fa-ear-deaf" style="color:#000;"></i>
                        
                        <span style="color:#000; border-bottom: 3px solid #000;">청각장애</span>
                    </label>
                </div>

                <div class="category_Ele cateEle_3">
                    <input type="radio" name="type" id="radio3"class="radio">
                    
                    <label for="radio3" class="label1">
                        <i class="fa-solid fa-eye-low-vision"></i>
                        
                        <span>시각장애</span>
                    </label>
                </div>
            </div>
			<!-- 카테고리 bar -->
            <div class="category_Bar"></div>
			<!-- 카테고리 선택 -->
            <div class="category_Con2">
				<ul class="category_Con2_ul">
					<li class='category_Ele2'>
                    	<button value="parking" name="type" class= "btnActive ${pageMaker.cri.type eq 'parking'?'active':'' }" ><i class="fa-solid fa-square-parking"></i>주차안내</button>
                    </li>
				
                    <li class='category_Ele2'>
                    	<button value="signguide" name="type" class= "btnActive ${pageMaker.cri.type eq 'signguide'?'active':'' }" ><i class="fa-solid fa-clipboard"></i>수화안내</button>
                    </li>
                    	
                    <li class='category_Ele2'>
                    	<button value="videoguide" name="type" class= "btnActive ${pageMaker.cri.type eq 'videoguide'?'active':'' }" ><i class="fa-solid fa-desktop"></i>영상자막안내</button>
                    </li>
                    	
                   	<li class='category_Ele2'>
                   		<button value="guidehuman" name="type" class= "btnActive ${pageMaker.cri.type eq 'guidehuman'?'active':'' }" ><i class="fa-solid fa-user"></i>안내요원</button>
                   	</li>   	
				</ul>
			<!-- 지역 select box --> 
			<div class="category_area">
				<p>지역선택</p>
					<div class="form">
                        <select name="keyword" id="sido1">
                        	<option value="시/도" <c:out value="${pageMaker.cri.keyword == null?'selected':'' }"/>>시/도 선택</option>
                			<option value="서울특별시" <c:out value="${pageMaker.cri.keyword eq '서울특별시'?'selected':'' }"/>>서울특별시</option>
                			<option value="인천광역시" <c:out value="${pageMaker.cri.keyword eq '인천광역시'?'selected':'' }"/>>인천광역시</option>
                			<option value="대전광역시" <c:out value="${pageMaker.cri.keyword eq '대전광역시'?'selected':'' }"/>>대전광역시</option>
                			<option value="광주광역시" <c:out value="${pageMaker.cri.keyword eq '광주광역시'?'selected':'' }"/>>광주광역시</option>
                			<option value="대구광역시" <c:out value="${pageMaker.cri.keyword eq '대구광역시'?'selected':'' }"/>>대구광역시</option>
                			<option value="울산광역시" <c:out value="${pageMaker.cri.keyword eq '울산광역시'?'selected':'' }"/>>울산광역시</option>
                			<option value="부산광역시" <c:out value="${pageMaker.cri.keyword eq '부산광역시'?'selected':'' }"/>>부산광역시</option>
                			<option value="경기도" <c:out value="${pageMaker.cri.keyword eq '경기도'?'selected':'' }"/>>경기도</option>
                			<option value="강원도" <c:out value="${pageMaker.cri.keyword eq '강원도'?'selected':'' }"/>>강원도</option>
                			<option value="충청북도" <c:out value="${pageMaker.cri.keyword eq '충청북도'?'selected':'' }"/>>충청북도</option>
                			<option value="충청남도" <c:out value="${pageMaker.cri.keyword eq '충청남도'?'selected':'' }"/>>충청남도</option>
                			<option value="전라북도" <c:out value="${pageMaker.cri.keyword eq '전라북도'?'selected':'' }"/>>전라북도</option>
                			<option value="전라남도" <c:out value="${pageMaker.cri.keyword eq '전라남도'?'selected':'' }"/>>전라남도</option>
                			<option value="경상북도" <c:out value="${pageMaker.cri.keyword eq '경상북도'?'selected':'' }"/>>경상북도</option>
                			<option value="경상남도" <c:out value="${pageMaker.cri.keyword eq '경상남도'?'selected':'' }"/>>경상남도</option>
                			<option value="제주도" <c:out value="${pageMaker.cri.keyword eq '제주도'?'selected':'' }"/>>제주도</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <!-- section 시작 -->   
        <div id="section">
        	<c:forEach items="${earsList}" var="earsList" varStatus="vs">
                <div class="section_Con">
                	<!-- 이미지 -->
                	<span class="section_Ele_Img">
                		<img src="${earsList.firstimage}">
                	</span>
                	<!-- 정보창 -->
                	<div class="section_Ele_Cont">
                		<ul class="section_Ele_cont_Ul1">
                			<li style="font-size:1.4rem; color:#1A1A1A; font-weight:700;"><c:out value="${earsList.location_name}"></c:out></li>
                			<li style="colir:#5D5E5D"><c:out value="${earsList.address} "></c:out></li>
                		</ul>
                		<!-- section_Ele bar -->
                		<span class="section_Ele_cont_bar"></span>
                		<!-- 정보창 아이콘 -->
                		<ul class="section_Ele_cont_Ul2">
                			<c:set var="earsList1" value="${earsList}" />
                				<c:if test="${earsList1.parking != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-square-parking"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${earsList1.guidehuman != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-user"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${earsList1.signguide != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-clipboard"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${earsList1.videoguide != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-desktop"></i>
                					</li>
                				</c:if>

	                	</ul>  
                		<!-- 정보상세 -->
                		<ul class="section_Ele_Cont_Detail" id="section_Ele_Cont_Detail${vs.index}">
                			<c:if test="${earsList1.parking != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.parking}</span>
                				</li>		
                			</c:if>
                				
                			<c:if test="${earsList1.guidehuman != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.guidehuman}</span>
               					</li>  					
               				</c:if>
                				
                			<c:if test="${earsList1.signguide != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.signguide}</span>
                				</li>					
							</c:if>
                				
                			<c:if test="${earsList1.videoguide != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${earsList1.videoguide}</span>
                				</li>					
                			</c:if>
                		</ul>             	
                	</div>
                </div>			
			</c:forEach>
        </div>
		<!-- 페이징 -->
        <div class="section_Page">
            <ul class="pageInfoEars" id="pageInfoEars">
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">이전</a></li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num? 'active':''}"><a href="${num}">${num}</a></li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">다음</a></li>
                </c:if>
            </ul>
        </div>
         <!-- form -->
        <form id="moveForm" method="GET">
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        	<input type="hidden" name="type" value="${pageMaker.cri.type}">  	
        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        </form>
        <!-- footer -->
        <div id="footer">

        </div>

    </div>
     <!-- container -->
	<div id="magnifyImg" class="magnify_area">
		<div id="magnifyLense" class="magnify_lense"></div>
	</div>
</div>
<!-- wrap -->
</body>
<script>


let moveForm = $("#moveForm");
let cateEle_1 = document.querySelector('.cateEle_1');
let cateEle_2 = document.querySelector('.cateEle_2');
let cateEle_3 = document.querySelector('.cateEle_3');
let cateUl = document.querySelector('.category_Con2_ul');
let cateCon2 = document.querySelector('.category_Con2');
	$('.pageInfoEars a').on('click', function(e){  
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/ears");
		moveForm.submit();
	});
  
	
	$('#radio1').on('click', function(e) {
		e.preventDefault();
		moveForm.attr("action", "/leg");
		moveForm.find("input[name='type']").val("");
		moveForm.find("input[name='keyword']").val("");
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();

	})
	$('#radio2').on('click', function(e) {
		e.preventDefault();
		moveForm.attr("action", "/ears");
		moveForm.find("input[name='type']").val("");
		moveForm.find("input[name='keyword']").val("");
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();

	})

	$('#radio3').on('click', function(e) {
		e.preventDefault();
		moveForm.attr("action", "/eye");
		moveForm.find("input[name='type']").val("");
		moveForm.find("input[name='keyword']").val("");
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();

	})

	$('.btnActive').on('click', function(e) {
		e.preventDefault();
		let type = $(this).val();
		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	})

	$('#sido1').on('change', function(e) {
		e.preventDefault();
		let keyword = $('#sido1').val();
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		if(moveForm.find("input[name='keyword']").val() == '시/도'){
			moveForm.find("input[name='keyword']").val("");
		}
		moveForm.submit();

	})
</script>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
</html>