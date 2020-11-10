<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ page import="java.util.*, com.zipper.classMain.model.vo.*, com.zipper.thumb.model.vo.* " %>
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
	
	.titleBox>img {
        width: 1024px;
      	margin-left:auto;
     	margin-right:auto;  	
	}   
   
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
	    position: absolute; 
	    color: white;
	    top: 25px;
	    right: 30px;
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
    
    .btn_left{
       	position: absolute;
        width: 50px;
        left: 5px;
        border: none;
        background: none;
        cursor: pointer;
    }
    
    .btn_right{
        position: absolute;
        width: 50px;
        right: 5px;
        border: none;
        background: none;
        cursor: pointer;
    }
    
   /*  ----------------------------------------*/ 

	section {
		width: 1024px;
      	margin-left:auto;
      	margin-right:auto;
      
   }
   
	 #back{
		position : absolute;
		top : 100px;
		right : 160px;
		height : 80px;
		width: 80px;
		
	}
	
	#back:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
	
   	.classMain { 
		width: 1024px;
		height: 120px;
		padding-top: 10px;
		padding-left: 30px;
		background-color: black;
		color: white;
		
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
    	margin: 30px;
    }
    
    .class_imgBox {
    	width: 300px;
    	margin: 5px;
        display: inline-block;
        	
    }
    
    .write {
		position : absolute;
		top : 800px;
		right : 160px;
    }
    
    
    button {
		width: 100px;
		height: 50px;
		background-color: white;
		border: none;
		color: white;
		cursor: pointer;
	}
	
	
    
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<div class="carouselBox">
	
		<div class="titleBox" style="border-bottom: 1px solid black;">
			<h2 id="title" align="center">CLASS</h2>
			<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
				alt="class1" id="back" onclick="goMain()"> 
		</div>
		
		
        <div class="main">
            <div class="carousel_btn">
                <button class="btn_left" onclick="plusDivs(-1)">&#10094;</button>
                <button class="btn_right" onclick="plusDivs(1)">&#10095;</button>
            </div>
            
            
            <div class="carousel_warp">
                <div class="carousel">
               	<div class="cover"></div>
                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/m.jpg" />
                    <div class="carousel_txt">
                    	<h2>마크라메, <br />어디까지 해봤니?</h2>
                    </div>
                </div>
                
                <div class="carousel">
                	<div class="cover"></div>
                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/t.jpg" />
                    <div class="carousel_txt">
                    	<h2>너 시트지 붙여? <br /> 난 타일 붙여!</h2>
                    </div>
                </div>
                
                <div class="carousel">
                	<div class="cover"></div>
                    <img class="carousel_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/h.jpg" />
                    <div class="carousel_txt">
                    	<h2>드레스룸을 쇼룸처럼! <br />분위기 끝판왕 행거 만들기</h2>
                    </div>
                </div>
                
            </div>
    
       	</div>
	</div>
<!-- 캐러셀 끝 -->
	<br />
	<hr />
	<br /><br />
	
<section>
	
	<div class="classMain">
		<p><h3>준비물 까지 챙겨주는 온라인 클래스</h3> - 누구나 쉽고 재미있게 예쁜 집에 살수 있다는 가치를 함께 만들어 갑니다</p>
		
		<% if(m != null && m.getMid().equals("admin")) { %>
		
		<button class="write" style="color : black;" onclick="classWriter()">작성하기</button>
		
	<% } %>	
	</div>	
	<div class="classMain_classBox">
		<div class="class_imgBox_wrap" >
		<% for(ClassList classList : cList) { %>
			<div class="class_imgBox" >
				<div>
					<input type="hidden" name="cno" value="<%= classList.getCno()%>"/> 
					<img class="class_img" src="<%=request.getContextPath()%>/resources/images/fileUpload/<%= classList.getFileNewName()%>"
					width="300px" height="200px"/>	
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
		$(function classWriter() {
			location.href = "<%= request.getContextPath() %>/views/writer/classWrite.jsp";
		});
	
	
	
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
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
			
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("carousel");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
			
		}
		
		
		
		
	</script>







	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>