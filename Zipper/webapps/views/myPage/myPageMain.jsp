<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 메인</title>
<style type="text/css">

	#title {
		text-align: center;
	}
	
	div>a:link { 
		text-decoration: none;
		color: black;
		font-size : 16px;
		border: black solid; 
		border-width: 0 0 1px 0;

	 } 
	 
	div>a:visited { 
		text-decoration: none;
		color: black; 
	}
	
	div>a:hover{
		color: black;
		font-weight : bold;
		text-decoration: none;
	}
	
	#colunm {
		width: 25%;
		height: 300px;
		padding: 30px;
	}
	
	#row:after {
		content: "";
		display: table;
	}
	
	section {
		clear: both;
		padding: 60px 25px 60px 25px;
	}
	
	section>div {
		text-align: center;
		border-left: 1px solid black;
		float: left;
		margin-bottom: 70px;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<h2 id="title">MY PAGE</h2>
	<hr style="width: 800px; border: solid 0.5px black;">

	<section> <!-- 전체메뉴-->

		<div id="colunm" style="border-left: none;">

			<h3>내 정보</h3>
			<br />
			<br /> 
			<a href="#">수정 하기</a>

		</div>

		<div id="colunm">
			<h3>커뮤니티</h3>
			<br />
			<br />
			<a href="#">my_CLASS.zip</a> 
			<br /> <br /> 
			<a href="#">이름.CLASS</a>
			<br /> <br /> 
			<a href="myZippop.jsp"><%= m.getUserName() %>.zip</a>
		</div>

		<div id="colunm">
			<h3>내 구매내역</h3>
			<br />
			<br /> 
			<a href="#">결제 내역</a> <br /> <br /> <a href="#">취소 / 환불</a>
		</div>


		<div id="colunm">
			<h3>문의 내역</h3>
			<br />
			<br /> 
			<a href="#">1 : 1 문의 내역</a>
		</div>

	</section>



</body>
</html>