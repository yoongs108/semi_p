<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ page import="java.util.*, com.zipper.classMain.model.vo.*, com.zipper.board.model.vo.* " %>
    <%
    ArrayList<ClassList> cList = (ArrayList<ClassList>)request.getAttribute("cList");
    ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스</title>
<style>


/* 캐러셀 css */

    .carouselBox{
        width: 1024px;
      	margin-left:auto;
     	margin-right:auto;  
        
    }  

    .carousel {
        text-align: right;
     	margin-top: 50px;
       
    }
    
    .cover {
		position: absolute;
    	width: 1024px;
        height: 450px;
        background: black;
        padding: 5px;
        opacity: 0.2;
    }
    
    .carousel_img{
        width: 1024px;
        height: 450px;
    }
    
    .carousel_txt {
	  	color: white;
	  	font-size: 30px;
	  	padding: 0 30px;
	 	position: absolute;
	 	bottom: 350px;
	  	width: 1024px;	
	  	text-align: right;
	    z-index: 3;
	}
    
    .carousel_btn{
    	position: absolute;
        width: 1024px;
        margin-top: 200px;
        color: white;
        font-size: 4em;
        z-index: 2;
    }
    
	.btn_left, .btn_right {
		cursor: pointer;
		position: absolute;
		top: 50%;
		width: auto;
		/* margin-top: -22px; */
		padding: 16px;
		color: black;
		font-weight: bold;
		font-size: 18px;
		transition: 0.6s ease;
		border-radius: 0 3px 3px 0;
		user-select: none;
		text-decoration: none;

	}

	.btn_right {
		right: 0;
		border-radius: 3px 0 0 3px;
	}

	.dotBox {
		margin-top: 30px;
	}

	.dot {
		cursor: pointer;
		height: 15px;
		width: 15px;
		margin: 0 2px;
		border: 1px solid black;
		border-radius: 50%;
		display: inline-block;
		transition: background-color 0.6s ease;
	}
 
	.active, .dot:hover {
		background-color : black;
	}
    
   /* ---------------------------- */ 
    
	section {
		width: 1024px;
      	margin-left:auto;
      	margin-right:auto;
      
   }
   
	.page {
		margin-top: 50px;
	}
	
   .top {
        height :50px;
		top:0px;
		width: 1024px; 	
	}   

	.title {
		text-align: center;
	}

	#back{
	position : absolute;
	top : 100px;
	left : 950px;
	height : 80px;
	width: 80px;
	position:relative;
	top:-110%;
	}
	
	#back:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
	
   	.classMain { 
		width: 1024px;
		height: 120px;
		background-color: black;
		color: white;
		
   	}
   	
   	.classMainDiv {
		padding-left: 30px;
   	}
        
    .classMain_classBox {
       	width: 1024px;
		margin-left : auto;
		margin-right : auto;    	
		
    	}
    	
    .class_imgBox_wrap {
       	display: inline-block;
       	width: 1024px;
		height:auto;
    }
    
    .class_imgBox {
    	width: 240px;
    	margin: 30px 8px 50px 5px;
        display: inline-block;
        	
    }
  
    section button {
		width: 100px;
		height: 50px;
		background-color: white;
		border: none;
		cursor: pointer;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section>	
	 	<div class="carouselBox">
	
			<div class="top" style="border-bottom: 1px solid black;">
				<h2 class="title" align="center">CLASS</h2>
				<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
					alt="class1" id="back" onclick="goMain()"> 
			</div>
		
			<div class="page">
				<div class="carouselBox">
	            	<div class="carousel_btn">
						<a style="text-decoration: none;" class="btn_left" onclick="moveSlides(-1)">&#10094;</a>
						<a style="text-decoration: none;" class="btn_right" onclick="moveSlides(1)">&#10095;</a>
		            </div>
		            
	            
	            	<div class="carousel_warp">
		                <div class="carousel">
		               		<div class="cover"></div>
		                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/m.jpg" />
		                    <div class="carousel_txt"><h2>마크라메, <br />어디까지 해봤니?</h2></div>
		                </div>
	                
	                
		                <div class="carousel">
		                	<div class="cover"></div>
		                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/t.jpg" />
		                    <div class="carousel_txt"><h2>너 시트지 붙여? <br /> 난 타일 붙여!</h2></div>
		                </div>
	                
		                <div class="carousel">
		                	<div class="cover"></div>
		                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/h.jpg" />
		                    <div class="carousel_txt"><h2>드레스룸을 쇼룸처럼! <br />분위기 끝판왕 행거 만들기</h2> </div>
		                </div>
	                	<div class="carousel">
		               		<div class="cover"></div>
		                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/m.jpg" />
		                    <div class="carousel_txt"><h2>마크라메, <br />어디까지 해봤니?</h2></div>
		                </div>
	                
		                <div class="carousel">
		                	<div class="cover"></div>
		                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/t.jpg" />
		                    <div class="carousel_txt"><h2>너 시트지 붙여? <br /> 난 타일 붙여!</h2></div>
		                </div>
	                
		                <div class="carousel">
		                	<div class="cover"></div>
		                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/h.jpg" />
		                    <div class="carousel_txt"><h2>드레스룸을 쇼룸처럼! <br />분위기 끝판왕 행거 만들기</h2> </div>
		                </div>
	            	</div>
	    
	       		</div>
	       	</div>
		</div>
	
		<div class="dotBox" style="text-align:center">
      	<div class="dot" onclick="currentSlide(0)"></div>
      	<div class="dot" onclick="currentSlide(1)"></div>
      	<div class="dot" onclick="currentSlide(2)"></div>
      	<div class="dot" onclick="currentSlide(3)"></div>
      	<div class="dot" onclick="currentSlide(4)"></div>
      	<div class="dot" onclick="currentSlide(5)"></div>
	</div>
	
	
<!-- 캐러셀 끝 -->
	<br />
	<hr width="100%" />
	<br /><br />
	

	
	
	<table class="classMain">
	<tr>
		<td>
			<div class="classMainDiv">
				<h3 >준비물 까지 챙겨주는 온라인 클래스</h3>
				- 누구나 쉽고 재미있게 예쁜 집에 살수 있다는 가치를 함께 만들어 갑니다
			</div>
		</td>
		<td>
			<% if(m != null && m.getMid().equals("admin")) { %>
				
				<button class="write" style="color : black;" onclick="classWriter()">작성하기</button>
				
			<% } %>	
			
		</td>
	</tr>
		
	</table>
	
	<div class="classMain_classBox">
		<div class="class_imgBox_wrap" >
		<% for(ClassList classList : cList) { %>
			<div class="class_imgBox" >
				<div>
					<input type="hidden" name="cno" value="<%= classList.getCno()%>"/> 
					<img class="class_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/<%= classList.getFileNewName()%>"
					width="240px" height="150px"/>	
					<hr />
				</div>
				<p>
				<%= classList.getCname() %> <br />
				<%= classList.getPrice() %> 원
				</p>
			</div>
		<% } %>

		</div>
	</div> 
	
	
</section>

	

	<script>
	
		// 글쓰기페이지
		function classWriter() {
			location.href = "<%= request.getContextPath() %>/views/writer/classWrite.jsp";
		}
	
	
	
		// 클래스상세페이지
		$(function () {
			$('.class_imgBox').click(function () {
				var cno = $(this).find('input').val();
				location.href ='<%= request.getContextPath()%>/selectClass.sc?cno=' + cno;
			});
		});
		
		
		// 메인페이지 
		function goMain() { 
			location.href = '<%= request.getContextPath() %>/index.jsp'; 
		}
	
		
		// 캐러셀 
		    var slideIndex = 0; //slide index

   	// HTML 로드가 끝난 후 동작
	window.onload=function(){
    showSlides(slideIndex);

	// Auto Move Slide
     var sec = 2000;
     setInterval(function(){
	     slideIndex++;
	     showSlides(slideIndex);

		}, sec);
	}


	// Next/previous controls
	function moveSlides(n) {
		slideIndex = slideIndex + n
		showSlides(slideIndex);
	}

	// Thumbnail image controls
	function currentSlide(n) {
		slideIndex = n;
		showSlides(slideIndex);
	}

	function showSlides(n) {

		var slides = document.getElementsByClassName("carousel");
		var dots = document.getElementsByClassName("dot");
		var size = slides.length;

	   	if ((n+1) > size) {
	    	slideIndex = 0; n = 0;
	    }else if (n < 0) {
	    	slideIndex = (size-1);
	    	n = (size-1);
	    }

	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	
	for (i = 0; i < dots.length; i++) {
       dots[i].className = dots[i].className.replace(" active", "");
	}

	slides[n].style.display = "block";
	dots[n].className += " active";
	}
		
	</script>







	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>