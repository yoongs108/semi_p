<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	System.out.println("공지사항페잊왓따:"+list);
	// 현재 로그인 정보 가져오기 
	Member mlogin = (Member)session.getAttribute("member");
	System.out.println("dddddd"+mlogin.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>공지사항</title>
<style>
   h1{
   	  padding-left : 30px;
   }
   
   section {
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
   }
   
	#listArea{
		width : 100%;
		height : 100%;
		margin : 50px 50px;
	}
	
	table tr{
		height:40px; 
		font-size : 17px;
	}
	
	.date{
		text-align : center;
	}

	th {
		color : black;
		padding-right :10px;
		width: 2%;
	}
	
	#adminwrite{
		position : relative;
		float: right;
		top : -40px;
		width : 80px;
		height : 30px;
		color : white;
		background-color : black;
		border : none;	
	}
	#adminwrite:hover{
		background-color: #555;
		cursor: pointer;
	}
</style>
</head>
<body id="body">
<section> 
 	<%@ include file="/views/common/header.jsp" %>
 	<h1> NOTICE </h1>
 	<div>
			<!-- 회원등급이 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 		<% if(m != null && m.getMgrd().equals("A")){ %> 
				<button id="adminwrite" onclick="location.href='views/community/noticeInsertForm.jsp'"> 작성하기 </button>
		<% } %>
 	</div>
	<hr style="width: 100%; border: solid 0.3px black;">
 	<br>
 	
 	<div class="tableArea">
 	<form action>
 		<table id="listArea"">
 		
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
					<th> > </th>
					<td class="titleName" name="title" width="80%"> <%=b.getBtitle()%></td>
					<td name="date" width="20%"><%=b.getBdate()%></td>
				</tr>
			<%
					}
				}
			%>

 		</table>
 	</form>
 	
 
 	
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
 	// 게시글 선택 시 주는 효과 + 상세 페이지 연결 
 	$(function(){
		$('tr').mouseenter(function(){
			$(this).css({"background" : "#87CEFA", "opacity" : "1.0"});

		}).mouseout(function(){
			$(this).css({"background" : "none"});
		}).click(function(){
			var bno = $(this).find('input').eq(0).val(); // tr안에 있는 input태그의 hidden을 의미
			console.log("bno"+bno);
			location.href = "<%= request.getContextPath() %>/selectOne.no?bno="+bno;
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