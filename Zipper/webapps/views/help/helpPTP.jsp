<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>
#body{
	width : 1024px;
	margin-left : 10%;
	margin-right : 10%;
	letter-spacing : 2px;
	}
	
h1{
	margin-left : 60px;
}
.check{
	margin-left : 50%;
	
}
.listArea{
	width : 800px;
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
#back{
		float : right;
	}

</style>
</head>
<body id="body">
 	<%@ include file="/views/common/header.jsp" %>
 	<h1>1:1문의내역
 	<button type="button" id="back">
 		<img src ="../../resources/images/back.png" width="40px" height="40px">
 		<a href="#"></a>
 	</button>
 	</h1>
 	
 	<hr>
 	<br>
 	
 	<div class="tableArea">
 	<form action>
 		<table id="listArea" border="1px">
 		<!-- border은 없앨 예정 보기 쉽게 구분만 잠시 해놓은 것 -->
 		<!-- <col width=0><col width=70% ><cols width=30%>  --> 응 첫번째 행에다가 해주고 위에 Css 정리좀 하고 밑에 클래스나 필요없는거 없애주면 될거같다
 		<!-- tr>th>td*8 : DB구축 전에 임시용 -->
 			<tr>
 				<th width="0"><input type="checkbox" class="check"> </th>
 					<td class="inquireName" width="70%"> 문의제목 </td>
 					<td name="date" width="30%"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td class="inquireName"> 문의제목 </td>
 					<td name="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td class="inquireName"> 문의제목 </td>
 					<td name="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td class="inquireName"> 문의제목 </td>
 					<td name="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td class="inquireName"> 문의제목 </td>
 					<td name="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td class="inquireName"> 문의제목 </td>
 					<td name="date"> 공지 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td class="inquireName"> 문의제목 </td>
 					<td name="date"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th><input type="checkbox" name="check"></th>
 					<td class="inquireName"> 문의제목 </td>
 					<td name="date"> 문의 작성일 </td>
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
	$(function(){
		$('.inquireName').mouseenter(function(){
			$(this).parent().css({"background" :"lightmint"});
		}).mouseout(function(){
			$(this).parent().css({"text-shadow" : "none"});
		
	});
 	</script>
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>