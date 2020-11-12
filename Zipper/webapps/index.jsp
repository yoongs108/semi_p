<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<!--Chrome, Safari, IE -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/images/common/logo2.ico" type="image/x-icon">
<!-- Firefox, Opera  -->
<link rel="icon" href="<%= request.getContextPath() %>/resources/images/common/logo2.ico" type="image/x-icon">
<style>

	section {
		position : absolute;
		top : 0;
		height : 100vh;
		width : 100%;
		clear : both;
		overflow: hidden;
	}
	
	section>article {
		float : left;
		height : 100vh;
		width : 33.3%;
		text-align : center;
		overflow : hidden;
	}
	
	.zippop{
		background-image : url('<%= request.getContextPath() %>/resources/images/common/3.jpg');
		background-size: cover;
		overflow: hidden; 
		transform: scale(1.0);        
		transition: transform .8s; 
	}
	
	.class {
		background-image : url('<%= request.getContextPath() %>/resources/images/common/sofa.jpeg');
		background-size: cover;
   		overflow: hidden;   
   		transform: scale(1.0);        
		transition: transform .8s;
	}
	
	.guide{
		background-image :url('<%= request.getContextPath() %>/resources/images/common/1.jpeg');
		background-size: cover;
		overflow: hidden; 
		transform: scale(1.0);        
		transition: transform .8s; 
	}
	
	section>article>a.selectMenu {
		display : inline-block;
	}
	/* 배경 호버시 투명도 */
	section>article:hover{
		cursor: pointer;
		transform:scale(1.1);
		transition: transform .9s;
	}
	
	section>article:hover .title{
		color : black;
		transform:scale(1.3);
		transition: transform .9s;
	}
	section>article:hover .sub{
		color : black;
		transform:scale(1.8);
		transition: transform .9s;
	}
	article>h1:nth-of-type(1) {
		margin-top : 50vh;
	}
	.title {
		font-weight: bold;
	}
</style>
</head>
<body>

	<%@ include file="views/common/header.jsp" %>
	
	<section>
		<article class="zippop" onclick="goZippop();">
			<h1 class="title">ZIP POP</h1>
			<br><br><br>
			<h1 class="sub">+</h1>
		</article>
		<article class="class" onclick="goClass();">
			<h1 class="title">CLASS</h1>
			<br><br><br>
			<h1 class="sub">+</h1>
		</article>
		<article class="guide" onclick="goGuide();">
			<h1 class="title">GUIDE</h1>
			<br><br><br>
			<h1 class="sub">+</h1>
		</article>
	</section>

	<script>
		function goZippop() {
			location.href = "<%= request.getContextPath() %>/zippop.zp";
		};
		function goClass() {
			location.href = "<%= request.getContextPath() %>/selectList.cl";
		};
		function goGuide() {
			location.href = "<%= request.getContextPath() %>/selectList.gu";
		};
	</script>
</body>
</html>