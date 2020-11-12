<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.zipper.board.model.vo.*" %>
<%
	ArrayList<Board> list1 = (ArrayList<Board>)request.getAttribute("list1");
	ArrayList<Board> list2 = (ArrayList<Board>)request.getAttribute("list2");
	ArrayList<Board> list3 = (ArrayList<Board>)request.getAttribute("list3");
	ArrayList<Board> list4 = (ArrayList<Board>)request.getAttribute("list4");
	ArrayList<Board> list5 = (ArrayList<Board>)request.getAttribute("list5");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>

	section {
		width: 1024px;
		margin-left:auto;
		margin-right:auto;
	}
	
	#searchDiv {
		width: 40%;
		border: 1px solid black;
		height: 30px;
		position: relative;
		left: 30%;		
		margin-top: 100px;
	}
	
	#searchTool, #searchBtn {
		border: 0px;
	}
	
	#searchTool:focus, #searchBtn:focus {
		outline: none;
	}
	
	#searchBtn {
		margin-right: 50px;
	}
	
	#selectDiv button:hover {
		background-color: #ccc;
	}
	
	#selectDiv button:focus {
		outline: none;
	}
	
	#selectDiv button {
		border:0px;
		width: 90px;
		height: 90px;
		margin-left: 30px;
		margin-right: 30px;
		margin-top: 140px;
		margin-bottom: 100px;
	}
	
	.accordion {
  		background-color: #eee;
  		color: #444;
  		cursor: pointer;
  		padding: 18px;
  		width: 100%;
  		text-align: left;
  		border: none;
  		outline: none;
  		transition: 0.4s;
	}

	.active, .accordion:hover {
  		background-color: #ccc;
	}
	
	.accordion:after {
  		content: '\02795'; 
  		font-size: 13px;
  		color: #777;
  		float: right;
  		margin-left: 5px;
	}
	
	#searchDiv>button:hover {
		
	}
	
	#selectDetail>div{
		align: center;
		margin-left: 60px;
		margin-right: 60px;
	}
	
	#selectDetail>div>div{
		align: center;
		background: rgb(245,245,245);
	}
	
	#btnImg {
		width: 25px;
		height: 25px;
		background: white;
	}
	
	.accordion_hide {
		height : 0;
		overflow : hidden;
	}
	
	section>h1:hover {
		cursor:pointer;
	}
	
	#selectDiv>button, #adminBtn>button {
		color : white;
		background-color : black;
		border : none;
	}
	
	#selectDiv>button:hover, #adminBtn>button:hover {
		background-color: #555;
		cursor: pointer;
	}
	
	#adminBtn>button{
		width:80px;
		height: 50px;
		margin-left:auto;
	}
	
</style>
<script>
	document.getElementsByClassName('accordian');

	function fnMove(seq) {
    	var offset = $(".tabcontent" + (seq + 1)).offset();
    	var winH = $(".tabcontent" + (seq+1)).height();
    	$('html, body').animate({scrollTop : (offset.top - winH*1.5)}, 400);
	};
	
	function accordion_hide(obj) {
		console.log(obj);
		$(obj).parent().find('p').toggleClass('accordion_hide');
	};
	
	function complete(){
		$(this).on("click", function() {
			location.href="<%= request.getContextPath()%>/zipUpdate.zp";
		});
	}
	
	function search(){
		location.href="<%=request.getContextPath()%>/searchFaq.fq?keyword="+$('#searchTool').val();
	}
	
	function enterKey() {
		if (event.keyCode==13){
			location.href="<%=request.getContextPath()%>/searchFaq.fq?keyword="+$('#searchTool').val();
		}
	}
	
</script>
</head>
<body>
 	<%@ include file="/views/common/header.jsp" %>
 
 	<section>
 	<div  style="border-bottom:1px solid black">
 		<h1 align="center" onclick="location.href='<%=request.getContextPath()%>/helpfaq.fq'">FAQ page</h1>
 	</div>

 	<!-- 검색 영역  / (CSS 작업 필요, 링크 연결용 코드 필요) -->
 	<div align="center" id="searchDiv">
 		<button type="button" id="searchBtn" style="background:white" onclick="search()">
 			<img src="<%= request.getContextPath() %>/resources/images/magnifier_icon.png" alt="검색" id="btnImg"/>
 		</button>
 		<input type="search" id="searchTool" placeholder="무엇을 검색하시겠습니까?" onKeyDown="enterKey();"/>
 	</div>
 	
 	<!-- 버튼 5개 영역  / (CSS 작업 필요)-->
 	<div class="selectDiv" id="selectDiv" align="center">
 		<button onclick="fnMove(1)">클래스</button>
 		<button onclick="fnMove(2)">결제</button>
 		<button onclick="fnMove(3)">배송</button>
 		<button onclick="fnMove(4)">환불</button>
 		<button onclick="fnMove(5)">글쓰기</button>
 	</div>
 	
 		<% if (m != null && m.getMgrd().equals("A")) { %>
			<div align="right" id="adminBtn">
				<button onclick="complete();">수정하기</button>
			</div>
		<% } %>
 	<hr />

 	<!-- 하단 내용영역 (아코디언방식 사용)  / (CSS 작업 필요)-->
 	<div id="selectDetail">
 		<div class='tabcontent1'>
 			<h3>클래스</h3>
 			<% for (Board b : list1) { %>
			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Q. <%= b.getBtitle() %> </button>
				<p class="accordion_hide" style="margin-left:50px;"><%= b.getBcontent() %></p>
			</div>
			<% } %>
			<br /><br />
 		</div> <hr />
 		
 		<div class='tabcontent2'>
 			<h3>결제</h3>
 			<% for (Board b : list2) { %>
			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Q. <%= b.getBtitle() %> </button>
				<p class="accordion_hide"><%= b.getBcontent() %></p>
			</div>
			<% } %>
			<br /><br />
 		</div> <hr />
 		<div class='tabcontent3'>
 			<h3>배송</h3>
 			<% for (Board b : list3) { %>
			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Q. <%= b.getBtitle() %> </button>
				<p class="accordion_hide"><%= b.getBcontent() %></p>
			</div>
			<% } %>
			<br /><br />
 		</div> <hr />
 		<div class='tabcontent4'>
 			<h3>환불</h3>
 			<% for (Board b : list4) { %>
			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Q. <%= b.getBtitle() %> </button>
				<p class="accordion_hide"><%= b.getBcontent() %></p>
			</div>
			<% } %>
			<br /><br />
 		</div> <hr />
 		<div class='tabcontent5'>
 			<h3>글쓰기</h3>
 			<% for (Board b : list5) { %>
			<div>
 				<button class="accordion" onclick="accordion_hide(this)">Q. <%= b.getBtitle() %> </button>
				<p class="accordion_hide"><%= b.getBcontent() %></p>
			</div>
			<% } %>
			<br /><br /><br />
 		</div>
 		<div class="tabcontent6"></div>
 	</div>

	
 	</section>
 	
 	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>