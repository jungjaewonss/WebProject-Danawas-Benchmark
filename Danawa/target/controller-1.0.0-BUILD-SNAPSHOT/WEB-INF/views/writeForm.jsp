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
	<link rel="stylesheet" href="css/style2.css">
		
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="slide.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap"  rel="stylesheet">
	
	
	<script src="./summernote-0.8.18-dist/summernote-lite.js"></script> 
	<script src="./summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script> 
	<link rel="stylesheet" href="${root}resources/css/notebook_q&a_write.css">
</head>
<body>
	<jsp:include page="common/header.jsp"/>
         
    <main role="main" class="container">
    	<div id="title_1" style="text-align: left; margin-bottom: 20px;">
        	<h2 id="title">노트북 Q&A</h2>
      	</div>

		<div id="subtitle" style="text-align: right;">
			<a href="./notebook_q&a_main.html" style="color: slateblue; text-decoration: underline;">노트북 Q&A</a>
			<i class="fas fa-angle-right"></i>
			<a href="./notebook_q&a_write.html" style="color: slateblue; text-decoration: underline;">글쓰기</a>
		</div>

		<div id="title_2" style="text-align: center; margin-bottom: 20px; margin-top: 30px; border-top: 1px solid lightgray;">
			<h4 id="title" style="margin-top: 30px;">글쓰기</h4>
		</div>
      
          
		<form class="form_1" name="form" method="post" action="${root}board/write">
	      	<input type="hidden" name="memId" value="${mem.memId}"/>
	        <input type="hidden" name="boNickName" value="${mem.memNickName}"/>
	        
	        <div class="pt-1" style="border:1px solid gainsboro ; width: 100%; height: 70px; display: flex; align-items: center;">
	          <label style="padding-right: 20px; padding-left: 10px;">제목</label>
	          <input type="text" name="boTitle" placeholder="제목을 입력하세요" style="border-radius: 5px; width: 93%; height: 30px">
	        </div>
	        
	        <div class="pt-1" style="border:1px solid gainsboro ; width: 100%; height: 150px; display: flex; align-items: center;">
	          <label style="padding-right: 20px; padding-left: 10px;">내용</label>
	            <textarea rows="8" cols="145" name ="boContent"></textarea>
	        </div>
	        
	        <div class="pt-1" style="border:1px solid gainsboro ; width: 100%; height: 70px; display: flex; align-items: center; margin-bottom: 20px;">
	          <label style="padding-right: 20px; padding-left: 10px;">비밀번호</label>
	          <input type="password" name="boPassword" placeholder="입력 안할 시 전체공개" style="border-radius: 5px; width: 30%; ">
	        </div> 
	            
	         
			<button class ="btn btn-primary btn-sm" type="submit" style= "background-color: black; color: white; width: 60px; height: 30px">등록</button>      
			<button id="reset" type="reset" style="width: 120px; height: 30px" >전체지우기</button>
			<input type = "button" onclick ="location.href ='notebook_q&a_main.jsp" value = "전체게시글보기" style="width: 120px; height: 30px"> 
		</form>
	</main>
	<!--footer-->
	<jsp:include page="common/footer.jsp"/>  
</body>
</html>