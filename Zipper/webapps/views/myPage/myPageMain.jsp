<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>마이 페이지 메인</title>
<style type="text/css">
	section{
		width: 1024px;
		margin-right:auto;
		margin-left:auto;
	}
	/*웹 제목 스타일*/
	#title {
		text-align: center;
	}
	/*a태그 스타일*/
	div>a {  
		text-decoration: none;
		color: black;
		font-size : 20px;
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
		cursor : pointer;
	}
	/**/
	#colunm {
		width: 250px;
		height: 350px;
		padding: 25px;
		margin : 80px 0 100px 0;
	}
	
	section>div {
		text-align: center;
		border-left: 1px solid black;
		float: left;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<section> <!-- 전체메뉴-->

		<h1 id="title">MY PAGE</h1>
		<br /><br />
		<hr style="width: 95%; border: solid 0.3px black;">
	
		<div id="colunm" style="border-left: none;">

			<h3>내 정보</h3>
			<br />
			<br /> 
			<br />
			<br />
			<a onclick="goUpdateInfo()">수정 하기</a>

		</div>
		
		<div id="colunm">
			<h3>커뮤니티</h3>
			<br />
			<br />
			<a onclick="goMyZip()"><%= m.getMnick() %>.ZIP</a>
			<br /> <br /> 
			<a onclick="goScrapZip()">SCRAP.ZIP</a>
			<br /><br />
			<a onclick="goClassList()"><%= m.getMnick() %>.CLASS</a>
			<br /> <br /> 
			<a onclick="goClassScrap()">SCRAP.CLASS</a> 
			
		</div>

		<div id="colunm">
			<h3>내 구매내역</h3>
			<br />
			<br /> 
			<a onclick="goPayment()">결제 내역</a>
			<br /> 
			<br /> 
			<a onclick="goCanclePay()">취소 / 환불</a>
		</div>


		<div id="colunm">
			<h3>문의 내역</h3>
			<br />
			<br />
			<br />
			<br />
			<a onclick="goManToMan()">1 : 1 문의 내역</a>
		</div>

	<script>
		function goUpdateInfo() { 	// 정보 수정
			location.href = '<%= request.getContextPath() %>/views/myPage/updateInfo.jsp'; 
		}
		function goClassScrap() { 	// 클래스 스크랩
			location.href = '<%= request.getContextPath() %>/scrapCl.sc';
		}
		function goClassList() { 	//수강중 클래스 수정 필요
			location.href = '<%= request.getContextPath() %>/classingList.cl?mno=<%= m.getMno() %>';
		}
		function goScrapZip() { 	//게시글 스크랩 수정 필요
			location.href = '<%= request.getContextPath() %>/#';
		}
		function goMyZip() { 		//내 zip페이지
			location.href = '<%= request.getContextPath() %>/selectList.tn';
		}
		function goPayment() { 		//결제내역 수정필요
			location.href = '<%= request.getContextPath() %>/#';
		}
		function goCanclePay() { 	//취소환불 수정필요
			location.href = '<%= request.getContextPath() %>/#';
		}
		function goManToMan() { 	// 1:1문의
			location.href = '<%= request.getContextPath() %>/selecList.qo';
		}
	</script>
	
	</section>
</body>
</html>