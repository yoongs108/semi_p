<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.zipper.board.model.vo.*"%>
<%
	Board board = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>

<title>Guide 상세페이지</title>
<style>
* {
  box-sizing: border-box;
}


/* Content */
.content {
  background-color: white;
  padding: 10px;
}

.title{
		height : 30px;
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
</style>

<script>
	function moveGuideMain() {
		$(this).on('click', function() {
			location.href = "guide.jsp";
		});
	}	
</script>


</head>
<body>
<section>
<%@ include file="/views/common/header.jsp" %>

<div style="border-bottom: 1px solid black;">
	
		<div class="title">
		<h2 id="title">GUIDE 상세페이지</h2>
		
		<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="class1" id="back" onclick="goGuideMain()"> 

		</div>
		</div>
		
		
		<div class="content">
  <img src="<%= request.getContextPath() %>/resources/images/fileUpload/<%= board.getBoardfile() %>" alt="detail1" style="width:50%;height:50%">
  <h3><%= board.getBtitle() %></h3>
  <p>
  <%= board.getBcontent() %>
  </p>
</div>

</section>

<%@ include file="/views/common/footer.jsp" %>

<script>
	function goGuideMain(){
		location.href = "<%= request.getContextPath() %>/selectList.gu";
	}
</script>

</body>
</html>