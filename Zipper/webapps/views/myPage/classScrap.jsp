<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>클래스 스크랩 페이지</title>
<style type="text/css">
	/*웹 제목 스타일*/
	section{
		width: 1024px;
		margin-right:auto;
		margin-left:auto;
	}
	* {
 		 box-sizing: border-box;
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
		border-left : 1px solid black;
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
		<h2 id="title">SCRAP.CLASS</h2>
		
		<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="class1" id="back" onclick="goMyPageMain()"> 
		&nbsp;&nbsp;&nbsp;
		
		<hr style="width: 90%; border: solid 1px black;">

		<div class="card"> <!-- 클래스 리스트 폼 -->
			
			<img src="#" alt="class1" id="img" class="splitL">
			
			<div id="container" class="splitR" >
				<h4>수업제목</h4>
				<br />
				<p class="sub">강사명 : </p>
				<p class="sub">수강 기간 : 결제 후 1개월</p>
				<br />
				<p>
				Some text that describes me lorem ipsum ipsum lorem.
				</p>
				<br />
				<p id="price" style="font-size:18px; font-weight : bold;">가격 원 </p>
				
				<button class="button" onclick="goClassInfo()">자세히 보기</button>
				
			</div>
		</div>
		<div class="card"> <!-- 클래스 리스트 폼 -->
			
			<img src="#" alt="class1" id="img" class="splitL">
			
			<div id="container" class="splitR" >
				<h4>수업제목</h4>
				<br />
				<p class="sub">강사명 : </p>
				<p class="sub">수강 기간 : 결제 후 1개월</p>
				<br />
				<p>
				Some text that describes me lorem ipsum ipsum lorem.
				</p>
				<br />
				<p id="price" style="font-size:18px; font-weight : bold;">가격 원 </p>
				
				<button class="button" onclick="goClassInfo()">자세히 보기</button>
				
			</div>
		</div>
		
		<!-- 페이지 버튼 -->
		<script>
		function goClassInfo() { // 정보 수정
			location.href = '<%= request.getContextPath() %>/views/class/classDetail.jsp'; 
		}
		function goMyPageMain() { // 정보 수정
			location.href = '<%= request.getContextPath() %>/views/myPage/myPageMain.jsp'; 
		}
		</script>
		
	</section>
	
</body>
</html>