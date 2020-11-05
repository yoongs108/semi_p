<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	#body{
	width : 1024px;
	margin-left : 10%;
	margin-right : 10%;
	letter-spacing : 2px;
	}
	
	#back{
		float : right;
	}
	
	#listArea{
		width : 100%;
		height : 100%;
	}
	
	table tr{
		height:40px; 
	}
	
	.date{
		text-align : center;
	}
	
	button{
		border : none;
		background : white;
	}
	
	th a{
		margin-left : 50%;
		color : black;
	}
</style>
</head>
<body id="body">
 	<%@ include file="/views/common/header.jsp" %>
 	<h1>NOTICE
 	<button type="button" id="back">
 		<img src ="../../resources/images/back.png" width="40px" height="40px">
 		<a href="#"></a>
 	</button>
 	</h1>
 	
 	<hr>
 	<br>
 	
 	<div class="tableArea">
 	<form action>
 		<table id="listArea">
 		<!-- border은 없앨 예정 보기 쉽게 구분만 잠시 해놓은 것 -->
 		<!-- <col width=0><col width=70% ><cols width=30%> -->
 		<!-- tr>th>td*7 : DB구축 전에 임시용 -->
 		<br><br><br>
 			<tr>
 				<th width="0"><a href="views/community/boardDetail.jsp" > > </a></th>
 					<td class="titleName" width="70%"> 공지사항 title </td>
 					<td name="date" width="30%"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="views/community/boardDetail.jsp" > > </a></th>
 					<td class="titleName"> 공지사항 title </td>
 					<td name="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="views/community/boardDetail.jsp" > > </a></th>
 					<td class="titleName"> 공지사항 title </td>
 					<td name="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="views/community/boardDetail.jsp" > > </a></th>
 					<td class="titleName"> 공지사항 title </td>
 					<td name="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="views/community/boardDetail.jsp" > > </a></th>
 					<td class="titleName"> 공지사항 title </td>
 					<td name="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="views/community/boardDetail.jsp" > > </a></th>
 					<td class="titleName"> 공지사항 title </td>
 					<td name="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="views/community/boardDetail.jsp" > > </a></th>
 					<td class="titleName"> 공지사항 title </td>
 					<td name="date"> 공지 작성일 </td>
 			</tr>
 		
 		</table>
 	</form>
 	</div>
 	<div>
			<!-- 작성자 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 		<% if(m != null && m.getUserId().equals("admin")){ %> 
				<button onclick="location.href='views/community/boardInsertForm.jsp'">작성하기</button>
		<% } %>
 	</div>
 	<script>
	$(function(){
		$('.titleName').mouseenter(function(){
			$(this).parent().css({"text-shadow" :"5px 5px 20px grey"});
		}).mouseout(function(){
			$(this).parent().css({"text-shadow" : "none"});
		}).click(function(){
			var bno = $(this).parent().find('input').val(); // 위에 tr안에 있는 input태그의 hidden을 의미
			location.href = "<%= request.getContextPath() %>/selectOne.bo?bno=" + bno;
		});
	});
 	</script>

 	

 	<br>
 	<br>
 	<br>
 	<br>
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>