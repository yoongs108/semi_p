<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	/* 비디오스타일 */
	.videoArea{
		margin-top : 40px;
		padding-bottom : 40px;
		border-bottom : 1px solid black;
	}
	video{
		width : 100%;
		height : auto;
		border : 1px solid black;
	}
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp"%>
	<section>
		<!-- 페이지 이름 부분 -->
		<div class="title" style="border-bottom : 1px solid black;">
		<h2 id="title">CLASS</h2>
		
		<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="class1" id="back" onclick="history.go(-1)"> 
		</div>
		
		<div class="videoArea">
			<video src="#" controls>저희 사이트는 크롬에 최적화 되어있습니다^ㅇ^</video>
		</div>
		
		
		
		<script>
		
		</script>
	</section>
	
</body>
</html>