<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
  <link href="resources/css/Travelstyle.css?var=1" rel="stylesheet" type="text/css">
  <script src="resources/js/jquery-3.6.0.min.js"></script>
  <script src="resources/js/magnify.js"></script>
  <script src="resources/js/script.js"></script>
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
        	
        	<ul id="ally_Menu_Ul">
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
                   		<a href="/leg">
                       		<i class="fa-solid fa-wheelchair" style="color:#000;"></i>
                       		<span style="color:#000; border-bottom: 3px solid #000;">지체장애</span>
                   		</a>
                    </label>
                </div>

                <div class="category_Ele cateEle_2">
                    <input type="radio" name="type" id="radio2"class="radio">
                   	<label for="radio2" class="label1">
                    	<a href="/ears">
                        	<i class="fa-solid fa-ear-deaf"></i>
                        
                        	<span>청각장애</span>
                        </a>
                    	</label>
                </div>

                <div class="category_Ele cateEle_3">
                    <input type="radio" name="type" id="radio3"class="radio">
                    
                     <label for="radio3" class="label1">
                    	<a href="/eye">
                        <i class="fa-solid fa-eye-low-vision"></i>
                        
                        <span>시각장애</span>
                        </a>
	                    </label>
                </div>
            </div>
			<!-- 카테고리 bar -->
            <div class="category_Bar"></div>
			<!-- 카테고리 선택 -->
            <div class="category_Con2">
				<ul class="category_Con2_ul">
					<li class='category_Ele2'>
						<button value="parking" name="type" class= "btnActive ${pageMaker.cri.type eq 'parking'?'active':'' }"><i class="fa-solid fa-square-parking section_Ele_Cont_Icon"></i>주차가능 </button>
					</li>
                   	
					<li class='category_Ele2'>
						<button value="transport" name="type" class= "btnActive ${pageMaker.cri.type eq 'transport'?'active':'' }" ><i class="fa-solid fa-stairs section_Ele_Cont_Icon"></i>경사로</button>
					</li>                    	
						
					<li class='category_Ele2'>
						<button value="wheelchair" name="type" class= "btnActive ${pageMaker.cri.type eq 'wheelchair'?'active':'' }" ><i class="fa-solid fa-wheelchair section_Ele_Cont_Icon"></i>휠체어</button>
					</li>
                   	
					<li class='category_Ele2'>
						<button value="elevator" name="type" class= "btnActive ${pageMaker.cri.type eq 'elevator'?'active':'' }" ><i class="fa-solid fa-elevator section_Ele_Cont_Icon"></i>엘리베이터</button>
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
        	<c:forEach items="${legList}" var="legList" varStatus="vs">
                <div class="section_Con">
                	<!-- 이미지 -->
                	<span class="section_Ele_Img">
                		<img src="${legList.firstimage}">
                	</span>
                	<!-- 정보창 -->
                	<div class="section_Ele_Cont">
                		<ul class="section_Ele_cont_Ul1">
                			<li style="font-size:1.4rem; color:#1A1A1A; font-weight:700;"><c:out value="${legList.location_name}"></c:out></li>                			
                			
                			<li style="colir:#5D5E5D"><c:out value="${legList.address} "></c:out></li>
                		</ul>
                		<!-- section_Ele bar -->
                		<span class="section_Ele_cont_bar"></span>
                		<!-- 정보창 아이콘 -->
                		<ul class="section_Ele_cont_Ul2">
                			<c:set var="legList1" value="${legList}" />
                				<c:if test="${legList1.parking != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-square-parking section_Ele_Cont_Icon"></i>
                					</li>	
                				</c:if>
                				
                				<c:if test="${legList1.publictransport != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-stairs section_Ele_Cont_Icon"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${legList1.elevator != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-elevator section_Ele_Cont_Icon"></i>
                					</li>
                				</c:if>
                				
                				<c:if test="${legList1.wheelchair != null}">
                					<li class="section_Ele_Cont_Li" onmouseover="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='flex'" onmouseleave="document.getElementById('section_Ele_Cont_Detail${vs.index}').style.display='none'">
                						<i class="fa-solid fa-wheelchair section_Ele_Cont_Icon"></i>
                					</li>
                				</c:if>
                		</ul>
                		<!-- 정보상세 -->
                		<ul class="section_Ele_Cont_Detail" id="section_Ele_Cont_Detail${vs.index}">
                			<c:if test="${legList1.parking != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${legList1.parking}</span>
                				</li>
                			</c:if>
                				
                			<c:if test="${legList1.publictransport != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${legList1.publictransport}</span>
                				</li>
                			</c:if>
                				
                			<c:if test="${legList1.elevator != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${legList1.elevator}</span>
                				</li>
                			</c:if>
                				
                			<c:if test="${legList1.wheelchair != null}">
                				<li class="section_Ele_Cont_Detail_Li">
                					<span>${legList1.wheelchair}</span>
                				</li>
                			</c:if>
                		</ul>		
               		</div>
            	</div>	 			
			</c:forEach>
        </div>
		<!-- 페이징 -->
        <div class="section_Page">
            <ul class="pageInfoLeg" id="pageInfoLeg">
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
let keyword = $('#sido1 option:selected').val();
let totalData;
let dataPerPage = 12;
let pageCount = 10;
let globalCurrentPage = 1;
	
	$(document).ready(function(){
		$.ajax({
			type:'POST',
			url:'ajaxLeg',
			dataType:'json',
			data:{},
			success:function(result){
				totalData = result.list.length;
				paging(totalData, dataPerPage, pageCount, 1);
				displayData(1, dataPerPage);
				
				//페이징 시작
				function paging(totalData, dataPerPage, pageCount, currentPage) {
				    totalPage = Math.ceil(totalData / dataPerPage);
				    if(totalPage<pageCount){
				    pageCount=totalPage;
				    }
				    let pageGroup = Math.ceil(currentPage / pageCount);
				    let last = pageGroup * pageCount;
				  
				    if (last > totalPage) {
				        last = totalPage;
				    }
				    let first = last - (pageCount - 1);
				    let next = last + 1;
				    let prev = first - 1;
				    let pageHtml = "";
				    pageHtml += ' <ul class="pageInfo" id="pageInfo">'
					    if (prev > 0) {
					        pageHtml += "<li class='pageInfo_btn previous'><a href='#' id='prev'> 이전 </a></li>";
					    }
					    for (var i = first; i <= last; i++) {
					        if (currentPage == i) {
					            pageHtml += "<li class='pageInfo_btn'><a href='#' id='" + i + "'>" + i + "</a></li>";
					        } 
					        else {
					            pageHtml += "<li class='pageInfo_btn'><a href='#' id='" + i + "'>" + i + "</a></li>";
					        }
					    }
					    if (last < totalPage) {
					    pageHtml += "<li class ='pageInfo_btn next'><a href='#' id='next'> 다음 </a></li>";
					    }
					    pageHtml += '</ul>'
				    $(".section_Page").html(pageHtml);
				    let displayCount = "";
				    displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
				    $("#displayCount").text(displayCount);

				    $(".pageInfo li a").click(function () {
				        let $id = $(this).attr("id");
				        selectedPage = $(this).text();
				        if ($id == "next") selectedPage = next;
				        if ($id == "prev") selectedPage = prev;
				        globalCurrentPage = selectedPage;
				    
				        paging(totalData, dataPerPage, pageCount, selectedPage);
				        
				        displayData(selectedPage, dataPerPage);
				    });
				}

				function displayData(currentPage, dataPerPage) {

				  let dataHtml = "";

				  currentPage = Number(currentPage);
				  dataPerPage = Number(dataPerPage);
				  
				  for (var i = (currentPage - 1) * dataPerPage; i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
				    	dataHtml += '<div class="section_Con">'
						dataHtml += '<span class="section_Ele_Img">'
						dataHtml += '<img src='+result.list[i].firstimage+'>'
						dataHtml += '</span>'
						dataHtml += '<div class="section_Ele_Cont">'
						dataHtml += '<ul class="section_Ele_cont_Ul1">'
						dataHtml += '<li style="font-size:1.4rem; color:#1A1A1A; font-weight:700;">'+result.list[i].location_name+'</li>'
						dataHtml += '<li style="colir:#5D5E5D">'+result.list[i].address+'</li>'
						dataHtml += '</ul>'
						dataHtml += '<span class="section_Ele_cont_bar"></span>'
						dataHtml += '</div>'
						dataHtml += '</div>'
				  }
				  $("#section").html(dataHtml);
				}
				$("#dataPerPage").change(function () {
				    dataPerPage = $("#dataPerPage").val();
				    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
				    displayData(globalCurrentPage, dataPerPage);
				 });
			},
		});
		
		$('#sido1').on('change', function(e) {
			ajaxSido();
		});
		
		
		function ajaxSido(){
			$.ajax({
				type:'POST',
				url:'ajaxKeyword',
				dataType:'json',
				data:{
					keyword: $('#sido1 option:selected').val()
				},
				success:function(result){
					totalData = result.list.length;
					paging(totalData, dataPerPage, pageCount, 1);
					displayData(1, dataPerPage);
					
					//페이징 시작
					function paging(totalData, dataPerPage, pageCount, currentPage) {
					    totalPage = Math.ceil(totalData / dataPerPage);
					    if(totalPage<pageCount){
					    pageCount=totalPage;
					    }
					    let pageGroup = Math.ceil(currentPage / pageCount);
					    let last = pageGroup * pageCount;
					  
					    if (last > totalPage) {
					        last = totalPage;
					    }
					    let first = last - (pageCount - 1);
					    let next = last + 1;
					    let prev = first - 1;
					    let pageHtml = "";
					    pageHtml += ' <ul class="pageInfo" id="pageInfo">'
						    if (prev > 0) {
						        pageHtml += "<li class='pageInfo_btn previous'><a href='#' id='prev'> 이전 </a></li>";
						    }
						    for (var i = first; i <= last; i++) {
						        if (currentPage == i) {
						            pageHtml += "<li class='pageInfo_btn'><a href='#' id='" + i + "'>" + i + "</a></li>";
						        } 
						        else {
						            pageHtml += "<li class='pageInfo_btn'><a href='#' id='" + i + "'>" + i + "</a></li>";
						        }
						    }
						    if (last < totalPage) {
						    pageHtml += "<li class ='pageInfo_btn next'><a href='#' id='next'> 다음 </a></li>";
						    }
						    pageHtml += '</ul>'
					    $(".section_Page").html(pageHtml);
					    let displayCount = "";
					    displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
					    $("#displayCount").text(displayCount);

					    $(".pageInfo li a").click(function () {
					        let $id = $(this).attr("id");
					        selectedPage = $(this).text();
					        if ($id == "next") selectedPage = next;
					        if ($id == "prev") selectedPage = prev;
					        globalCurrentPage = selectedPage;
					    
					        paging(totalData, dataPerPage, pageCount, selectedPage);
					        
					        displayData(selectedPage, dataPerPage);
					    });
					}

					function displayData(currentPage, dataPerPage) {

					  let dataHtml = "";

					  currentPage = Number(currentPage);
					  dataPerPage = Number(dataPerPage);
					  
					  for (var i = (currentPage - 1) * dataPerPage; i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
					    	dataHtml += '<div class="section_Con">'
							dataHtml += '<span class="section_Ele_Img">'
							dataHtml += '<img src='+result.list[i].firstimage+'>'
							dataHtml += '</span>'
							dataHtml += '<div class="section_Ele_Cont">'
							dataHtml += '<ul class="section_Ele_cont_Ul1">'
							dataHtml += '<li style="font-size:1.4rem; color:#1A1A1A; font-weight:700;">'+result.list[i].location_name+'</li>'
							dataHtml += '<li style="colir:#5D5E5D">'+result.list[i].address+'</li>'
							dataHtml += '</ul>'
							dataHtml += '<span class="section_Ele_cont_bar"></span>'
							dataHtml += '</div>'
							dataHtml += '</div>'
					  }
					  $("#section").html(dataHtml);
					}
					$("#dataPerPage").change(function () {
					    dataPerPage = $("#dataPerPage").val();
					    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
					    displayData(globalCurrentPage, dataPerPage);
					 });
				},
			});
		}
	
	});
	
	

	
</script>
<script src="https://kit.fontawesome.com/f9f8c57db8.js" crossorigin="anonymous"></script>
</html>