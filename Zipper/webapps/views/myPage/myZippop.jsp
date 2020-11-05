<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>My Zippop</title>
<style>
	#reverseBtn {
		background: white;
		width: 30px;
		height: 30px;
		border: 0px;
		left: 85%;
		position:relative;
	}
	
	
	#reverseImg {
		width: 30px;
		height: 30px;
		border: 0px;
	}
	
	div {
		height:500px;
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
	
	<h1 align="center"><%= m.getUserName() %>.ZIP</h1>
	<button id="reverseBtn" onclick="moveMain();">
		<img id="reverseImg" src="../../resources/images/reverse_btn.png" alt="뒤로가기" />
	</button>
	<hr />
	
	<div>
	
	</div>
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>