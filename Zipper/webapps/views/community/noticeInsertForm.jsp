<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 작성 폼 (관리자만)</title>
<style>
	#back{
      position : absolute;
      top : 100px;
      left : 950px;
      height : 80px;
      width: 80px;
      position:relative;
      top:-210%;
   }
   
   #back:hover{
      cursor: pointer;
      transform: scale(1.2);
   }
   
   section {
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body id="body">
	<section> 
 	<%@ include file="/views/common/header.jsp" %>
 	<h1> NOTICE </h1>
 	<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="notice" id="back" onclick="goMyPageMain()"> 
		&nbsp;&nbsp;&nbsp;
		
	<hr style="width: 100%; border: solid 0.3px black;">
 	<br>
 	
 	
	</section>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>