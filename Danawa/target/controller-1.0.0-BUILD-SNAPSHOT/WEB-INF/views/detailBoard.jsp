<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>       
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detailBoard</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="stylesheet" href="${root}resources/css/notebook_q&A_in.css">		
<script type="text/javascript">

	$(document).ready(function(){
		var memId = ${mem.memId};
		var boIdx = $("#boGroup").val();
		
		if(${reWriteBoard} == null){
			reWriteList(boIdx);
		} 		
	});

	
	function modifyForm(){
		$("#boTitle").attr("readonly" , false);
		$("#boContent").attr("readonly" , false);
		
		$("#modifyForm").css("display" , "none");
		$("#modify").css("display" , "block");		
	}
	
	function modify(idx){
		
		var boTitle = $("#boTitle").val();
		var boContent = $("#boContent").val();
		
		$.ajax({
			url : "${root}board/update",
			type : "post",
			data : {"boIdx" : idx , "boTitle" : boTitle , "boContent" : boContent},
			dataType : 'json',
			success : function(data){
				if(data > 0){
					alert("수정완료");
					location.href="${root}board/boardList?nowPage=${cri.nowPage}&type=${cri.type}&keyword=${cri.keyword}";
				}
				else{
					alert("수정실패");
					location.href="${root}board/boardList?nowPage=${cri.nowPage}&type=${cri.type}&keyword=${cri.keyword}";
				}
			},
			error : function(){
				alert("error");
			}
		});
	}	
	
	 function deleteBoard(idx){
			
		 $.ajax({
				url : "${root}board/deleteBoard",
				type : "post",
				data : {"boIdx":idx},
				dataType : "json",
				success : function(data){
					if(data > 0){
						alert("삭제완료");
						location.href="${root}board/boardList?nowPage=${cri.nowPage}&type=${cri.type}&keyword=${cri.keyword}";
					}
					else{
						alert("삭제실패");
						location.href="${root}board/boardList?nowPage=${cri.nowPage}&type=${cri.type}&keyword=${cri.keyword}";
					}
				},
				error : function(){
					alert("error");
				}
			});
		}
	 
	 	function addGood(idx){
	 		var memId = ${mem.memId};
	 				
	 		$.ajax({
				url : "${root}board/myGoodCheck",
				type : "get",
				data : {"boIdx" : idx , "goNickName" : memId},
				dataType : "json",
				success : function(result){					
					if(result == 0){
					
						$.ajax({
			 	 			url : "${root}board/addGood",
			 	 			type : "get",
			 	 			data : {"boIdx" : idx  , "goNickName" : memId},
			 	 			success : function(){			 	 				
			 	 				location.href="${root}board/addGoodBoard?boIdx="+idx+"&goNickName="+memId;		
			 	 			},
			 	 			error : function(){
			 	 				alert("addGooderror");
			 	 			}
			 	 		});  
			 		
					}
					else{
						alert("이미좋아요누름");
					}
				},
				error : function(){
					alert();
				}
			});
	 	}
	 	
	 	function reWrites(){
	 		
	 		var formData = $("#reWriteForm").serialize();
	 		var boIdx = $("#boGroup").val();
	 		//alert("gkdnl");
	 		
	 		
	 		 $.ajax({
	 			url : "${root}board/boardRewrite",
	 			type : "get",
	 			data : formData,
	 			dataType : "json",
	 			success : function(result){
	 				reWriteList(boIdx);	 			
	 				
	 			},
	 			error : function(){
	 				alert("error");
	 			}
	 		}); 
	 	}
	 	
	 function reWriteList(idx){
		 location.href="${root}board/detailBoard?boIdx="+idx;
	 }
</script>
</head>

<body>           
<jsp:include page="common/header.jsp"/>          
<section id="board">
   

	<div id="board_area">
		<table  align="left" width="90%" style="padding-top:3%;">
			<thead style="font-size: 25px;">
	            <tr align = "left">
	                <th><b><input type="text" id="boTitle" value="${detailBoard.boTitle}" readonly/></b></th>
	            </tr>
          	</thead>
          
          	<tbody>
          		<tr align="left" style="font-size: 15px; color: rgb(189, 157, 219);">
            		<td colspan="2"  style="border-bottom: 1px solid lightgray ;">
                 		<div id="retitle">
                			<b>${detailBoard.boNickName}</b> 
                			<b>${fn:split(detailBoard.boDate ,' ')[0]}</b>       
                			<i class="fas fa-eye">${detailBoard.boCount}</i> <!--조회수  -->
                			<i class="far fa-grin-hearts">${detailBoard.boGood}</i>  <!--공감  -->
                
             <!-- ======================================================== -->
               				<div id = "updateDelete">             
              
								<c:if test="${mem.memId eq detailBoard.memId}">	              
					               <button id ="Form" type ="button" onclick="modifyForm()">수정화면</button>
					               <button id="modify" type="button" style="display: none;" onclick="modify(${detailBoard.boIdx})">수정하기</button>
					              
					               <button id ="delete" type="button" onclick="deleteBoard(${detailBoard.boIdx})">삭제하기</button>
					               <button id="modifyForm" type="button" onclick="location.href='${root}board/boardList?nowPage=${cri.nowPage}'">목록보기</button>            	
					            </c:if>
            
					            <c:if test="${mem.memId ne detailBoard.memId}">	              
					               <button id ="modifyForm" type ="button"  disabled="disabled">수정화면</button>
					               <button id="modify" type="button" style="display: none;" disabled="disabled">수정하기</button>
					              
					              
					               <button id = "delete" type = "button" disabled="disabled">삭제하기</button>
					               <button id="modify" type="button" onclick="location.href='${root}board/boardList?nowPage=${cri.nowPage}&type=${cri.type}&keyword=${cri.keyword}'">목록보기</button>
					            </c:if>              
               				</div>               
                		</div>
            		</td>       
        		  </tr>

          

	          	<tr align="left" style="font-size: 15px; color: black;">
	            	<td colspan="2"></td>	            
	        	</tr>
			</tbody>
    	</table>
  	</div>
	
	<div id="attention" align="center" style="padding-top: 10%; padding-bottom: 3%; border-bottom: 1px solid lightgray;">
		<textarea rows="20" cols="120" class="form-control" id="boContent" readonly>${detailBoard.boContent}</textarea>
    	<p style="font-size: 15px;">공감/비공감을 눌러주세요</p>
     
  
		<c:if test="${detailBoard.goCount > 0}">
			<a href="javascript:addGood(${detailBoard.boIdx});" ><i class="far fa-grin-hearts" style="font-size: 50px; color: red;"  id="clicklike"></i></a>   	
		</c:if>
      
		<c:if test="${detailBoard.goCount == 0}">
			<a href="javascript:addGood(${detailBoard.boIdx});" ><i class="far fa-grin-hearts" style="font-size: 50px; color: rgb(189, 157, 219);"  id="clicklike"></i></a>   	
		</c:if>  
  	</div>

	 <!--댓글  -->
 	<div style="padding-top: 2%; margin-left: 10%; padding-bottom: 3%">     
    	<h3 id="review_1" >댓글</h3>
    	<div id="review" align="center">
       		<form  id="reWriteForm" name="reWriteForm">
			 	<table align="center"  style="width: 80%; border-collapse: collapse;">
			    	<tbody align="left">
				    	<tr>				
					    	<td rowspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);"><i class="fas fa-camera" style="font-size: 50px; color: thistle;"></i></td>					     
					    	<td colspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);  border-left: 1px solid rgb(228, 224, 224);">					          					         
					          	<input type ="hidden" name ="boGroup" id="boGroup" value="${detailBoard.boGroup}"/>				
						        <input type ="hidden" name ="reNickName" value="${mem.memNickName}"/>
						        <textarea rows="10" cols="100" name ="reContent"></textarea> 
						        <input type = "button" value = "목록보기" id = "rewritesubmit" onclick ="location.href='/board/returnlist?nickname='">
						        <button type = "button"  onclick="reWrites();">답글쓰기</button>					        
					      	</td>	
				    	</tr>
			    	</tbody>
				</table>				
			</form>
		</div>      
	</div>


	<div id="table2" style="padding-bottom: 10%;">
		<c:forEach items="${reWriteBoard}" var="reWrite">
			<table align="center"  style="width: 80%; border-collapse: collapse;">
  				<thead align="left">
		      		<tr>
		          		<th style="color: black; background-color: rgb(241, 227, 227); border-bottom: 1px solid white;">@${reWrite.reNickName} -----> @${detailBoard.boNickName}</th>
		          		<th style="color: black; background-color: rgb(241, 227, 227); border-bottom: 1px solid white;"></th>
		          		<th style="color: black; background-color: rgb(241, 227, 227); border-bottom: 1px solid white;"></th>		          
		          		<th style="background-color: rgb(241, 227, 227);"> </th>
		        	</tr>
   				</thead>
    
	    		<tbody align="left">
				    <tr>			                   
				    	<td rowspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);"><i class="fas fa-camera" style="font-size: 50px; color: thistle;"></i></td>	     
				    	<td colspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);  border-left: 1px solid rgb(228, 224, 224);">
				                 ${reWrite.reContent}
						</td>		      
				       
						<td align="center" style="border-left: 1px solid rgb(228, 224, 224); border-bottom: 1px solid rgb(228, 224, 224);" > 
				        	<a href="#"><i class="far fa-grin-hearts" style="font-size: 30px; color: rgb(189, 157, 219);"></i></a>
				        	<a href="#"><i class="far fa-frown" style="font-size: 30px; color: rgb(189, 157, 219); margin-top: 2px;"></i></a>
						</td>
				    </tr>
	    		</tbody>
			</table>
 		</c:forEach>
	</div>
</div>
</section>
<!-- footer불러오기 -->
<jsp:include page="common/footer.jsp"/>
</body>
</html>