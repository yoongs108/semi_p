<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.video.model.vo.*, java.util.*"%>
<%
	ArrayList<Video> vlist = (ArrayList<Video>)request.getAttribute("video");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>클래스 비디오 페이지</title>
<style type="text/css">
	/*웹 제목 스타일*/
	section{
		width: 1024px;
		margin-right:auto;
		margin-left:auto;
		margin-bottom : 100px;
	}
	.title{
		height : 40px;
	}
	#title {
		text-align: center;
	}
	/* 페이지 헤더 css*/
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
		margin-left: 120px;
		display : inline-block;
	}
	
	#container {
		border-left : 2px solid black;
		padding-left : 30px;
		width : 600px;
	}
	#img  {
		float : left;
		height : 190px;
		width : 260px;
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
	.sub {
		font-size : 16px;
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
		margin : 0 20% -60px 0;
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
		<h2 id="title">VIDEO.CLASS</h2>
		<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="class1" id="back" onclick="history.go(-1)"> 

		</div>
		<% for(Video v : vlist){ %>
		<div class="card"> <!-- 클래스 리스트 폼 -->

			<video src="<%= request.getContextPath() %>/resources/images/fileUpload/video/<%= v.getVideo() %>" id="img" class="splitL"></video>
			<div id="container" class="splitR" >
				<h4><%= v.getVname() %></h4>
				<br />
				<p class="sub">강사명 : <%= v.getTname() %></p>
				<br />
				<p>
				<%= v.getVtext() %>
				<br />
				<br />
				<br /><br />
				
				<button class="button" onclick="goVideodetail(<%= v.getVno() %>)">강의 보기</button>
				
			</div>
		</div>
		<% } %>
		
		<!-- 페이지 버튼 -->
		<script>
		function goVideodetail(vno) { // 정보 수정
			location.href = '<%= request.getContextPath() %>/selectOne.vi?vno='+vno; 
		}
		</script>
		
	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>