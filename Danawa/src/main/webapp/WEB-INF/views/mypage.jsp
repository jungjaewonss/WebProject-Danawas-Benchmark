<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>MyPage</title>
<link rel="stylesheet" href="${root}resources/css/Mypage.css"/>
<link rel="stylesheet" href="${root}resources/css/MypageProductOfInterest.css">
<script type="text/javascript">
	function productPage(){
		$(".head h2").html("관심상품");		
		$(".b_count").css("display" ,"none");		
		$("#myBoard").css("display" ,"table");
		$("#myProduct").css("display" ,"none");
		
		$("#deleteBtn").css("display","inline-block");		
		$("#selectAllButton").css("display","inline-block");
		$("#select_all").css("display","inline-block");
		$("#pagins").css("display","inline");
	}
	
	function myBoardPage(memId){
		var listhtml = "";
		
		$.ajax({
			url:"${root}board/myboard",
			type : "get",
			data : {"memId" : memId},
			success: function(result){							
				 $.each(result,function(index,item){										
					listhtml+="<thead class='th'>";
					listhtml+="<tr>";
					listhtml+="<th scope='col' class='check'>"+item.boIdx+"</th>";
					listhtml+="<th scope='col' class='title'>";
					listhtml+="<a href='${root}board/detailBoard?boIdx="+item.boIdx+"'>"+item.boTitle+"</a>"
					listhtml+="</th>"
					listhtml+="<th scope = 'col' class='date'>"+item.boGood+"</th>";
					listhtml+="<th scope = 'col' class='date'>"+item.boDate+"</th>";
					listhtml+="</tr>";
					listhtml+="</thead>";
					
					listhtml+="<div style='text-align:center;'>";
					listhtml+="<ul class='pagination'>";
					
					$("#myProduct").html(listhtml);
				});  
			},
			error : function(){
				alert("에러");
			}
		});				
		$(".head h2").html("내가 쓴 글");
		$(".b_count").css("display" ,"inline-block");
		
		$("#myBoard").css("display" ,"none");
		$("#myProduct").css("display" ,"table");
		$("#deleteBtn").css("display","none");
		$("#selectAllButton").css("display","none");
		$("#select_all").css("display","none");
		$("#pagins").css("display","none");
	}
				
	function checkedDelete(){
		var checkedValue = [];
		
		var check = $("input[name='mynotebook']:checked");
		var memIdx = ${mem.memIdx};
		$(check).each(function(){
			checkedValue.push($(this).val());
		});
				
		$.ajax({
			url : "${root}notebook/deleteMyProduct",
			type : "get",
			dataType : 'text',
			traditional : true,
			data : {"data" : checkedValue , "memIdx" : memIdx},
			success : function(result){
				if(result >= 1)
				alert("상품이 삭제되었습니다.");
				location.reload();
			},
			error : function(){
				alert("error");
			}
		}); 
	}
	
	function selectAll(){
		if($(".checknotebook").prop("checked") == true){
			$(".checknotebook").prop("checked",false);
		}
		else{
			$(".checknotebook").prop("checked",true);
		}
	}
</script>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
	<div id="wrap">
		<div id="container" clss="myPage_wrap">
			<div class="side_area">
				<div class="user_area">
					<div class="my_thumb">
						<span class="p_img"><img
							src="//img.danawa.com/icon/icon_default_01.gif" alt="닉네임"
							onerror="this.src='//img.danawa.com/icon/icon_default_01.gif'"></span>
					</div>
					
					<div class="my_info">
						<p class="p_nick">
							<strong>${myInfo.memNickName}</strong>님
						</p>
						<p class="p_id">${myInfo.memId}</p>
					</div>					
					
					<div class="my_btn">
						<a href="${root}member/updateMemberForm?memIdx=${myInfo.memIdx}"class="btn_profile">회원정보수정</a>
					</div>				
				</div>
				
				<div class="menu_area">
					<dl class="menu_lst">
						<dt>
							<a id="link2" href="">활동내역</a>
						</dt>
						<dd>
							<ul>
								<li><a id="link3" href="javascript:productPage();">관심상품</a></li>
								<li><a id="link3" href="javascript:myBoardPage('${myInfo.memId}')">내게시물</a></li>
							</ul>
						</dd>						
					</dl>
				</div>
			</div>
			
			<div class="cont_area">
				<div class="main_area">
					<div class="box my_wish">
						<div class="head">														
							<h2>관심상품</h2>
						</div>

						<div class="cont" id="MyActUl">
							
							
							<div class="ctrl_box clear">
								<div class="left_a">
									<div class="chk">
										<input type="checkbox" id="select_all" onclick="selectAll()"/>
										<span class=""tabindex="0" id="selectAllButton">전체선택</span>
									</div>									
									<button type="button" id="deleteBtn" class="btn_s" onclick="checkedDelete();">삭제</button>																				
								</div>
							</div>


							<div id="boardArea">
							
							<!-- 내가쓴글  -->							
								<table class="tbl act_tbl" id="myProduct" style="display: none;">
									<colgroup>
										<col class="title">
										<col class="date">
									</colgroup>																
								</table>
								
								<!-- 관심상품 -->                           
							    <table class="tbl act_tbl" id="myBoard">
							    	 <colgroup>
							         	<col class="title">
							         	<col class="date">
							         </colgroup>                               
							        
							       <c:forEach items="${myItem}" var="item">                                                          
							        <thead class="th">								
									<tr>
									<!--oneCheckBox('${item.myNoteBook}')  -->
							            <th scope="col"class="checkbox">                             
							            	<input type="checkbox" name="mynotebook" value='${item.myNoteBook}' class="checknotebook">
							            </th>                                                				                                    
										
										<th scope="col" class="check"><img alt="노트북사진" src="${item.myNoteBookImg}" id="mynotebookimg"></th>      
										<th scope="col" class="title"> <a href="${root}notebook/detailNoteBook?subject=${item.myNoteBook}">${item.myNoteBook}</a></th>
										<th scope="col" class="date" ><span id="regdate">${item.myNoteBookDate}</span></th>        									
									</tr>								
								</thead>
								</c:forEach>					                             
							</table>																
							
							<!-- 페이징처리부분 -->
							<div style="text-align:center;" id="pagins">
								<ul class="pagination">
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
										<li id="myItemNumber" class="${pageMaker.cri.nowPage == pageNum ? 'active' : ''}">
											<a href="${root}member/myPage?nowPage=${pageNum}&memIdx=${myInfo.memIdx}">[${pageNum}]</a>
										</li>
									</c:forEach>																				
								</ul>
							</div>	   																												
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>