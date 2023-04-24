<%@page import="danawa.service.NoteBookService"%>
<%@page import="danawa.mapper.NoteBookMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>  


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>notebookList</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${root}resources/css/NoteBookMain.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
	.malls{
		margin-right: 20px;
	}
</style>

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
	<div id="wrap"></div>

	<!-- 왼쪽 상단 메뉴바 -->
	<aside class="container_aside">
		<div class="category_aside">

			<div class="aside_head">
				<h3 class="aside_head_main"></h3>
					
				<a
					href="http://white.contentsfeed.com/RealMedia/ads/click_lx.ads/www.danawa.com/new_main/L23/545845034/x71/danawa/Nvidia_NB_200237/Nvidia_NB_200237_1.html/7239386d336d48542f414d4143585638">
					<img
					src="https://i.ytimg.com/vi/NvnjYWbVyho/maxresdefault.jpg"
					id="topadd" height="400px;" width="200px">
				</a>
			</div>

			<div class="aside_list_box">
				<ul class="aside_list">

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="All"
						id="left_menu1"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Apple"
						id="left_menu2"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Lg"
						id="left_menu3"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Samsung"
						id="left_menu4"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Lenovo"
						id="left_menu5"></a></li>

				</ul>
			</div>
		</div>

		<!-- 왼쪽 상단 메뉴바 끝-->

		<!-- 상단 광고판 -->
		<div class="Commercial_1">

			<div class="Commercial">
				<a href="" target="_blank"> <img
					src="https://orange.contentsfeed.com/RealMedia/ads/Creatives/danawa/acer_nb_e_700142_1612/acer_nb_700142_220321.jpg"
					alt="광고" id="mainimg"></a>
			</div>
		</div>
	</aside>

	<!-- 상단 광고판 끝 -->


	<!-- 오른쪽 상단 노트북 광고판 -->

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/686/957/img/12957686_1.jpg?shrink=330:330&_v=20210118112409"
				alt="노트북"></a>

		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/058/621/img/13621058_1.jpg?shrink=330:330&_v=20220125170310"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/218/522/img/15522218_1.jpg?shrink=330:330&_v=20220215193732"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/458/178/img/14178458_1.jpg?shrink=330:330&_v=20220304095558"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/300/112/img/16112300_1.jpg?shrink=330:330&_v=20220224112729"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/622/726/img/13726622_1.jpg?shrink=330:330&_v=20211122133048"
				alt="노트북"></a>
		</div>
	</aside>

	<!-- 오른쪽 상단 노트북 광고판끝 -->

	<!-- 상세검색 체크박스 -->
	<div class="detailed_search_1_1">
		<h4 id="detailed_search"></h4>
	</div>

	<div id="check_box_">
		<div class="search_check_box">
	<!--===============================노트북 분류 하기 ===========================================  -->
			<form  method="get" action="${root}notebook/checkNotebook">
				<table cellspacing="0" cellpadding="0" id="border_1">					
					<ul>
						<div>
							<tr>
								<td class="check_bottom1">
									<li>
										<!--    제조사별 분류   -->
										<h5 id="check_1">제조사별</h5>
									</li>								
								</td>
								
								
								<td class="check_bottom">
									<li class="check"><input type="checkbox"
										class="clickcheckbox" id="company" name="company" value="LG전자">
										LG전자</input></li>
								</td>
								
								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class="clickcheckbox" value="삼성전자"> 삼성전자</input></li>
								</td>
								
								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class="clickcheckbox" value="APPLE">
										APPLE</input></li>
								</td>
								
								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class="clickcheckbox" value="레노버"> 레노버</input></li>
								</td>


								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class=clickcheckbox value="ASUS">ASUS</input></li>
								</td>


								<td class="check_bottom"></td>
							</tr>
						</div>
					</ul>
					<!--    화면크기 분류   -->

					<ul>
						<tr>
							<td rowspan="2" class="check_bottom1">
								<li>
									<h5 id="check_2">화면인치</h5>
							</li>
							</td>
							<td>
								<li class="check2"><input type="checkbox" name="screeninch"
									class="clickcheckbox" value="13">13인치이하</input></li>
							</td>
							<td>
								<li class="check2" id="check2_2"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="14">
									14인치 </input></li>
							</td>
							<td>
								<li class="check2" id="check2_3"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="15">
									15인치</input></li>
							</td>
							<td>
								<li class="check2" id="check2_4"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="16">
									16인치</input></li>
							</td>
							<td>
								<li class="check2" id="check2_5"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="17">
									17인치이상</input></li>
							</td>
						</tr>
						<tr>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
						</tr>
					</ul>

					<tr>
						<!--   노트북 무게분류    -->
						<ul>
							<td class="check_bottom1">
								<li>
									<h5 id="check_3">무게</h5>
							</li>
							</td>
							<td class="check_bottom">
								<li class="check3"><input class="clickcheckbox"
									type="checkbox" name="weight" value="1.3">1.3kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="1.5">1.5kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="1.7">1.7kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="1.9">1.9kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="2">2kg이상</input></li>
							</td>
						</ul>
					</tr>


					<!--   메모리 별 분류    -->
					<tr>
						<ul>
							<td class="check_bottom1">
								<li>
									<h5 id="check_5">메모리</h5>
							</li>
							</td>
							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="32"> 32GB이상</input></li>
							</td>
							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="16"> 16GB</input></li>
							</td>

							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="8"> 8GB</input></li>
							</td>


							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="4"> 4GB이하</input></li>
							</td>
						</ul>
					</tr>

					<!--   usb 분류    -->
					<tr>
						<ul>
							<td class="check_bottom2">
								<li>
									<h5 id="check_6">USB</h5>
							</li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="3">2개 이하</input></li>
							</td>

							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="3">3개</input></li>
							</td>

							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="4">4개</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="5">5개이상</input></li>
							</td>
					</tr>
					<!--   용도별 분류    -->
					<tr>
						<ul>
							<td class="check_bottom2">
								<li>
									<h5 id="check_6">용도</h5>
							</li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="purpose" value="사무/인강용">사무/인강용</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="purpose" value="게임용">게임용</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="purpose" value="그래픽작업용">그래픽작업용</input></li>
							</td>
					</tr>
					<!--   두께별 분류     -->
					<tr>
						<ul>
							<td class="check_bottom2">
								<li>
									<h5 id="check_6">두께</h5>
							</li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="17">17mm미만</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="18">18mm</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="19">19mm</input></li>
							</td>

							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="20">20mm이상</input></li>
							</td>
					</tr>
					</ul>
				</table>
				<input type="submit" id="classSubmitBtn" value="체크박스검색"/>                
			</form>			
			<button id="allnotebook" onclick="">전체보기</button>			
		</div>
	</div>

	<div id="numberringwrap">
		<div id="move">			
			<c:if test="${empty classification}">
			<c:if test="${empty allnotebook}">
				<div style="text-align: center;">
					<b style="font-size: 30px">검색결과가없습니다.</b>				
				</div>
			</c:if>
			<c:forEach items="${allnotebook}" var="notebook" varStatus="status">				
				<div class="notobook_1">			
					<div class="notebook_img">					
						<a href=""
							target="_blank"> <img src="${notebook.img}"
							id="allnotebookimg" style="width: 130px; height: 130px;" alt="노트북"
							title="노트북">
						</a>					
					</div>							
				<div>					
					<div class="notebook_title">
						<a	href="${root}notebook/detailNoteBook?subject=${notebook.subject}">${notebook.subject}</a>
					</div>					
					<div class="notebook_content">
						<p>${notebook.allinfo}</p>
					</div>
				</div>		
			
			<c:forEach items="${map[notebook.subject]}" var="mall">												
				<div class="notebook_min">                    					
					<div id="logoAndPrice">
						<div>
							<a href="${mall.link}" target="blank"> 												
								<img src="${mall.logo}"/>																												
							</a>
						</div>
						
						<div id="price"><span id="pricefont">${mall.price}원</span></div>
						<div><span id="mallname">${mall.shipping}</span></div>								
					</div>
					
								
				</div> 						
			</c:forEach>

			<c:if test="${not empty mem}">
			<div class="item_data">						 
				<button type="button" id="productbutton" onclick="addMyProduct('${notebook.subject}','${notebook.img}');">관심상품</button>
			</div>
			</c:if>
		</div>
	</c:forEach>
	</c:if>	
	
	
	<c:if test="${not empty classification}">		
		<c:forEach items="${classification}" var="notebook" varStatus="status">				
			<div class="notobook_1">			
				<div class="notebook_img">					
					<a href=""
						target="_blank"> <img src="${notebook.img}"
						id="allnotebookimg" style="width: 130px; height: 130px;" alt="노트북"
						title="노트북">
					</a>					
				</div>							
				
				<div>					
					<div class="notebook_title">
						<a	href="${root}notebook/detailNoteBook?subject=${notebook.subject}"target="_blank">${notebook.subject}</a>
					</div>					
					
					<div class="notebook_content">
						<p>${notebook.allinfo}</p>
					</div>
				</div>		
			
				<c:forEach items="${map[notebook.subject]}" var="mall">												
					<div class="notebook_min">                    					
						<div id="logoAndPrice">
							<a href="" target="blank"> 												
							<img src="${mall.logo}"/>						
							<span id="pricefont">${mall.price}원</span>																													
							<span id="mallname">${mall.shipping}</span>																
							</a>
						</div>					
					</div> 						
				</c:forEach>			 	 					
			
				<div class="item_data">
					<button type="button" id="productbutton" onclick="addMyProduct('${notebook.subject}','${notebook.img}');">관심상품</button>									 
				</div>
			</div>
		</c:forEach>	
	</c:if>						
			
			<div style="text-align:center;">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
				   		<li class="paginate_button previous">
				   			<a href="${root}notebook/notebookList?nowPage=${pageMaker.startPage-1}">이전</a>
				   		</li>
   					</c:if>
					
					<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				 		<c:if test="${empty notebook and empty textsearch}">
				 			<li class="${pageMaker.cri.nowPage == pageNum ? 'active' : ''}">
				 				<a href="${root}notebook/notebookList?nowPage=${pageNum}">${pageNum}</a>
				 			</li>			 		
				 		</c:if>
				 	
				 		<c:if test="${not empty notebook and empty textsearch}">
				 			<li class="${pageMaker.cri.nowPage == pageNum ? 'active' : ''}">
				 				<a href="${root}notebook/checkNotebook?nowPage=${pageNum}&screeninch=${notebook.screeninch}&weight=${notebook.weight}&company=${notebook.company}&memory=${notebook.memory}&usb=${notebook.usb}&purpose=${notebook.purpose}&thickness=${notebook.purpose}">${pageNum}</a>
				 			</li>				 			
				 		</c:if>
				 		
				 		<c:if test="${not empty textsearch}">
				 			<li class="${pageMaker.cri.nowPage == pageNum ? 'active' : ''}">
				 				<a href="${root}notebook/textsearch?nowPage=${pageNum}&mainSearch=${textsearch}">${pageNum}</a>
				 			</li>				 			
				 		</c:if>					 				
					</c:forEach>
					 		
		   			<c:if test="${pageMaker.next}">
		   				<li class="paginate_button next">
		   					<a href="${root}notebook/notebookList?nowPage=${pageMaker.endPage+1}">다음</a>
		   				</li>	   			
		   			</c:if>								  						  
				</ul>
			</div>								
		</div>
	</div>
	</div>
</body>
</html>
</body>
</html>