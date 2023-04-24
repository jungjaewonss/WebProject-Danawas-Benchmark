<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>프로필 업로드</title>
	<script type="text/javascript">
		$(document).ready(function(){
			if(${!empty msg}){
				alert('${msg}');
			}
		});
	</script>
</head>
<body>
	<div class="container">
  	<h2>프로필등록</h2>
  
  	<div class="panel panel-default">
    <div class="panel-heading">프로필등록</div>
    <div class="panel-body">  
	    <form action="${root}member/ProfileUpdate" method="post" enctype="multipart/form-data">	    	
	    	<input type ="hidden" name="memIdx" value="${mem.memIdx}">	    	
	    	<table class="table table-bordered" style="text-align : center; boarder : 1px solid black">
	    		<tr>
	    			<td style ="width:110px; vertical-align : middle">아이디</td>
	    			<td>${mem.memId}</td>
	    		</tr>
	    		
	    		<tr>
	    			<td style="width:110px; vertical-align : middle"" >사진업로드</td>
	    			<td colspan="2">
		    			<span class="btn btn-default">
		    				이미지를 업로드하세요. 
		    				<input type ="file" name="memProfile"/>
		    			</span>	    			
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<td colspan="2" style="text-align:left;">
	    				<input type="submit" class="btn btn-primary byn-sm pull-right" value="등록"/>
	    			</td>	    		
	    		</tr>
	    	</table>	    	
	    </form>
	</div>
</body>
</html>