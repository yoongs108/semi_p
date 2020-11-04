<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
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
</style>
</head>
<body id="body">
 	<%@ include file="/views/common/header.jsp" %>
 	<h1>1:1문의내역</h1>
 	<hr>
 	<br>
 	<div class="tableArea">
 	<form action>
 		<table id="listArea" border="1px">
 		<!-- border은 없앨 예정 보기 쉽게 구분만 잠시 해놓은 것 -->
 		<col width=0><col width=70% ><cols width=30%>
 		<!-- tr>th>td*8 : DB구축 전에 임시용 -->
 			<tr>
 				<th><input type="checkbox" name="check"> </th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td id="titleName"> 문의제목 </td>
 					<td id="date"> 문의 작성일 </td>
 			</tr>
 		</table>
 	</form>
 	</div>
 	<div>
 		<% if(m != null){ %> 
				<button onclick="location.href='views/community/noticeInsertForm.jsp'">작성하기</button>
			<% } %>
			<!-- 작성자 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 	</div>
 	<script>
			$(fnction(){
			$('#titleName').mouseenter(function(){
				$(this).parent().css({"background" : "mint", "cursor" : "pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background" : "white"});
			}).click(function(){
				var bno = $(this).parent().find('input').val(); // 위에 tr안에 있는 input태그의 hidden을 의미
				location.href = "<%= request.getContextPath() %>"
			});
			});
	</script>
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>