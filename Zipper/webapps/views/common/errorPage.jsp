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
      margin-top: 30px;
      margin-bottom : 100px;
   }
	.outer{
		margin-left : 35%;
		width : 30%;
	}
	img {
		margin-top : 10px;
		margin-bottom : 10px;
	}
	h2, h3{
		text-align : center;
	}
	.msg{
		text-align : center;
	}
	.msg:hover {
		color : red;
		cursor: help;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<section>
		<h2>ERROR <%-- <%= e.getMessage() %> --%> ;</h2>
		<br />
		<div class="outer">
			<img src="<%= request.getContextPath() %>/resources/images/common/hmm.gif"/>
		</div>
		<h3 class="msg">앗...잘못된 전송값을 받았습니다. <br /><br /> 확인 후 담당자에게 연락해 주세요!</h3>
	</section>
<%@ include file="../common/footer.jsp" %>
</body>
</html>