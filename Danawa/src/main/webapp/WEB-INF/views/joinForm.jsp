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
    <link rel="stylesheet" href="${root}resources/css/join.css">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

 <script type="text/javascript"> 		
 	function memIdCheck(){
 		var memId = $("#memId").val();
 		
 		$.ajax({
			url : "${root}member/memIdCheck",
			type : "get",
			dataType : "json", //json형식으로 데이터를받겠다
			data : {"memId" : memId},
			success: function(result){
				console.log(result);
				
				if(result == 1){
					$("#memIdCheck").html("이미 사용중인 아이디입니다.");
					
				}
				else{
					$("#memIdCheck").html("");								
				}				
			} // callback 함수			
		});	
 	}
 	
 	function checkPassword(){
 	var password =	$("#memPassword").val();
 	var password1 =	$("#memPassword1").val();
 	
 	if(password != "" && password1 != ""){
	 	if(password != password1){
	 		$("#pwdcheckresult").html("비밀번호가 일치하지 않습니다.");
	 	}
	 	else{
	 		$("#pwdcheckresult").html("");
	 	}
 	}	
}
 	
 	 function checksubmit(){
 		var memIdCheck = $("#memIdCheck").text();
 		var memPasswordCheck = $("#pwdcheckresult").text();
 		
 		
 		var memId = $("#memId").val();
 		var memPassword = $("#memPassword").val();
 		var memPassword1 = $("#memPassword1").val();
 		
 		var memName = $("#memName").val();
 		var memNickName = $("#memNickName").val();
 		var memPhone = $("#memPhone").val();
 		 		 		 
 		if(memId != "" && memPassword != "" && memPassword1 != "" && memName != "" && memNickName != "" && memPhone !=""){
 			if(memIdCheck == ""  && memPasswordCheck == ""){
 				$("#jsm").attr("disabled" , false);
 				$("#jsm").css("opacity" , 1);
 			}
 			else{
 				$("#jsm").attr("disabled" , true);
 			}
 		}		
 }	 
 </script>
    
</head>


<body>
    <div id="wrap">
        <div id="container">
            <header>
                <a href="http://www.danawa.com" class="logo">
                    <img src="http://guide.danawa.com/pcweb/download/danawa_RGB.png">
                </a>
                <h2 class="logo_txt">회원가입</h2>
            </header>
            
            <div class="join_notice">
                <p>아래 항목을 모두 필수로 입력해주세요.</p>
            </div>
       
       
             <form method="post" action="${root}member/join" onsubmit = "joinFormSubmit(this); return false;">
                <label for="email">아이디</label><br/>
                <input type="text" id="memId" name="memId" placeholder="아이디 입력"  onkeyup="memIdCheck()" onblur="checksubmit()"/><br/>
                <div><b id="memIdCheck"></b></div>
           
                <label for="pw">비밀번호</label><br/>
                <input type="password" id="memPassword" name="memPassword" placeholder="숫자, 영문, 특수문자 포함 8자 이상" onkeyup="checkPassword()" onblur="checksubmit()"/><br/>
               	<b><div id=""></div></b>
                
                
                <label for="pw-check">비밀번호 확인</label><br/>
                <input type="password" id="memPassword1"  placeholder="숫자, 영문, 특수문자 포함 8자 이상" onkeyup="checkPassword()" onblur="checksubmit()" /><br/><div><b id="pwdcheckresult"></b></div>              
                <label for="name">이름</label><br/>
                <input type="text" id="memName" name="memName" placeholder="이름 입력" onblur="checksubmit()"/><br/>
               
               
                <label for="nickname">닉네임</label><br/>
                <input type="text" id="memNickName" name="memNickName" placeholder="1~ 10자 입력해주세요" onblur="checksubmit()"/><br/><div><b  id="nicknamecheckresult"></b></div>                 
                <label for="phone">핸드폰번호</label><br/>
                <input type="text" id="memPhone" name="memPhone" placeholder="숫자만 입력해주세요" onblur="checksubmit()"/><br/>
                <button class = "btn_join" id="jsm" disabled="disabled">회원가입</button>
             </form>
        </div>
    </div>   
</body>
</html>