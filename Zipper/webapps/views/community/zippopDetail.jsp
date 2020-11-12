<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.zipper.board.model.vo.*, com.zipper.boardComment.model.vo.*, com.zipper.member.model.vo.*" %>
    
<% 	
	Board b = (Board)request.getAttribute("board");
	ArrayList<BoardComment> clist
	= (ArrayList<BoardComment>)request.getAttribute("clist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPPOP 상세보기</title>

<style type="text/css">

	section {
		width: 1024px;
      	margin-left: auto;
      	margin-right: auto;
      	position: relative;
      	top: 30px;
   }
   
   <!-- 코멘트 -->
	.cmtForm button{	
	    width: 80px; !important;
	    height: 30px; !important;
	    color: white; !important;
	    border-radius: 8px; !important;
	    font-size: 9px; !important;
	}
	.cmtForm input {
		width: 300px;
	}
	
	.cmtWrap .thum img{
		width: 50px;
	    height: 50px;
	    border: black;
	    border-width: 1px;
	    border-radius: 50px;
	}
	
	.cmtWrap .ico img{
		width: 20px;
	    height: 20px;	    
	}
		
	.cmtWrap .nick{
		font-weight: bold;
	}
	.cmtWrap .content{
	    color: darkgray;
	}   
      
	#back {
		position : absolute;
		left : 950px;
		height : 80px;
		width: 80px;
		position:relative;
		top: -70px;		
	}
	
	#back:hover{
		cursor: pointer;
		transform: scale(1.2);
	}
	
	#title {
		margin-top: 100px;
		text-align: center;
	}
	
	.top {
		height :170px;
		position: fixed; 
		width: 1024px;
		top: 30px;
	}
  
	.left_page {
		display: inline-block;
		margin-top: 100px;
	
	}
	.right_page {
		position: fixed;
		display: inline-block;
		rigth: 30%;
		margin-left: 20px; 
		margin-top: 100px;
		 
	}
 		
	
	button {
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
		cursor: pointer;
	}
	
	.tabcontent_wrap {
		
		width: 650px;
	}
	
	.tabcontent_wrap p {
		margin-bottom : 30px;
	}
	.page_wrap {
		paddig-top: 100px;
	}
	
	
</style>

</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<section>
		<div class="top" style=" top: 100; background-color: white; border-bottom: 1px solid black;">
			<h2 id="title">ZIPPOP</h2>
			<img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
				 id="back" onclick="goZippopMain()"> 
		</div>
 		
		<div class="page_wrap">
			<div class="left_page">
			
				<div><img src="<%= request.getContextPath() %>/resources/images/zippopUploadFiles/<%= b.getBoardfile() %>" alt="" width="650px" height="500px"/></div>
				<!--<h3><%= b.getBtitle() %></h3>  --> 
										 	<br />
										 	<br />
		 	 	<div class="tabcontent_wrap">
			 		<div class='tabcontent1'>
						<p><%= b.getBcontent() %></p>
		 			
	 			</div>	 		
			</div>
			</div>
		
		
			<div class="right_page">
		
				<h3><%= b.getBwriter() %></h3> <br /><br /> &nbsp;&nbsp;&nbsp;
					
					<% if(m != null && m.getMno() == b.getMno()){ %>
					<button>수정하기</button>
					<button onclick="location.href='<%= request.getContextPath() %>/delete.tn?bno='+<%=b.getBno()%>">삭제하기</button>
					
					<% } %> 
				<div class="cmtWrap">
					<!-- 댓글(cmt) -->
				<% if (clist != null) { %>
					<% for(BoardComment bco : clist) { %>
					<div class="comment">
						
						<span class="thum"><img src="<%= request.getContextPath() %>/resources/images/profile/<%= bco.getProfile() %>" alt="" width="650px" height="500px"/></span>
						<span class="nick"><%= bco.getMnick() %></span>
						<span class="content"><%= bco.getComContent() %></span>
						<span class="ico"><img src="<%= request.getContextPath() %>/resources/images/fileUpload/" alt="" width="650px" height="500px"/></span>
						<% if( m.getMno() == bco.getMno() ) { %>
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/deleteComment.co?bno=<%=b.getBno()%>&comNo=<%=bco.getComNo()%>'">댓글삭제</button>
						<% } else { %>
						<button type="button" disabled>댓글삭제</button>
						<% } %>
					</div>
					<% } %>
				<% } %>
				
				
					
					<!-- 대댓글(recmt)임시 -->
					<!-- <div class="comment re">
						<span class="thum">썸네일 이미지</span>
						<span class="nick">닉네임</span>
						<span class="content">내용</span>
						<span class="ico">아이콘</span>
					</div> -->
					
					<div class="paging">
						
					</div>
					<br />
					<br />
					
					<div class="cmtForm">
					
						<br />
						<br />
						<br />
					<form action="<%= request.getContextPath() %>/insertComment.co" method="post">
					<input type="text" name="comContent" class="cmtForm">
					<input type="hidden" name="bno" value="<%=b.getBno() %>" />				
					<button type="submit">댓글등록</button>
					
					</form>
						
					</div>
				
				</div>				
								
			</div>
		</div>
		
	</section>
	<br />
	<br />
	<br />
	<%@ include file="/views/common/footer.jsp"%>



	<script>
	function goZippopMain() {
		location.href = "<%= request.getContextPath() %>/zippop.zp";
	};
	</script>	
	
	
	
		
		
		
		

		
		
	</script>
	
</body>
</html>