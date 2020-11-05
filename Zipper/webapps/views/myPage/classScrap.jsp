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
	* {
 		 box-sizing: border-box;
	}
	#title {
		text-align: center;
	}
	#back{
		position : absolute;
		top : 100px;
		right : 100px;
		height : 80px;
		width: 80px;
		float : right;
	}
	
	/* 리스트 시작*/
	.card {
		margin-top :50px;
	}
	
	#container {
		border-left : 1px solid black;
		padding-left : 30px;
		margin-top : 30px;	
		width : 900px;
	}
	#img  {
		float : left;
		height : 330px;
		width : 330px;
		border : solid 1px black;
		margin-right : 50px;
		margin-left : 15%;
	}
	.split{
		float : left;
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
		
		<hr style="width: 85%; border: solid 0.3px black;">

		<div class="card"> <!-- 클래스 리스트 폼 -->
			
			<img src="#" alt="class1" id="img" class="split">
			
			<div id="container" class="split" >
				<h3>수업제목</h3>
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