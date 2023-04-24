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
    <link rel="stylesheet" href="css/modifyMember.css">
    <title>updateMemberForm</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="${root}resources/css/user_update.css">
	
	<script type="text/javascript">
	
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
	function updateinfo(){
		var myinfo = $("#modifyForm").serialize();
		
		alert(myinfo);
		 
		$.ajax({
			url : "${root}member/updateInfo",
			type : "post",
			data : myinfo,
			success : function(result){
				if(result == 1){
					alert("정보수정이완료되었습니다.");
					location.href="${root}member/loginForm";
				}
				else{
					alert("??");
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
    <div id="wrap">
        <div id="container">
            <div id="header">
                <a href="http://www.danawa.com" class="logo">
                    <img src="http://guide.danawa.com/pcweb/download/danawa_RGB.png">
                </a>
                <h2 class="logo-txt">회원정보수정</h2>
            </div>

            <div class="modify_wrap">                              
                <form id="modifyForm" name="modifyForm">
	                <table>
	                    <tbody>                   
	                	
	                    	<input type="hidden"name="memIdx"value ="${myinfo.memIdx}"><br/>
	                                        
		                    <tr class="modify_row">
		                        <td class="modify_title">새 비밀번호</td>
		                        <td class="modify_cont">
		                            <input type="password" id="memPassword" name="memPassword" placeholder="새 비밀번호"/><br/>
		                               <div id="pwdresult"></div>
		                        </td>
		                    </tr>
	                    
		                    <tr class="modify_row">
		                        <td class="modify_title">비밀번호 확인</td>
		                        <td class="modify_cont">
		                        	<input type="password" id="memPassword1" placeholder="비밀번호 확인" onblur="checkPassword()"/><br/>
		                        	<div id="pwdcheckresult"></div>
		                        </td>
		                    </tr>
	
		                    <tr class="modify_row">
		                        <td class="modify_title">닉네임</td>
		                        <td class="modify_cont">
		                            <input type="text" id=memNickName name="memNickName" placeholder="닉네임" value="${myinfo.memNickName}"/><br/>
		                            <div id="nicknamecheckresult"></div>
		                         </td>
		                    </tr>                   
	                    </tbody>
	                </table>
                
                <div class="bundle_btn">                
                	<a href="" class="leave_btn">탈퇴하기</a>
                </div>
            </div>

            <div class="btn_wrap">
                <a href="javascript:window.history.back();" class="btn_submit cancel">취소</a>
              <input type = "button" id="danawa-member-modify-form-submit"  class="btn_submit accept" value="확인" onclick="updateinfo()">
            </div>
            
            </form> 
        </div>
    </div>    
</body>
</html>