<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<style>
	
	section {
		position : absolute;
		top : 0;
		/* height : 100vh; */
		width : 100%;
		clear : both;
	}
	
	section>article {
		/* border : 1px solid black; */
		float : left;
		height : 100vh;
		width : 33%;
		text-align : center;
	}
	
	section>article.class {
		width : 34%;
		background : lightgrey;
	}
	
	section>article.zippop{
		background : lightblue;
	}
	
	section>article.guide{
		background : lightgreen;	
	}
	
	section>article>a.selectMenu {
		display : inline-block;
		
	}
	/* 배경 호버시 투명도 */
	section>article:hover{
		opacity: 0.5;
		cursor: pointer;
	}
	article>h1:nth-of-type(1) {
		margin-top : 50vh;
	}
	
</style>
</head>
<body>

	<%@ include file="views/common/header.jsp" %>
	
	<section>
		<article class="zippop" onclick="goZippop();">
			<h1>ZIP POP</h1>
			<br><br><br>
			<h1>+</h1>
		</article>
		<article class="class" onclick="goClass();">
			<h1>CLASS</h1>
			<br><br><br>
			<h1>+</h1>
		</article>
		<article class="guide" onclick="goGuide();">
			<h1>GUIDE</h1>
			<br><br><br>
			<h1>+</h1>
		</article>
	</section>
	
	<%@ include file="views/common/footer.jsp" %>

	<script>
		function goZippop() {
			location.href = "<%= request.getContextPath() %>/views/community/zippop.jsp";
		};
		function goClass() {
			location.href = "<%= request.getContextPath() %>/views/class/class.jsp";
		};
		function goGuide() {
			location.href = "<%= request.getContextPath() %>/views/community/guide.jsp";
		};
	</script>
</body>
</html>