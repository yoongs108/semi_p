<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.board.model.vo.*, java.util.*"%>
<%
	Board bs = (Board)request.getAttribute("bs");
	System.out.println("bs가 넘어오나?"+bs);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 공지사항 상세 페이지 </title>
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
   
    #title{
   	  float : left;
   	  margin-left : 60px;
   	  font-weight : bold;
   	  text-decoration: underline;
   	  
   }
   
    #date{
   	  float : right;
   	  margin-right : 60px;
   	  text-align : center;
   	  padding-top : 5px;
   	 }
   	 
	#content{
		width : 80%;
		height : 500px;
		margin-left : 100px;
		font-size : 15px;
	}
	
   	  
</style>
</head>
<body id="body">
<section> 
 	<%@ include file="/views/common/header.jsp" %>
 	<h1> NOTICE </h1>
 	<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="notice" id="back" onclick="location.href = '<%= request.getContextPath() %>/selectList.no?'"> 
		&nbsp;&nbsp;&nbsp;
		
	<hr style="width: 100%; border: solid 0.3px black;">
	

	<div>
		<h3 id="title"> <%= bs.getBtitle() %></h3>
		<h4 id="date"> <%= bs.getBdate() %></h4>
	</div>
	
	<br>
 	<br>
 	<br>
 	<br>
 	<br>
 	<div id="content">
		<%= bs.getBcontent() %>
 	</div>
 	<!-- DB구축 시 가지고 와야할 구문  -->
 	
 	<%-- <div><%=b.getBcontent()</div>--%>
 	
 	<%--
 	<div>
 	<%
		if (m != null && m.getUserName().equals(b.getBwriter())) {
		// 게시글 작성자와 가입한 아이디가 같으면 수정하기가 보이게 하는 코드구현
		%>
		<button
			onclick="location.href='<%=request.getContextPath()%>/bUpView.bo?bno='+<%=b.getBno()%>">
			<!--  수정하는 화면으로 넘어가는 url mappings -->
				수정하기
		</button>
			<%
				}
			%>
 	</div>
 	 --%>
 	 
 </section>
	 <%@ include file="/views/common/footer.jsp" %>
</body>
</html>