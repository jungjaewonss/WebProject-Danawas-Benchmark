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
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<link rel="stylesheet" href="${root}resources/css/notebook_q&a_main.css">  
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
	<script type="text/javascript">
		$(document).ready(){
			location.reload();
		
			
			if(${not empty msg}){
				alert("${msg}");
			}
		}	
	</script>
</head>

 
<body>
<jsp:include page="common/header.jsp"/>

<div id="board">
	<h1 id="title">노트북게시판</h1>
	<!--검색메뉴-->
		
	
		<div id="board_area">
			<div id="board_bottom">
				<div style="text-align: center;" id="searchBoard">
					<form class="form-inline" action="${root}board/boardList">
					  <div class="form-group">
					    <select name="type" class="form-control">
					    	<option value="writer" ${pageMaker.cri.type == 'writer' ? 'selected' : ''}>이름</option>
					    	<option value="title" ${pageMaker.cri.type == 'title' ? 'selected' : ''}>제목</option>
					    	<option value="content" ${pageMaker.cri.type == 'content' ? 'selected' : ''}>내용</option>
					    </select>
					  </div>
					  
					  <div class="form-group">
					    <input type="text" class="form-control" id="email" name="keyword" value="${pageMaker.cri.keyword}">
					  </div>
					  
					  <button type="submit" class="btn btn-default">검색</button>
					</form>
				</div>
				
				<table align="center" width="90%" class='table table-bordered'>
					<tr colspan='5'>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
					    	
			   		<c:forEach var="ls" items="${allList}">
			   			<tr colspan='5'>
				          <td>${ls.boIdx}</td>
				          <td><a href="${root}board/detailBoard?boIdx=${ls.boIdx}&memId=${mem.memId}&nowPage=${pageMaker.cri.nowPage}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${ls.boTitle}</a></td>
				          <td>${ls.boNickName}</td>
				          <td>${ls.boDate}</td>
				          <td>${ls.boCount}</td>
			        	</tr>
			   		</c:forEach>									        
				</table> 				
 				<a class="btn btn-primary btn-sm"  type="button" href="${root}board/writeForm">글쓰기</a> 
			</div>
		</div>
		
		
	<!-- 페이징 start -->
	
	<div style="text-align: center;">
		<ul class="pagination">
			
			<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<c:if test="${pageMaker.cri.nowPage != pageNum}">
					<li><a href="${root}board/boardList?nowPage=${pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${pageNum}</a></li>
				</c:if>
				
				<c:if test="${pageMaker.cri.nowPage == pageNum}">
					<li class="active"><a href="${root}board/boardList?nowPage=${pageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${pageNum}</a></li>
				</c:if>
			</c:forEach>
								
   <!-- 이전처리부분 -->
	   		<c:if test="${pageMaker.prev}">
	   			<li class="paginate_button previous">
	   				<a href="${root}board/boardList?nowPage=${pageMaker.startPage-1}">이전</a>
	   			</li>
	   		</c:if>
   		
	   		<c:if test="${pageMaker.next}">
	   			<li class="paginate_button next">
	   				<a href="${root}board/boardList?nowPage=${pageMaker.endPage+1}">다음</a>
	   			</li>	   			
	   		</c:if>
   		</ul>
   	</div>
</div>

<jsp:include page="common/footer.jsp"/>
</body>
</html>