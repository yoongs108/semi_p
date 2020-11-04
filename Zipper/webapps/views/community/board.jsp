<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	#body{
	widtd : 1024px;
	margin-left : 50px;
	margin-right : 50px;
	letter-spacing : 2px;
	}
	h1{
		margin-left : 50px;
	}
	table{
		width : 100%;
		height : auto;
	}
	tr>th>a{
		text-align : center;
	}
	#date{
		text-align : center;
	}
	
</style>
</head>
<body id="body">
 	<%@ include file="/views/common/header.jsp" %>
 	<h1>NOTICE</h1>
 	<button> </button>
 	<hr>
 	<br>
 	<div class="tableArea">
 	<form action>
 		<table id="listArea" border="1px">
 		<!-- border은 없앨 예정 보기 쉽게 구분만 잠시 해놓은 것 -->
 		<col width=0><col width=70% ><cols width=30%>
 		<!-- tr>th>td*7 : DB구축 전에 임시용 -->
 			<tr>
 				<th><a href="views/community/boardDetail.jsp"> > </a></th>
 					<td id="titleName"> 공지사항 title </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="상세페이지"></a> > </th>
 					<td id="titleName"> 공지사항 title </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="상세페이지"></a> > </th>
 					<td id="titleName"> 공지사항 title </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="상세페이지"></a> > </th>
 					<td id="titleName"> 공지사항 title </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="상세페이지"></a> > </th>
 					<td id="titleName"> 공지사항 title </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="상세페이지"></a> > </th>
 					<td id="titleName"> 공지사항 title </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><a href="상세페이지"></a> > </th>
 					<td id="titleName"> 공지사항 title </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 		</table>
 	</form>
 	</div>
 	<div>
 		<% if(m != null && m.getUserId().equals("admin")){ %> 
				<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			<% } %>
			<!-- 작성자 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 	</div>
 	

 	<br>
 	
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>