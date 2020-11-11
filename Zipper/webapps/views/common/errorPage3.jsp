<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String msg = (String)request.getAttribute("error-msg");
	Exception e = (Exception)request.getAttribute("exception");
	// 일반적으로 jsp에 사용되는 exception 내장 객체는 jspException 클래스를 활용한다.
	// 따라서 사용자 정의 예외를 구현할 때에는 Exception 객체를 직접 선언하여 사용하여야 한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service ERROR</title>
<style>
	section {
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
      
		border : 1px solid black;
   }
	.outer{
		margin-left : 37%;
		width : 30%;
		
	}
	.outer:hover #hmm{
		color: red;
		cursor: help;
	}
	#hmm{
		text-size : 20px;
		text-weight : bold;
		align : center;
	}
	h3{
		text-align : center;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<section>
		<div class="outer">
			<p id="hmm">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;⠰⡿⠿⠛⠛⠻⠿⣷<br />
				⠀⠀⠀⠀⠀⠀⣀⣄⡀⠀⠀⠀⠀⢀⣀⣀⣤⣄⣀⡀<br />
				⠀⠀⠀⠀⠀⢸⣿⣿⣷⠀⠀⠀⠀⠛⠛⣿⣿⣿⡛⠿⠷<br />
				⠀⠀⠀⠀⠀⠘⠿⠿⠋⠀⠀⠀⠀⠀⠀⣿⣿⣿⠇<br />
				⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁<br />
				⠀⠀⠀⠀⣿⣷⣄⠀⢶⣶⣷⣶⣶⣤⣀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;흠...흥미롭군요<br />			
				⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠈⠙⠻⠗<br />
				⠀⠀⠀⣰⣿⣿⣿⠀⠀⠀⠀⢀⣀⣠⣤⣴⣶⡄<br />
				⠀⣠⣾⣿⣿⣿⣥⣶⣶⣿⣿⣿⣿⣿⠿⠿⠛⠃<br />
				⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄<br />
				⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁<br />
				⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁<br />
				⠀⠀⠛⢿⣿⣿⣿⣿⣿⣿⡿⠟<br />
				⠀⠀⠀⠀⠀⠉⠉⠉<br />
			</p>
		</div>
		<h3><span>앗...</span>잘못된 전송값을 받았습니다.</h3>
	</section>
<%@ include file="../common/footer.jsp" %>
</body>
</html>