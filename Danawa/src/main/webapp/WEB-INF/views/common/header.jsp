<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}/"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${root}resources/css/header.css" />
</head>
<body>
	<div class="content1">
    <div class="headerwrap">
    	<header>            
	        <div class="logo">          
	            <a href="${root}"><img src="http://img.danawa.com/new/danawa_main/v1/img/ciLogger_20220118_03_23_31.jpg"
	           alt="logo"></a>             
	        </div>


	        <div class="input">
	             
	             <form action="${root}notebook/textsearch">            
	            <input type="text" id="text" name="mainSearch"placeholder="♥♥♥♥ 2022년 새복많이 받으세요.♥♥♥♥" style="text-align:center;">
	            <input type="submit"value="검색" id="hiddensubmit"/>
	            </form>	            
	        </div>

			<div class="icons">               	
				<c:if test="${empty mem}">
					<div>
			           <a href="${root}member/loginForm" id="menu_1"><i class="fa-solid fa-door-open"></i>로그인</i></a>
			           <a href="${root}member/joinForm"> <i class="fas fa-heart">회원가입</i></a>                                   
					</div>
				</c:if>
				
				<c:if test="${not empty mem}">
					
					<c:if test="${mem.memId ne 'admin'}">
						<div>
				          <c:if test="${empty mem.memProfile}">
				          	<img alt="default" src="${root}resources/img/pepol.jpg" id="profile"/> <b>${mem.memNickName}님 환영합니다</b>	
				          </c:if>
				          
				          <c:if test="${not empty mem.memProfile}">
				          	<img  src="${mem.memProfile}" id="profile" onerror="this.style.display='none'"/>
				          	<img  src="${root}resources/upload/${mem.memProfile}" id="profile" onerror="this.style.display='none'"/> <b>${mem.memNickName}님 환영합니다</b>	
				          </c:if>
				           
				           <a href="${root}member/logout" id="menu_1"><i class="fa-solid fa-door-open"></i>로그아웃</i></a>
				           <a href="${root}member/myPage?memIdx=${mem.memIdx}"> <i class="fas fa-heart">마이페이지</i></a>                                   
						</div>					
					</c:if>
					
					<!--관리자페이지-->
					<c:if test="${mem.memId eq 'admin'}">
						<div>
				          <c:if test="${empty mem.memProfile}">
				          	<img alt="default" src="${root}resources/img/pepol.jpg" id="profile"/> <b>${mem.memNickName}님 환영합니다${mem.memProfile}</b>	
				          </c:if>
				          
				          <c:if test="${not empty mem.memProfile}">
				          	<img alt="error" src="${root}resources/upload/${mem.memProfile}" id="profile"/> <b>${mem.memNickName}님 환영합니다</b>	
				          </c:if>
				           
				           <a href="${root}member/logout" id="menu_1"><i class="fa-solid fa-door-open"></i>로그아웃</i></a>
				           <a href="${root}Crawling"><i class="fas fa-heart">크롤링버튼</i></a>                                   
						</div>					
					</c:if>
				</c:if>		     		       
			</div>
		</header>
	</div>
</div>      
</div>
</header>
</div>
</div>
 
    
    
    
    
	<div id="navwrap">
    	<nav>
        	<ul class="nav_ul">
            	<a href="#"><li class="menuborderbottom" id="allmenus">전체메뉴보기</li></a>
            	<div id="clicknotebook"><a href="${root}notebook/notebookList"><li><span class="menuborderbottom"> 노트북</span> <i class="fas fa-bars" id="hambuger1"></i> </i></i></li></a>	<br>
	            	<div id="clicknotebook_1">             
		                <a href="#>"><div> <span class="menuborder"> <i class="fas fa-laptop"></i> 노트북전체 </span> </div></a>
		                <a href="#"><div> <span class="menuborder"> <i class="fas fa-gamepad"></i> 게이밍노트북 </span> </div></a>
		                <a href="#"><div ><span  class="menuborder"> <i class="fa-solid fa-file"></i> 사무용노트북 </span></div></a>    
		                <a href="#"><div > <span  class="menuborder"> <i class="fab fa-apple" style="color: rgba(255, 0, 0, 0.767);"></i> 애플 맥북 </span></div></a>
	            	</div>
       	 		</div>
            
                       
	            <a href="${root}board/boardList"><li class="menuborderbottom">노트북 Q&A</li></a>
	            <c:if test="${not empty mem}">
	            <a href="${root}member/profileForm"><li class="menuborderbottom">프로필등록</li></a>
	            </c:if>                                
                <div id="clickimpo">
	                <a href="#"><li> <span class="menuborderbottom"> 정보공유</span> <i class="fas fa-bars" id="hambuger2"></i> <br></li></a></br>	             
	                <div id="clickimpo_1">
		                <a href="#"> <div><span class="menuborder"><img src="/img/게시판이미지.png" alt="" style="width: 25px;" id="clickimpo_1img"> 자유게시판 </span></div></a>
		                <a href="#"> <div><span class="menuborder"><img src="/img/게시판이미지.png" alt="" style="width: 25px;" id="clickimpo_1img">   영상게시판 </span></div></a>	
	                </div>
                </div>
        	</ul>
    	</nav>
	</div>


	<div id="Allmenuwrap">
		<div id="Allmenu">
 			<div>     
				<a href="/notebook/pagenum"><div class="svmenu"> 노트북</div></a>
				<a href="#"><li class="Allmenu_menu"><i class="fas fa-laptop"></i> 노트북전체</li></a>
				<a href="#"><li  class="Allmenu_menu"> <i class ="fas fa-gamepad"></i> 게이밍노트북 </li></a>
				<a href="#"><li  class="Allmenu_menu"> <i class="fa-solid fa-file"></i> 사무용노트북</li></a>
				<a href="#"><i class="fab fa-apple" style="color: rgba(255, 0, 0, 0.767);"></i> 애플 맥북</li></a>
			</div>
	
			<div>    
				<a href="${root}board/boardList"><div class="svmenu"> 노트북 Q&A </div></a>
				<a href="/board/mainlist"><li  class="Allmenu_menu"></i> Q&A게시판</li></a>
			</div>
 
			<div>    
				<a href="#"><div class="svmenu"> 다나와굿즈(오픈예정) </div></a>f
				<a href="#"><li  class="Allmenu_menu"> 굿즈구매하기(오픈예정)</li></a>
				<a href="#"><li  class="Allmenu_menu"> NEW  신규굿즈(오픈예정)</li></a>
				<a href="#"><li  class="Allmenu_menu"> Best 인기굿즈(오픈예정)</li></a>
			</div>

			<div>			   
				<div class="svmenu">정보공유 </div>
				<a href="#"><li  class="Allmenu_menu"> <img src="/img/게시판이미지.png" alt="" style="width: 25px;" id="clickimpo_1img">자유게시판</li></a>
				<a href="#"><li  class="Allmenu_menu">영상게시판</li></a>
			</div>

		</div>
	</div>
</body>
</html>