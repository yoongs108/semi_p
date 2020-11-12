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
   
   	div.content{
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
   	#adminwrite{
   	  margin-left : 200px;
   	  position: relative;
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
	
	#comment{
		border : none;
		resize : none;
		width : 85%;
		height : auto; 
		min-height : 200px; 
		min-width: 500px; 
	}
	
	div#comdate{
   	    float : right;
   	    margin-right : -60px;
   	    width : 20%;
   	   
   	}
   	input[name=qcomdate]{
   		border : none;
   	}
   	
   	#check{
		position : relative;
		float: right;
		top : -40px;
		margin-right : 630px;
		width : 80px;
		height : 31px;
		color : white;
		background-color : black;
		border : none;	
	}
	
	#check:hover{
		background-color: #555;
		cursor: pointer;
	}
   
</style>
</head>
<body id="body">
<%@ include file="/views/common/header.jsp" %>
<section> 
 	<h1> 1:1 문의내역 </h1>
 	<!-- 관리자 권한 : 삭제 -->
 	<% if(m != null && m.getMgrd().equals("A")){ %> 
 	<button id="delete" onclick="location.href='<%= request.getContextPath() %>/qDelete.qo?qno=<%= qs.getQno()%>'"> 삭제 </button>
 	<% } %>
 	
 	<!-- 뒤로가기 -->
		<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
			alt="notice" id="back" onclick="location.href = '<%= request.getContextPath() %>/selectList.qo?'"> 
		&nbsp;&nbsp;&nbsp;
		
	<hr style="width: 100%; border: solid 0.3px black;">
 	
 	<!-- 문의 내용 -->
 	<div id="bigtitle">
	<div id="date"> 
		<h4> <%=qs.getQdate() %> </h4>
	</div>
	<br>
	<br>
		<h3 id="title" > <b>문의 제목 </b>
		<% if(m != null && m.getMgrd().equals("A")){ %> 
		<input type="text" readonly="readonly" id="memberid" value="<%= ms.getMid()%>"> 
		<% } %>
		</h3>
		<br>
 	<div class="content">
 		<%=qs.getQcontent() %>
	</div>
	</div>
	<hr />


	<!-- 답변 작성 -->
 	<div>
 	<form class="answer" action="<%=request.getContextPath()%>/insertComment.qo?" method="post">
	<input type="hidden" name="mno" value="<%=m.getMno()%>"/>
	<input type="hidden" name="qno" value="<%=qs.getQno()%>"/>
	
 	<div id="comdate"> 
		<h4> <input type="text" name="qcomdate" value="<%=qs.getQcomdate() != null ? qs.getQcomdate(): ' ' %>" /> </h4>
	</div>
	<br>
 		<h3 id="commenttitle" > <b>문의 답변 </b> </h3>
 		<div>
			<!-- 회원등급이 admin으로 로그인할 때만 확인 되도록 조건문 넣어줌 -->
 			<% if(m != null && m.getMgrd().equals("A")){ %> 
 			<button type="button" id="adminwrite" onclick="update()"> 수정 </button> 
 		
 			<input type="submit" value="수정완료" id="check" style="display : none;"/>
 		
			<% } %>
 		</div>
 	<div class="content" >
 		<textarea id="comment" name="qcomment" readonly="readonly"> <%= qs.getQcomment() != null ? qs.getQcomment(): ' ' %> </textarea>
 		
 	</div>
 	
 	<script>
 		function update(){
 			if($('#comment').prop('readonly')){
 				$('#comment').attr('readonly', false);
 				$('#check').css("display","inline-block");
 			} else {
 				$('#comment').attr('readonly', true);
 				$('#check').css("display","none");
 			}
 		}
 	</script>
 	</form>
 	</div>
 	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>