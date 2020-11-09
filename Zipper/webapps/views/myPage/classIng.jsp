<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.zipper.payment.model.vo.*"%>
<%
	Payment pm = (Payment)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>수강중 클래스 페이지</title>
<style type="text/css">
	/*웹 제목 스타일*/
	section{
		width: 1024px;
		margin-right:auto;
		margin-left:auto;
	}
	.title{
		height : 40px;
	}
	#title {
		text-align: center;
	}
	#back{
		position : absolute;
		top : 100px;
		left : 950px;
		height : 80px;
		width: 80px;
		position:relative;
		top:-160%;
	}
	#back:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
	
	/* 리스트 시작*/
	.card {
		margin-top : 50px;
		margin-left: 100px;
		display : inline-block;
	}
	
	#container {
		border-left : 2px solid black;
		padding-left : 30px;
		width : 600px;
	}
	#img  {
		float : left;
		height : 250px;
		width : 250px;
		border : solid 1px black;
		margin-right : 30px;
		margin-left : 10px;
	}
	.splitL{
		float : left;
	}
	.splitR{
		float : right;
	}
	.splitL:after {
		content: "";
		clear: both;
		display: table;
	}
	.button {
  		border: none;
  		outline: 0;	
		padding: 8px;
		color: white;
		background-color: #000;
		text-align: center;
		cursor: pointer;
		float : right;
		width : 100px;
		margin : 70px 10px -60px 0;
	}
	.button:hover{
		background-color: #555;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section>
		<!-- 페이지 이름 부분 -->
		<div class="title" style="border-bottom : 1px solid black;">
		<h2 id="title"><%= m.getMnick() %>.CLASS</h2>
		
		<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="class1" id="back" onclick="goMyPageMain()"> 

		</div>
		
		<%-- <% for (payment p : list) { %> --%>
		<div class="card"> <!-- 클래스 리스트 폼 -->
			
			<img src="<%= request.getContextPath() %>/resources/images/fileUpload/<%= pm.getFileNewName() %>" 
				alt="class1" id="img" class="splitL">
			
			<div id="container" class="splitR" >
				<br />
				<p style="font-size:16px; font-weight : bold;"><%= pm.getPdate()%> ~ 1개월</p>
				<br />
				<p style="font-size:17px; font-weight : bold;"><%= pm.getCname() %> </p>
				<p style="font-size:14px;"><%= pm.getTotal() %>  원 </p>
				
				<button class="button" onclick="goClassInfo()">자세히 보기</button>
				
			</div>
		</div>
		<%-- <% } %> --%>
		
		
		<!-- 페이지 버튼 -->
		<script>
		function goClassInfo() { // 정보 수정
			location.href = '<%= request.getContextPath() %>'<%= request.getContextPath()%>/selectClass.sc?cno='+<%=pm.getCno()%>;
		}
		function goMyPageMain() { // 메인페이지로 이동
			location.href = '<%= request.getContextPath() %>/views/myPage/myPageMain.jsp'; 
		}
		</script>
		
	</section>
	
</body>
</html>