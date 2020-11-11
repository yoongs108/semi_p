<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.question.model.vo.*, java.util.*"%>
    
<%
	ArrayList<Question> list = (ArrayList<Question>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>1:1 문의</title>
<style>
   section h1{
   	  padding-left : 30px;
   }
   
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
	
	section table tr{
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
 	<h1>1:1 문의내역</h1>
 	<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="notice" id="back" onclick="history.go(-1)"> 
		&nbsp;&nbsp;&nbsp;

	<hr style="width: 100%; border: solid 0.3px black;">
	<br>
	
 	<div class="tableArea">
 	<form action>
 		<table id="listArea">
 		
 		<!-- 게시글 無 -->
 			<% if(list.size()==0){ %>
 				<tr>
 					<td colspan="3"> 글이 존재하지 않습니다. </td>
 				</tr>
 				
 		<!-- 게시글 有 -->
 			<%
 				}else {
					for (Question c : list) { //** 향상된 for문 -> 배열을 쉽게 조회할 때 쓰는 구문 
				%>
				<tr>
					<input type="hidden" value="<%=c.getQno()%>">
					<input type="hidden" value="<%=c.getMno()%>">
					
					<%-- >d=, title 클릭 시 상세페이지로 넘어감 --%>
					<th>
						<input type="checkbox" id="check" name="check" 
													<%= c.getQstate().equals("Y") ? "checked='checked'" : "" %>>
					</th>
					<td class="inquireName" width="80%"> <%=c.getQtitle()%> </td>
					<td name="date" width="20%"><%=c.getQdate()%></td>
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
 	$(function(){
		$('section').find('tr').mouseenter(function(){
			$(this).css({"background" : "#87CEFA", "opacity" : "1.0"});
		}).mouseout(function(){
			$(this).css({"background" : "none"});
		}).click(function(){
			var qno = $(this).find('input').eq(0).val(); // tr안에 있는 input태그의 hidden을 의미
			console.log("qno"+qno);
			location.href = "<%= request.getContextPath() %>/selectOne.qo?qno="+qno;
		});
	});
 	</script>
 	</section>
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>