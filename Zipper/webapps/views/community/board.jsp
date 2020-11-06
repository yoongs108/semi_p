<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>공지사항</title>
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

	th a{
		color : black;
		margin-right : 5px;
	}
</style>
</head>
<body id="body">
<section> 
 	<%@ include file="/views/common/header.jsp" %>
 	<h1> NOTICE </h1>
		
	<hr style="width: 100%; border: solid 0.3px black;">
 	<br>
 	
 	<div class="tableArea">
 	<form action>
 		<table id="listArea"">
 		
 		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>
		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>
		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>
		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>
		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>
		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>
		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>
		<tr>
				<th><a href="views/community/boardDetail.jsp" > > </a></th>
				<td class="titleName" width="80%">공지사항</td>
				<td class="date" width="20%"> 공지사항 작성일 </td>
		</tr>

		<!-- 공지사항 리스트  -->
 			<% if(list.size()==0){ %>
 				<tr>
 					<td colspan="3"> 글이 존재하지 않습니다. </td>
 				</tr>
 			<%
 				}else {
					for (Board b : list) {
				%>
				<tr>
					<input type="hidden" value="<%=b.getBno()%>">
					<input type="hidden" value="<%=b.getBtype()%>">
					<th><a href="views/community/boardDetail.jsp" > > </a></th>
					<td class="titleName" width="80%"><%=b.getBtitle()%></td>
					<td name="date" width="20%"><%=b.getBdate()%></td>
				</tr>
			<%
					}
				}
			%>

 		</table>
 	</form>
 	</div>

 	<%-- 
			<!-- 작성자 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 		<% if(m != null && m.getUserId().equals("admin")){ %> 
				<button onclick="location.href='views/community/boardInsertForm.jsp'">작성하기</button>
		<% } %>
 	</div>
 	--%>
 	
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
		$('.titleName').mouseenter(function(){
			$(this).parent().css({"background" : "#87CEFA", "opacity" : "1.0"});

		}).mouseout(function(){
			$(this).parent().css({"background" : "none"});
		});
	});
 	</script>

 	

 	<br>
 	<br>
 	<br>
 	<br>
 	<%@ include file="/views/common/footer.jsp" %>
 </section>
</body>
</html>