<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>노트북상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap"rel="stylesheet">
<link rel="stylesheet" href="${root}resources/css/notebookDetail.css">
	<script type="text/javascript">
	function addMyProduct(myNoteBook , img){		
		var memIdx = '${mem.memIdx}';		
		$.ajax({
			url : "${root}notebook/addMyProduct",
			type : "get",
			data : {"myNoteBook":myNoteBook,"memIdx":memIdx,"myNoteBookImg":img},
			success : function(result){
				if(result == 1){
					alert("관심등록이 완료되었습니다.");
				}
				else if(result == 0){
					alert("이미 관심등록이 완료된 상품입니다.");
				}
			},
			error : function(){
				alert("error");	
			}
		});  
	}
	</script>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
	<!-- 맨위 상단 노트북 설명 -->	
	<section class="content">
		<div>
			<!-- 노트북 이름 -->
			<div class="content_title">
				<h2 id ="subject">${oneNotebook.subject}</h2>
			</div>

			<!-- 노트북 상세정보 -->
			<div class="content_content">
				<p>${oneNotebook.allinfo}</p>
			</div>

			<!-- 관심상품 -->
			<div class="disinterest">
				<a href="./wishList.html"><p id="font"></p></a>
			</div>
		</div>
	</section>


	<!-- 노트북 최저가 비교  -->
	<div id="allwrap">
		<section class="Information">
			<div id = "onenotebookwrap">
				
				<!-- 노트북 이미지 -->
				<div class="note_img_size">
					<a href="" target="_blank"> <img src="${oneNotebook.img}" width="429px" height="400px"alt="노트북"/></a>
				</div>
				
				
				<!-- 노트북 최저가 사이트 -->
							
				<div id = "pricwrap">
					<div id="lowest_price">
						<span id="low" style="font-size: 17px; font-weight: bold;">최저가</span>			
					
						<a href="${mallinfoDetail[0].link}" target="_blank" ><span id="minprice"style="color: blue; font-size: 26px; font-weight: bold;">${mallinfoDetail[0].price}원</span>
						<button	id="low_button"	style= "background-color: black; color: white;  height:43px; font-weight: bold;">최저가구매하기</button>
						</a>
					
					 	<button type="button" id="allnotebookList" onclick="location='${root}notebook/notebookList'">전체리스트</button>
					 	<button type="button" id="productOfInterest" onclick="addMyProduct('${oneNotebook.subject}','${oneNotebook.img}');">관심상품등록</button>									 					 				 
					</div>
					 
					<div id="low_price">
						<c:forEach var="mall" items="${mallinfoDetail}">	
							<span><a href="${mall.link}"><img id="low_price_img_2"src="${mall.logo}"alt="logo" width="52px" height="24px"></span>					
							<span class="low_price_font" id="low_price_font_1"style="font-size: 14px;">${mall.price}원</a>
							</span> 
							
							<span class="low_price_font" id="low_price_font_1"
								style="font-size: 13px;">${mall.shipping}</span>							
						    <span class="low_price_font"id="low_price_font_1" style="font-size: 13px;"></span></br>
						</c:forEach>						
					</div>					              
				</div>		
			</div>                                  
	</section>

	<section id="table">
		<div class="table_size">
			<table cellspacing="0" cellpadding="0" id="table_1">
				<tr>
					<td class="table_1_1">제조회사</td>
					<td class="table2">${oneNotebook.company}</td>
					<td class="table_1_1">등록년월</td>
					<td class="table2">2022년 03월</td>
				</tr>
				<tr>
					<td class="table_1_1">화면크기</td>
					<td class="table2">${oneNotebook.screeninch}인치</td>
					<td class="table_1_1">메모리</td>
					<td class="table2">${oneNotebook.memory}GB</td>
				</tr>
				<tr>
					<td class="table_1_1">용도</td>
					<td class="table2">${oneNotebook.purpose}</td>
					<td class="table_1_1">노트북두께</td>
					<td class="table2">${oneNotebook.thickness}mm</td>
				</tr>
				<tr>
					<td class="table_1_1">USB 개수</td>
					<td class="table2">${oneNotebook.usb}개</td>
					<td class="table_1_1">코어 수</td>
					<td class="table2">쿼드코어</td>
				</tr>
				<tr>
					<td class="table_1_1">제조사및모델명</td>
					<td class="table2"></td>
					<td class="table_1_1"></td>
					<td class="table2"></td>
				</tr>
				<tr>
					<td class="table2" colspan="4" style="font-weight: bold;">디스플레이</td>

				</tr>

				<tr>
					<td class="table_1_1">화면 비율</td>
					<td class="table2">16:10</td>
					<td class="table_1_1">해상도</td>
					<td class="table2">2560x1600(WQXGA)</td>
				</tr>

				<tr>
					<td class="table_1_1">DCI-P3</td>
					<td class="table2">99%</td>
					<td class="table_1_1">패널 종류</td>
					<td class="table2">IPS</td>
				</tr>
			</table>
		</div>
	</section>
</div>

	<!-- 풋터 -->
	<jsp:include page="common/footer.jsp"/>
</div> 
</div>
</body>
</html>