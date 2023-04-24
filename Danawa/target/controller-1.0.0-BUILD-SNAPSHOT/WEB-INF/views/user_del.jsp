<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "Danawa.Project1.Dao.UserDAO"%>
    <%@ page import = "java.io.PrintWriter"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/secedeMember.css">
    <title>Document</title>
   <link rel="stylesheet" href="/resources/css/user_del.css">
</head>
<body>
    <div id="wrap">
        <div id="container">
            <div id="header">
                <a href="http://www.danawa.com" class="logo">
                    <img src="http://guide.danawa.com/pcweb/download/danawa_RGB.png">
                </a>
                <h2 class="logo-txt">회원 탈퇴</h2>
            </div>

            <div class="check_top">
            <h3 class="title">아래 내용을 확인해주시기 바랍니다.</h3>
            <p class="txt">1. 탈퇴한 아이디는 재사용 및 복구가 불가능합니다.</p>
            <p class="txt">2. 다나와 회원을 탈퇴하여도 그동안 작성한 게시물은 삭제되지 않습니다.<br/>
               게시물 삭제를 원하는 경우 회원 탈퇴 전 직접 삭제해야 합니다.</p>
         </div>

            <div class="check_content">
         
         
         
            <form action="/member/delete" method="post" id="danawa-member-checkPwd-form-id">
               <div class="chk_form">     
                  <%
                  String email = (String)request.getAttribute("email");
                  
                  %>
                  <input type ="hidden" value = <%=email %> name ="email"> 
               </div>
               <div class="chk_form">
                  <div class="chk_txt"><label for="nowPassword">아이디</label></div>
                  <div class="chk_info">
                    <b><%=email %></b>
                                </div>
               </div>
               
               <div class="chk_form">
                  <div class="chk_txt"><label for="nowPassword">비밀번호</label></div>
                  <div class="chk_info">
                     <input type="password" id="nowPassword" name="pwd" class="chk_pw_ipt">
                  </div>
               </div>
              
           
             
         </div>

                <div class="btn_wrap">
          <%if(session.getAttribute("email") != null){ %>
         <a href="/member/getlogin" class="btn_submit cancel">취소</a> 
         <%} %>
          
          <%if(session.getAttribute("email") == null){ %>
         <a href="/" class="btn_submit cancel">취소</a> 
         <%} %>
         
            
         
           <a><input type = "submit"  class="btn_submit accept" id="danawa-member-checkPwd-form-submit" value = "확인" ></a>
       
         </div>
           </form>
        </div>
    </div>
</body>
</html>