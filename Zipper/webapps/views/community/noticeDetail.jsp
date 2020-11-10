<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.board.model.vo.*, java.util.*"%>
<%
	Board bs = (Board)request.getAttribute("board");
	System.out.println("board가 넘어오나?"+bs);
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
	
	#adminwrite{
		position : relative;
		float: right;
		top : 23px;
		margin-right : 100px;
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
	
	#delete{
		position : relative;
		float: right;
		top : 23px;
		margin-right : 30px;
		width : 80px;
		height : 30px;
		color : white;
		background-color : black;
		border : none;	
	}
	#delete:hover{
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
				<button id="adminwrite" onclick="location.href='<%= request.getContextPath() %>/nUpdate.no?bno=<%= bs.getBno()%>'"> 수정 </button>
				<button id="delete" onclick="location.href='<%= request.getContextPath() %>/nDelete.no?bno=<%= bs.getBno()%>'"> 삭제 </button>
		<% } %>
 	</div>
 	
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