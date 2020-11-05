<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Zippop</title>
<style>

	section {
		width: 1024px;
		margin-left:auto;
		margin-right:auto;
	}


	#reverseBtn {
		background: white;
		width: 50px;
		height: 50px;
		border: 0px;
		left: 85%;
		position:relative;
		top:-190%;
	}
	
	#reverseImg {
		width: 80px;
		height: 80px;
		border: 0px;
	}
	
	div {
		height:30px;
	}
	
	#basicInfo {
		width: 100%;
		height: 500px;
		background: pink;
	}
</style>
<script>
	function moveMain() {
		$(this).on('click', function() {
			location.href = "myPageMain.jsp";
		});
	}
	
</script>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<section>
		<div>
			<h1 align="center"><%= m.getMnick() %>.ZIP</h1>
			<button id="reverseBtn" onclick="moveMain();">
				<img id="reverseImg" src="../../resources/images/common/backButton.png" alt="뒤로가기" />
			</button>
		</div>
		<hr style="border:1px solid black;">
	
		<div id="basicInfo">
			<div id="profileArea"></div>
			<div id="userCommentArea"></div>
		</div>
	
	</section>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>