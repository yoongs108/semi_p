<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 
<%
	ArrayList<Question> list = (ArrayList<Question>) request.getAttribute("list");
%>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>1:1 문의</title>
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
	
	#listArea{
	  width : 100%;
	  height : 100%;
	  margin : 30px 30px;
	}
	
	table tr{
	  height:40px; 
	}
	
	.date{
	  text-align : center;
	}

	.inquireName{
		padding-left : 5px;
	}
</style>
</head>
<body id="body">
<section>
 	<%@ include file="/views/common/header.jsp" %>
 	<h1>1:1문의내역</h1>
 	<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="notice" id="back" onclick="goMyPageMain()"> 
		&nbsp;&nbsp;&nbsp;

	<hr style="width: 100%; border: solid 0.3px black;">
	<br>
	
 	<div class="tableArea">
 	<form action>
 		<table id="listArea">
 		<!-- tr>th>td*8 : DB구축 전에 임시용 -->
 			<tr>
 				<th><input type="checkbox" class="check"> </th>
 					<td class="inquireName" width="80%"> 문의제목 </td>
 					<td class="date" width="20%"> 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th width="0"><input type="checkbox" class="check"> </th>
 					<td class="inquireName" > 문의제목 </td>
 					<td class="date" > 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th width="0"><input type="checkbox" class="check"> </th>
 					<td class="inquireName" > 문의제목 </td>
 					<td class="date" > 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th width="0"><input type="checkbox" name="check"> </th>
 					<td class="inquireName"> 문의제목 </td>
 					<td class="date" > 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th width="0"><input type="checkbox" name="check"> </th>
 					<td class="inquireName"> 문의제목 </td>
 					<td class="date" > 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th width="0"><input type="checkbox" name="check"> </th>
 					<td class="inquireName"> 문의제목 </td>
 					<td class="date" > 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th width="0"><input type="checkbox" name="check"> </th>
 					<td class="inquireName" > 문의제목 </td>
 					<td class="date" > 문의 작성일 </td>
 			</tr>
 			<tr>
 				<th width="0"><input type="checkbox" name="check"> </th>
 					<td class="inquireName"> 문의제목 </td>
 					<td class="date" > 문의 작성일 </td>
 			</tr>
 <%-- 
 			<% if(list.size()==0){ %>
 				<tr>
 					<td colspan="3"> 글이 존재하지 않습니다. </td>
 				</tr>
 			<%
 				}else {
					for (Question c : list) {
				%>
				<tr>
					<input type="hidden" value="<%=b.getQno()%>">
					<input type="hidden" value="<%=b.getMno()%>">
					<th><a href="views/community/helpPTPDetail.jsp" > > </a></th>
					<td class="inquireName" width="80%"><%=b.getQtitle()%></td>
					<td name="date" width="20%"><%=b.getQdate()%></td>
				</tr>
			<%
					}
				}
			%>
--%>
 		</table>
 	</form>
 	</div>
 	<div>
 		<% if(m != null){ %> 
				<button onclick="location.href='views/community/noticeInsertForm.jsp'">작성하기</button>
			<% } %>
			<!-- 작성자 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 	</div>
 	 <!-- Pagination -->
  	<div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
 	<script>
	$(function(){
		$('.inquireName').mouseenter(function(){
			$(this).parent().css({"background" : "#87CEFA", "opacity" : "1.0"});

		}).mouseout(function(){
			$(this).parent().css({"background" : "none"});
		});
	});
 	</script>
 	</section>
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>