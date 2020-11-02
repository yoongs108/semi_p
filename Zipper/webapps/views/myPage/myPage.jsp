<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	section div {
		display : inline-block;
		border : 1px solid black;
		width : 300px;
		height : 300px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<section align="center">
	<div>
		<h1>내정보수정</h1>
		<button type="button" onclick="goUpdateInfo()">내정보수정</button>
	</div>
	<div>
		<h1>컨텐츠</h1>
		<button>내 게시글</button>
		<button>내 댓글</button>
		<button>내 클래스</button>
	</div>
	<br />
	<div>
		<h1>내 포인트</h1>
		<button type="button" onclick="goMyPoint()">포인트내역</button>
	</div>
	<div>
		<h1>고객센터</h1>
		<button type="button" onclick="goManToMan()">의견보내기</button>
		<button type="button" onclick="goFAQ()">FAQ</button>
	</div>
	
	<script>
		function goUpdateInfo() {
			location.href = "/SemiProject/views/myPage/UpdateInfo.jsp";
		}
		function goMyPoint() {
			location.href = "/SemiProject/views/myPage/myPoint.jsp";
		}
		function goManToMan() {
			location.href = "/SemiProject/views/myPage/ManToMan.jsp";
		}
		function goFAQ() {
			location.href = "/SemiProject/views/myPage/FAQ.jsp";
		}
	</script>
</section>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>