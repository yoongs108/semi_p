<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.zipper.question.model.vo.*, java.util.*"%>
<%
	Question qs = (Question)request.getAttribute("qs");
	System.out.println("qs가 넘어오니?" + qs);
	Member ms = (Member)request.getAttribute("ms");
	System.out.println("ms가 넘어오니? " + ms);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 1:1 문의 상세 페이지 </title>
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
   
   	div .content{
      width : 80%;
 	  height : 300px;
	  margin-left : 60px;
   }
   
   	#date{
   	  float : right;
   	  margin-right : 60px;
   }
   
   	section h3{
   	  margin-left : 60px;
   }
   	#adminupdate{
   	  margin-left : 200px;
   	  position: relative;
   	  top : -40px;
   	  width : 80px;
	  height : 30px;
	  color : white;
	  background-color : black;
	  border : none;	
   }
   
   	#adminupdate:hover{
		background-color: #555;
		cursor: pointer;
	}
	
	#delete{
		position : relative;
		float: right;
		top : 23px;
		margin-right : 80px;
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
	
	#memberid {
		padding-left : 25px;
		padding-top : 5px;
		border : none;
	}
</style>
</head>
<body id="body">
<%@ include file="/views/common/header.jsp" %>
<section> 
 	<h1> 1:1 문의내역 </h1>
 	<% if(m != null && m.getMgrd().equals("A")){ %> 
 	<button id="delete" onclick="#"> 삭제 </button>
 	<% } %>
 	<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="notice" id="back" onclick="location.href = '<%= request.getContextPath() %>/selectList.qo?'"> 
		&nbsp;&nbsp;&nbsp;
		
	<hr style="width: 100%; border: solid 0.3px black;">
 	
 	<div>
	<div id="date"> 
		<h4> <%=qs.getQdate() %> </h4>
	</div>
	<br>
	<br>
	<div> 
		<h3 id="title" > <b>문의 제목 </b> 
		<input type="text" readonly="readonly" id="memberid" value="<%= ms.getMid()%>"> 
		</h3>
		<br>
	</div>
 	<div class="content">
 	<%=qs.getQcontent() %>
	</div>
 	</div>

 	<div>
 	<div id="date"> 
		<h4> <%=qs.getQcommentdate() %> </h4>
	</div>
	<br>
	<div> 
 		<h3 id="commenttitle" > <b>문의 답변 </b> </h3>
 		<div>
			<!-- 회원등급이 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 			<% if(m != null && m.getMgrd().equals("A")){ %> 
				<button id="adminupdate" onclick="#"> 답변달기 </button>
				<%-- 삭제에 넣을것 참고 : location.href='<%= request.getContextPath() %>/nDelete.no?bno=<%= bs.getBno()%>' --%> 
			<% } %>
 		</div>
 		
 	<div class="content">
 		<%= qs.getQcomment() %>
 	</div>
 	</div>
 	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>