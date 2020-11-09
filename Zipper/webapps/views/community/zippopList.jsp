<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zip Pop 목록</title>

<style type="text/css">
	
	section { 
		width: 1024px;
      	margin-left: auto;
      	margin-right: auto;
      	position: relative;
      	top: 30px;
   }
   
   
	#back {
		position : absolute;
		left : 950px;
		height : 80px;
		width: 80px;
		position:relative;
		top: -70px;		
	}
	
	#back:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
		
	#title {
		margin-top: 100px;
		text-align: center;
	}
		
	
	.top {
		height :170px;
		position: fixed; 
		width: 1024px;
		top: 30px;
	}
  
	.left_page {
		display: inline-block;
		margin-top: 100px;
	
	}
	.right_page {
		position: fixed;
		display: inline-block;
		rigth: 30%;
		margin-left: 20px; 
		margin-top: 100px;
		 
	}
 	
    .outer{
		width : 1000px;
		height : auto;		
		color : black;
		margin-left : auto;
		margin-right : auto;
		margin-top : 50px;
	}
	
	.thumbnailArea {
		width:760px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
	}
	.thumb-list {
		width:220px;
		border:1px solid white;
		display:inline-block;
		margin:10px;
		align:center;
	}
	.thumb-list:hover {
		opacity:0.8;
		cursor:pointer;
	}    
			
	button {
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
		cursor: pointer;
	}
	
	.tabcontent_wrap {
		border: 2px solid black;
		width: 650px;
	}
	
	.page_wrap {
		paddig-top: 100px;
	}


</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<section>
		<div class="top" style=" top: 100; background-color: white; border-bottom: 1px solid black;">
			<div class="outer">
			<h2 id="title">ZIP POP</h2>
			
			<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
				alt="class1" id="back" onclick="goMain()"> 
		</div>
		
		<div class="thumbnailArea">
			
			
				<div class="thumb-list" align="center">
					<div>
					</div>
					

			<br><br>
			
			<% if(m != null) { %>
				
				<button onclick="location.href='views/thumbnail/thumbnailInsertForm.jsp'">작성하기</button>
				
			<% } %>
		</div>
	</div>

	</section>
	<br />
	<br />
	<br />

			<% if(m != null) { %>
				
				<button onclick="location.href='views/writer/ZippopWrite.jsp'">작성하기</button>
				
			<% } %>	



	<script>
	function goMain() { 
		location.href = '<%= request.getContextPath() %>/index.jsp'; 
	}		
	</script>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>