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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
      <script src="slide.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${root}resources/css/loginmain.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script type="text/javascript">    	
    	$(document).ready(function(){
    		if(${not empty msg}){   		
    		alert("${msg}");
    	}
    	});   	
    </script>
	
</head>

<body>	
<jsp:include page="common/header.jsp"/>      
    <div class="backgroundimg">
    	<div class="slidewrap" >        
            <div class="slide">               
       			<div id="mainslide">  
					<a href="#"><video autoplay="" muted="" loop="" data-pc-src="https://www.lge.co.kr/kr/images/notebook/md09876826/usp/new_mov_00.mp4" type="video/mp4" playsinline="true" style="background-color: rgb(0, 0, 0);"src="https://www.lge.co.kr/kr/images/notebook/md09876826/usp/new_mov_00.mp4"  __idm_id__="2187266" id="slide1"></video></a>
			           <label for="button2"><i class="fas fa-angle-right" style="font-size: 60px;" id="slideright"></i></label> 
			           <label for="button3"> <i class="fas fa-angle-left"  style="font-size: 60px;" id="slideleft"></i></label>
				</div>  
       
         
			<div class="mainslide">
				<a href="#">  <img src="https://thumb.mt.co.kr/06/2020/10/2020102215481349094_1.jpg/dims/optimize/" alt=""  style="background-color: red;" id="slide2"></a>
				<label for="button3"><i class="fas fa-angle-right" style="font-size: 60px;" id="slideright"></i></label> 
				<label for="button1"> <i class="fas fa-angle-left"  style="font-size: 60px;" id="slideleft"></i></label>
			</div> 
			      
			      
			<div class="mainslide"> 
				<a href="#"> <img src="https://file.mk.co.kr/meet/neds/2020/11/image_readtop_2020_1227320_16066764664450535.jpg" alt="" style="background-color: blue;" id="slide3" ></a>
				<label for="button1"><i class="fas fa-angle-right" style="font-size: 60px;" id="slideright"></i></label> 
				<label for="button2"> <i class="fas fa-angle-left"  style="font-size: 60px;" id="slideleft"></i></label>
			</div>         
		</div>
        </div>
    </div>
  
	<div class="button">
		<div>		          
		<input type="radio" name="button" id="button1" checked class="buttons"  >
		<input type="radio" name="button" id="button2" class="buttons" >
		<input type="radio" name="button" id="button3"  class="buttons">
		</div>
	</div>
    
   
	<div class="content" id="bestcontent">
		<div class="bestwrap">
			<article class="best">
				<h3 ><i class="fas fa-crown" style="color: gold;"></i>삼성상품 <i class="fas fa-crown" style="color: gold;"></i></h3>
			    
			    <div class="bestadd">
			        <a href="${root}notebook/checkNotebook?company=<%="삼성전자"%>" style="font-size: 10px;">전체보기<i class="fas fa-plus"></i></a>
			    </div>
				
				<div class="best1">    
					<a href=""><div id="bigimgborder1"><li><img src="${samsung[0].img}" alt="삼성노트북" class="bigimg"></li></div></a>
					
					<c:forEach items="${samsung}" var="samsung" begin="1" end="4">
						<a href="${root}notebook/detailNoteBook?subject=${samsung.subject}">
						    <li><img src="${samsung.img}" class = "smallimg"></li>
						</a>
					</c:forEach>	                
				</div> 
   
    			<div class="best2">  
			        <a href="#">
			        	<div id="bigimgborder2">
			            	<li><img src="${samsung[5].img}" alt="" class="bigimg"></li>
			       		</div>
			        </a>
       
					<c:forEach items="${samsung}" var="samsung" begin="6" end="9">
						<a href="${root}notebook/detailNoteBook?subject=${samsung.subject}">
							<li><img src="${samsung.img}" class = "smallimg"></li>
				        </a>
					</c:forEach>       
    			</div> 
			</div>
		</article>
	</div>




	<div class="content">
    	<article class="articlegoods">
	        <div>
	            <h3><i class="far fa-thumbs-up" ></i> LG상품 <i class="far fa-thumbs-up"></i></h3>
	     	</div>
	     
		    <div class="bestadd">
		    	<a href="${root}notebook/checkNotebook?company=<%="LG전자"%>" style="font-size: 10px;"  >전체보기<i class="fas fa-plus"></i></a>
		    </div>
    
     		<div class="goodswrap" id="goodswrap1">        
     			<div class="goodsimgborder">
        
			     	<div class="textslide">
				        <h3 class="bestgoods">다나와 추천!!</h3>
				        <p class="bestgoods">LG best노트북 총결산</p>
				        <p style="font-weight: bold;" class="bestgoods">지금 아니면 못살걸? 노트북 구매가즈아!</p>
			        </div>
           
			        <div class="slide1wrap">
			        	<div class="slide1">
				           <div><a href="#"><img src="${lg[0].img}" class="bigimgs" id="opaimg1"></a></div>
				           <div><a href="#"><img src="#" alt="" class="bigimgs" id="opaimg2"></a></div>
				       	   <div><a href="#"><img src="#" alt="" class="bigimgs" id="opaimg3"></a></div>              
			           </div>
			        </div>
        		</div>
     
			     <div class="goods">         
			        <c:forEach items="${lg}" var="lg" begin="1">
			        <a href="${root}notebook/detailNoteBook?subject=${lg.subject}">
			        <li><img src="${lg.img}" alt="" class = "smallimg"></li>
			  		 </a>
			        </c:forEach>
			 	</div>
			</div>
		</article>
	</div>
 
	<div class="content">
    	<article class="articlegoods">
        	<div>
         		<h3><i class="fab fa-github-alt"></i>레노버상품 <i class="fab fa-github-alt"></i></h3>
			</div>
	        
	        <div class="bestadd">
	            <a href="${root}notebook/checkNotebook?company=<%="레노버"%>" style="font-size: 10px;"  >전체보기<i class="fas fa-plus"></i></a>
	        </div>
       
	        <div class="goodswrap">  
				<div class="goods1">           
			       <c:forEach items="${renova}" var="renova" begin="1" end="8">        
			            <a href="${root}notebook/detailNoteBook?subject=${renova.subject}">
			                <li><img src="${renova.img}" alt="" class = "smallimg"></li>
			            </a>
			       </c:forEach>   
	   			</div>
			    
			    <div class="goodsimgborder">
			        <div class="textslide1">
				        <h3 class="bestgoods">best 레노버!!</h3>
				        <p class="bestgoods">레노버 기획전</p>
				        <p style="font-weight: bold;" class="bestgoods">2023년 레노버 구매가즈아!</p>
			   		</div>
		
					<div class="slide2wrap">
						<div class="slide2">
							<div><a href="#"><img src="${renova[0].img}" alt="" class="bigimgs"></a></div>
						    <div><a href="#"><img src="#" alt="" class="bigimgs"></a></div>
						    <div><a href="#"><img src="#" alt="" class="bigimgs"></a></div>
						</div>
					</div> 
				</div>
			</div>        								
		</article>	
	</div>	
</div>
    

	<div>
	    <article class="bestlogo">
	        <h3 >인기쇼핑물</h3>
	        <div class="footerlog">
	            <a href="https://www.gmarket.co.kr/?jaehuid=200011415&cosemkid=go16169957326502414&gclid=EAIaIQobChMIr4XujvDZ9QIVVUFgCh0B2gx5EAAYASAAEgLxXfD%5FBwE"> <img src="http://img.danawa.com/cmpny_info/images/EE128_logo.gif" alt=""></a>
	            <a href="http://www.auction.co.kr/"> <img src="http://img.danawa.com/cmpny_info/images/EE715_logo.gif " alt=""></a>
	            <a href="https://www.etlandmall.co.kr/pc/main/index.do?utm_source=google&utm_medium=SA_keyword_00&utm_campaign=2201_Branding_00&utm_term=%EC%A0%84%EC%9E%90%EB%9E%9C%EB%93%9C&gclid=EAIaIQobChMI8b_FufDZ9QIVUlpgCh2YCgxQEAAYASAAEgIKRvD_BwE"> <img src=" http://img.danawa.com/cmpny_info/images/TJ918_logo.gif " alt=""></a>
	            <a href="https://www.coupang.com/?src=1042016&spec=10304903&addtag=900&ctag=HOME&lptag=%EC%BF%A0%ED%8C%A1&itime=20220131011940&pageType=HOME&pageValue=HOME&wPcid=16419706073002683043839&wRef=www.google.com&wTime=20220131011940&redirect=landing&gclid=EAIaIQobChMIjI38xvDZ9QIVR9iWCh0qbAPOEAAYASAAEgJuXPD_BwE"> <img src=" http://img.danawa.com/cmpny_info/images/TP40F_logo.gif " alt=""></a>
	            <a href="e-himart.co.kr/app/display/showDisplayShop?originReferrer=himartindex"> <img src=" http://img.danawa.com/cmpny_info/images/TJ418_logo.gif" alt=""></a>
	            <a href="https://www.11st.co.kr/?gclid=EAIaIQobChMIg56WsfHZ9QIVUHZgCh2HcQn_EAAYASAAEgLqrPD_BwE&utm_term=E_11%B9%F8%B0%A1.&utm_campaign=%C0%CF%C4%A1+PC&utm_source=%B1%B8%B1%DB_PC_S&utm_medium=%B0%CB%BB%F6"> <img src="http://img.danawa.com/cmpny_info/images/TH201_logo.gif" alt=""></a>
	            <a href="https://www.hmall.com/p/index.do"> <img src=" http://img.danawa.com/cmpny_info/images/ED907_logo.gif" alt=""></a>	
	        </div>
	    </article>	
	</div>
<!-- footer  -->	
<jsp:include page="common/footer.jsp"/>
</body>
</html>