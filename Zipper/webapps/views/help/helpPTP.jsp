<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.question.model.vo.*, com.zipper.board.model.vo.*, java.util.*"%>
    
<%
	ArrayList<Question> list = (ArrayList<Question>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
<%@ include file="/views/common/header.jsp" %>
<section>
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
					
					<%-- title 클릭 시 상세페이지로 넘어감 --%>
					<th>
						<input type="checkbox" id="check" name="check" disabled
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
     
	<div style="text-align : center;">
		<button class="w3-bar-item w3-button w3-hover-black"
       			onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
			<button class="w3-bar-item w3-button" disabled><</button>
		<% } else { %>
		<button class="w3-bar-item w3-button w3-hover-black"
				onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%=currentPage - 1 %>'"><</button>
		<% } %>
		<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){	
		%>
			<button class="w3-bar-item w3-button" disabled><%= p %></button>
		<%      }else{ %>
			<button class="w3-bar-item w3-button w3-hover-black"
					onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%= p %>'"><%= p %></button>
		<%      } %>
		<% } %>
         
        <%  if(currentPage >= maxPage){  %>
		<button class="w3-bar-item w3-button" disabled>></button>
		<%  }else{ %>
		<button class="w3-bar-item w3-button w3-hover-black" 
				onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%=currentPage + 1 %>'">></button>
		<%  } %>
		<button class="w3-bar-item w3-button w3-hover-black"
				onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%= maxPage %>'">>></button>
	</div>
	
 	<script>
 	$(function(){
		$('section').find('tr').mouseenter(function(){
			$(this).css({"background" : "#CCC", "opacity" : "1.0", "transition" : "0.4s"});
		}).mouseout(function(){
			$(this).css({"background" : "none"});
		}).click(function(){
			var qno = $(this).find('input').eq(0).val(); // tr안에 있는 input태그의 hidden을 의미
			var mno = $(this).find('input').eq(1).val(); // input의 mno 데리고 가기 
			// alert("qno"+qno + "mno" + mno);
			location.href = "<%= request.getContextPath() %>/selectOne.qo?qno="+qno+"&mno="+mno;
		});
	});
 	</script>
 	</section>
</body>
<%@ include file="/views/common/footer.jsp" %>
</html>